import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/screens/sub_category/sub_categories.dart';
import 'package:t_store/features/shop/controller/category_controller.dart';
import '../../../../common/widgets/shimmer/category_shimmer.dart';
import '../../../../common/widgets/text/vertical_image_text.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(
      () {
        if (categoryController.isLoading.value) return const CategoryShimmer();
        if (categoryController.featuredCategories.isEmpty) {
          return Center(
            child: Text(
              "No Data Found!",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: Colors.white),
            ),
          );
        }
        return SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categoryController.featuredCategories.length,
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];
              if(category.id=='10' || category.id =='8' || category.id =='9' || category.id =='5' || category.id =='11'|| category.id =='12'|| category.id =='13' || category.id =='15' || category.id =='16') return SizedBox();
                return VerticalImageText(
                image: category.image,
                title: category.name,
                onTap: () => Get.to(() => const SubCategoriesScreen()),
              );

              return null;
            },
          ),
        );
      },
    );
  }
}
