import 'package:cached_network_image/cached_network_image.dart';
import 'package:filestore/config.dart';
import 'package:filestore/core/config/size_config.dart';
import 'package:filestore/core/widgets/loading.dart';
import 'package:filestore/presentation/home/controllers/home.controller.dart';
import 'package:filestore/presentation/list_image/controllers/list_image.controller.dart';
import 'package:filestore/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:filestore/core/animations/touchable_opacity.animate.dart';
import 'package:filestore/infrastructure/navigation/routes.dart';

class ListAllImageSection extends StatefulWidget {
  const ListAllImageSection({Key? key}) : super(key: key);

  @override
  State<ListAllImageSection> createState() => _ListAllImageSectionState();
}

class _ListAllImageSectionState extends State<ListAllImageSection> {
  ListImageController controller = Get.put(ListImageController());

  // int page = 1;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final GlobalKey contentKey = GlobalKey();
  final GlobalKey _refresherKey = GlobalKey();

  void _onRefresh() async {
    await controller.getAllImage(1);
    setState(() {
      _refreshController.refreshCompleted();
    });
  }

  void _onLoading() async {
    await controller.getAllImagePagination(controller.currentPage.value);
    setState(() {
      _refreshController.loadComplete();
    });
  }

  @override
  Widget build(BuildContext context) {
    ListImageController listImageController = Get.put(ListImageController());
    HomeController homeController = Get.put(HomeController());
    final baseUrl = ConfigEnvironments.getEnvironments()['base_url'].toString();

    return RefreshConfiguration.copyAncestor(
      enableLoadingWhenFailed: true,
      context: context,
      headerBuilder: () => const WaterDropMaterialHeader(
        backgroundColor: Colors.blue,
      ),
      footerTriggerDistance: 30,
      child: SmartRefresher(
        key: _refresherKey,
        controller: _refreshController,
        enablePullUp: true,
        physics: const BouncingScrollPhysics(),
        footer: const ClassicFooter(
          loadStyle: LoadStyle.ShowWhenLoading,
        ),
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 0, left: 0, right: 0),
                  width: Get.width - 30,
                  height: 80,
                  child: Obx(
                    () => GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 1,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1 / 1,
                      children: homeController.listCategory.map((item) {
                        return TouchableOpacity(
                          onTap: () {
                            listImageController.category_id.value = item.id!;
                            listImageController.category_name.value =
                                item.name!;
                            listImageController.getAllImage(1);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: item.id ==
                                      listImageController.category_id.value
                                  ? Colors.red
                                  : Colors.blue,
                              borderRadius: const BorderRadius.all(
                                Radius.elliptical(100, 100),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(
                                        0, 0, 0, 0.07999999821186066),
                                    offset: Offset(2, 2),
                                    blurRadius: 3)
                              ],
                            ),
                            child: CircleAvatar(
                              radius: 15,
                              child: CachedNetworkImage(
                                placeholder: (context, url) => Loading.type2(),
                                imageUrl: "$baseUrl${item.image_url}",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(5),
              child: Obx(
                () => GridView.builder(
                  key: contentKey,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: (Get.width) * 0.50,
                    crossAxisSpacing: 15,
                    mainAxisExtent: 200,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: controller.listImage.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Column(
                      children: [
                        TouchableOpacity(
                            onTap: () async {
                              Get.toNamed(
                                Routes.DETAIL_IMAGE,
                                arguments: controller.listImage[index],
                              );
                            },
                            child: Container(
                              width: (Get.width - 30) * 0.50,
                              margin: index % 2 == 1
                                  ? const EdgeInsets.only(right: 15)
                                  : const EdgeInsets.only(left: 15),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Get.theme.cardColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Get.theme.colorScheme.secondary
                                        .withOpacity(.2),
                                    blurRadius: 5.0,
                                    offset: const Offset(2, 5),
                                  )
                                ],
                              ),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(top: 5),
                                          width: Get.width,
                                          height:
                                              getProportionateScreenHeight(120),
                                          decoration: const BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            child: CachedNetworkImage(
                                              placeholder: (context, url) =>
                                                  Loading.type2(),
                                              imageUrl:
                                                  "$baseUrl${controller.listImage[index].image_url}",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        spaceHeight10,
                                        Text(
                                            "${controller.listImage[index].name}",
                                            maxLines: 1,
                                            style: textBold.copyWith(
                                                fontSize: 18)),
                                        Text(
                                          "${controller.listImage[index].description}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: textBold.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        spaceHeight5,
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
