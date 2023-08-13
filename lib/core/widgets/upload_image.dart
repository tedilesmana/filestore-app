// ignore_for_file: depend_on_referenced_packages

import 'package:cached_network_image/cached_network_image.dart';
import 'package:filestore/core/config/size_config.dart';
import 'package:filestore/core/controller/xcontroller.dart';
import 'package:filestore/domain/models/post_image/post_image.model.dart';
import 'package:filestore/presentation/post_image/controllers/post_image.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:filestore/theme.dart';
import 'dart:io';
import 'dart:convert';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:photofilters/photofilters.dart';
import 'package:image/image.dart' as imagelib;

class UploadImage extends StatefulWidget {
  final String? title;
  final double? width;
  final double? height;

  const UploadImage({Key? key, required this.title, this.width, this.height})
      : super(key: key);

  @override
  UploadImageState createState() => UploadImageState();
}

class UploadImageState extends State<UploadImage> {
  PostImageController controller = Get.put(PostImageController());
  final XController x = XController.to;
  String? url;

  @override
  void initState() {
    super.initState();
    status = widget.title!;
  }

  final picker = ImagePicker();
  Future<XFile?>? file;
  String status = '';
  String? base64Image;
  File? tmpFile;
  String errMessage = 'Error Upload';

  chooseImage() {
    showMaterialModalBottomSheet(
      context: Get.context!,
      isDismissible: true,
      builder: (context) => SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: Container(
          color: Get.theme.cardColor,
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  Get.back();
                  Future.delayed(const Duration(milliseconds: 400), () {
                    pickImageSource(2);
                  });
                },
                title: const Text("Camera"),
                leading: const Icon(Feather.camera),
                trailing: const Icon(Feather.chevron_right),
              ),
              Divider(color: Get.theme.colorScheme.secondary),
              ListTile(
                onTap: () {
                  Get.back();
                  Future.delayed(const Duration(milliseconds: 400), () {
                    pickImageSource(1);
                  });
                },
                title: const Text("Gallery"),
                leading: const Icon(Feather.image),
                trailing: const Icon(Feather.chevron_right),
              ),
            ],
          ),
        ),
      ),
    );
  }

  pickImageSource(int tipe) {
    setState(() {
      file = picker.pickImage(
        source: tipe == 1 ? ImageSource.gallery : ImageSource.camera,
        maxHeight: 512,
        maxWidth: 512,
      );
      file!.then((XFile? pickFile) {
        Future.delayed(const Duration(milliseconds: 500), () {
          if (pickFile != null) {
            Future.microtask(() {
              _cropImage(File(pickFile.path));
            });
          }
        });
      });
    });
    //setStatus('');
  }

  Future _cropImage(File imageFile) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              //CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ]
          : [
              //CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9
            ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Get.theme.colorScheme.secondary,
            initAspectRatio: CropAspectRatioPreset
                .ratio3x2, //CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Crop Image',
        ),
      ],
    );
    if (croppedFile != null) {
      tmpFile = File(croppedFile.path);
      base64Image = base64Encode(tmpFile!.readAsBytesSync());

      Future.microtask(() {
        goToPhotoFilter(tmpFile);
      });
    }
  }

  List<Filter> filters = presetFiltersList;
  goToPhotoFilter(File? getImage) async {
    debugPrint("goToPhotoFilter...");

    try {
      String fileName = x.basename(getImage!.path);

      var image = imagelib.decodeImage(await getImage.readAsBytes());

      final Map? imagefile = await Get.to(
        PhotoFilterSelector(
          title: const Text("Photo Filter"),
          appBarColor: Get.theme.colorScheme.secondary,
          image: image!,
          filters: presetFiltersList,
          filename: fileName,
          loader: const Center(child: CircularProgressIndicator()),
          fit: BoxFit.contain,
        ),
      );

      if (imagefile != null && imagefile.containsKey('image_filtered')) {
        setState(() {
          tmpFile = imagefile['image_filtered'];
        });
        debugPrint(tmpFile!.path);

        Future.microtask(() {
          base64Image = base64Encode(tmpFile!.readAsBytesSync());
          setStatus('');
          var responseIntance = PostImageModel.fromJson(
            {
              "base64Image": base64Image,
              "tmpFile": tmpFile,
            },
          );
          controller.file.value = responseIntance;
          controller.uploadFile(tmpFile!);
        });
      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  Widget showImage() {
    return (url != null && url != '')
        ? ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: url!,
              fit: BoxFit.cover,
              width: widget.width ?? Get.width / 4.3,
              height: widget.height ?? getProportionateScreenHeight(120),
            ),
          )
        : FutureBuilder<XFile?>(
            future: file,
            builder: (BuildContext context, AsyncSnapshot<XFile?> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  null != snapshot.data) {
                XFile getFile = snapshot.data!;
                tmpFile = File(getFile.path);
                base64Image = base64Encode(tmpFile!.readAsBytesSync());

                return Flexible(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            tmpFile!,
                            fit: BoxFit.cover,
                            width: widget.width ?? Get.width / 4.3,
                            height: widget.height ??
                                getProportionateScreenHeight(120),
                          ),
                        ),
                      ),
                      // if (status != 'Uploaded')
                      //   Positioned(
                      //     top: 0,
                      //     bottom: 0,
                      //     left: 0,
                      //     right: 0,
                      //     child: InkWell(
                      //       onTap: () {
                      //         setStatus('Uploaded');
                      //       },
                      //       child: Container(
                      //         alignment: Alignment.center,
                      //         child: Container(
                      //           padding: padding15,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(10),
                      //             gradient: LinearGradient(
                      //               colors: [
                      //                 MyTheme.accent,
                      //                 MyTheme.accent.withOpacity(.6)
                      //               ],
                      //             ),
                      //           ),
                      //           child: const Text(
                      //             "Upload",
                      //             style: TextStyle(
                      //                 color: Colors.white,
                      //                 fontWeight: FontWeight.bold),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                    ],
                  ),
                );
              } else if (null != snapshot.error) {
                return const Text(
                  'Error Picking Image',
                  textAlign: TextAlign.center,
                );
              } else {
                return Flexible(
                  child: Container(
                    color: Get.isDarkMode ? Colors.grey : Colors.white,
                    child: Image.asset(
                      "assets/image_failed.png",
                      fit: BoxFit.cover,
                      width: widget.width ?? Get.width / 4.3,
                      height:
                          widget.height ?? getProportionateScreenHeight(120),
                    ),
                  ),
                );
              }
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      height: widget.height ?? getProportionateScreenHeight(120),
      padding: const EdgeInsets.all(1.0),
      child: InkWell(
        onTap: chooseImage,
        child: status == 'Uploaded'
            ? Stack(
                children: [
                  showImage(),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: CircleAvatar(
                              radius: widget.width != null ? 25 : 10,
                              backgroundColor: Colors.white,
                              child: Icon(Feather.check_circle,
                                  color: Get.theme.primaryColor,
                                  size: widget.width != null ? 30 : 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  showImage(),
                  spaceHeight5,
                  const Text(
                    'Upload Image',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
