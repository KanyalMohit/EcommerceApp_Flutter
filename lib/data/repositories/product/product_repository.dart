import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

import '../../../features/shop/models/product_model.dart';
import '../categories/category_repository.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  //// get limited products

  Future<List<ProductModel>> getFeaturedProducts() async {
    try{
      final snapshot = await _db.collection('Products').get();
      final list = snapshot.docs.map((document) => ProductModel.fromSnapshot(document)).toList();

      return list;
    }on FirebaseException catch(e){
      throw TFirebaseException(e.code).message;
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch (e){
      print(e);
      throw "Something went wrong ehhe + $e";

    }
  }



  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      // Upload all the products along with their images
      final storage = Get.put(FirebaseStorageService());
      // Loop through each product
      for (var product in products) {
        // Get image data link from local assets
        final thumbnail =
        await storage.getImageDataFromAssets(product.thumbnail);

        // Upload image and get its URL
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        // Assign URL to product. thumbnail attribute
        product.thumbnail = url;

        // Product list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            // Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);
            // Upload image and get its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);

            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }
        //// upload variation images

        if (product.productType == "ProductType.variable") {
          for (var variation in product.productVariations!) {
            // Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(
                variation.image);

            // Upload image and get its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, variation.image);

            // Assign URL to variation.image attribute
            variation.image = url;
          }
        }

        // Store product in Firestore
        await _db.collection("Products").doc(product.id).set(
            product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}
// Upload dummy data to the Cloud Firebase
