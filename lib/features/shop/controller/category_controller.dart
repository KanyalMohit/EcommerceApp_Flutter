
import 'package:get/get.dart';
import 'package:t_store/data/repositories/categories/category_repository.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class CategoryController extends GetxController{

  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;


  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

//// load category data
  Future<void> fetchCategories() async {
      try{
        ////  show loader while loading categories
        isLoading.value = true;
        //// fetching
        final categories = await _categoryRepository.getAllCategories();
        //// update list
        allCategories.assignAll(categories);
        /// filter featured categories
        featuredCategories.assignAll(allCategories.toList());

      }catch (e){
        TLoaders.errorSnackBar(title: "Oh Snap!" , message: e.toString());
      } finally {
        //// remove loader
        isLoading.value = false;
      }

  }


}