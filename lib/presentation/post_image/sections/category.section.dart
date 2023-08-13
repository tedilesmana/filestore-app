import 'package:cached_network_image/cached_network_image.dart';
import 'package:filestore/config.dart';
import 'package:filestore/core/animations/touchable_opacity.animate.dart';
import 'package:filestore/core/widgets/loading.dart';
import 'package:filestore/presentation/post_image/controllers/post_image.controller.dart';
import 'package:filestore/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final baseUrl = ConfigEnvironments.getEnvironments()['base_url'].toString();
    PostImageController controller = Get.put(PostImageController());
    controller.getAllCategory();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Deskripsi : ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            spaceHeight20,
            Obx(
              () => ListView.builder(
                controller: controller.scrollController,
                shrinkWrap: true,
                itemCount: controller.listCategory.length,
                itemBuilder: (context, index) => TouchableOpacity(
                  onTap: () {
                    controller.selectCategory.value = false;
                    controller.category_id.value = controller.listCategory[index].id!;
                    controller.category_name.value = controller.listCategory[index].name!;
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            child: CachedNetworkImage(
                              placeholder: (context, url) => Loading.type2(),
                              imageUrl:
                                  "$baseUrl${controller.listCategory[index].image_url}",
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            controller.listCategory[index].name ?? "-",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          const Icon(
                            Feather.chevron_right,
                            size: 28,
                          ),
                        ],
                      ),
                      Container(
                        height: 1,
                        color: Colors.black38,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
