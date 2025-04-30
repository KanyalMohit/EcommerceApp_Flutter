import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = ''});

  //// this is empty helper function
  static CategoryModel empty() =>
      CategoryModel(id: '', name: '', image: '', isFeatured: false);

  //// converting model to json structure so we can store data in firebase
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'isFeatured': isFeatured,
    };
  }

  //// Mapping json oriented document snapshot from firebase to UserModel
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document){
    if (document.data() != null) {
      final data = document.data();
      return CategoryModel(id: document.id,
          name: data?['Name'] ?? '',
          image: data?['Image'] ?? '',
          parentId: data?['parentId'] ?? '',
          isFeatured: data?['IsFeatured'] ?? false,
      );
    }else{
      return CategoryModel.empty();
    }
  }

}
