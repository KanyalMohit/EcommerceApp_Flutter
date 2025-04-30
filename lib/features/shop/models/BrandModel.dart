class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel(
      {required this.id,
        required this.image,
        required this.name,
        this.isFeatured,
        this.productsCount});

  static BrandModel empty() => BrandModel(id: '', image: '', name: '');

  /// Convert model to Json structure so that you can store data in Firebase
  tojson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductsCount': productsCount,
      'IsFeatured': isFeatured,
    };
  }

  /// Map Json oriented document snapshot from Firebase to UserModel
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
        id: data['id'] ?? '',
        image: data['Image'] ?? '',
        name: data['Name'] ?? '',
        productsCount: data['ProductCount'] ?? 0,
        isFeatured: data['IsFeatured'] ?? false);
  }
}