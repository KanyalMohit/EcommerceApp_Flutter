import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cross_file/cross_file.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/category_model.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  //// variables
  final _db = FirebaseFirestore.instance;

  //// categories

  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection("Categories").get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. please try again";
    }
  }

  //// uploading categories
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try{
      final storage = Get.put(FirebaseStorageService());

      for(var category in categories){
        /// get image link from local assets
        final file = await storage.getImageDataFromAssets(category.image);
        //// upload image
        final url = await storage.uploadImageData('Categories', file, category.name);
        ///// assign url to category
        category.image = url;
        ///// store categories in firestore
        await _db.collection('Categories').doc(category.id).set(category.toJson());

      }

    } on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }
    catch(e){
      throw " Something went wrong";
    }
  }

}

class FirebaseStorageService extends GetxController{
  static FirebaseStorageService get instance => Get.find();
  final _firebaseStorage = FirebaseStorage.instance;

  Future<Uint8List> getImageDataFromAssets(String? path) async {
    try{
      final byteData = await rootBundle.load(path!);
      final imageData = byteData.buffer.asUint8List(byteData.offsetInBytes,byteData.lengthInBytes);
      return imageData;
    }catch(e){
      throw "Error Loading image data";
    }
  }

  Future<String> uploadImageData(String path , Uint8List image , String name) async {
    try{
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    }catch(e){
      throw "Data not uploaded";
    }
  }

  Future<String> uploadImageFile(String path , XFile image) async {
    try{
      final ref = _firebaseStorage.ref(path).child(image.name);

      await ref.putFile(File(image.path));

      final url = await ref.getDownloadURL();
      return url;
    }catch(e){
      throw "Data not uploaded";
    }
  }

}