class ProductModel {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final int weight;
  final DimensionsModel dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<ReviewModel> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final MetaModel meta;
  final List<String> images;
  final String thumbnail;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      discountPercentage: (map['discountPercentage'] ?? 0).toDouble(),
      rating: (map['rating'] ?? 0).toDouble(),
      stock: map['stock'] ?? 0,
      tags: List<String>.from(map['tags'] ?? []),
      brand: map['brand'] ?? '',
      sku: map['sku'] ?? '',
      weight: map['weight'] ?? 0,
      dimensions: DimensionsModel.fromMap(map['dimensions'] ?? {}),
      warrantyInformation: map['warrantyInformation'] ?? '',
      shippingInformation: map['shippingInformation'] ?? '',
      availabilityStatus: map['availabilityStatus'] ?? '',
      reviews: (map['reviews'] as List<dynamic>? ?? [])
          .map((e) => ReviewModel.fromMap(e))
          .toList(),
      returnPolicy: map['returnPolicy'] ?? '',
      minimumOrderQuantity: map['minimumOrderQuantity'] ?? 0,
      meta: MetaModel.fromMap(map['meta'] ?? {}),
      images: List<String>.from(map['images'] ?? []),
      thumbnail: map['thumbnail'] ?? '',
    );
  }
}
class DimensionsModel {
  final double width;
  final double height;
  final double depth;

  DimensionsModel({
    required this.width,
    required this.height,
    required this.depth,
  });

  factory DimensionsModel.fromMap(Map<String, dynamic> map) {
    return DimensionsModel(
      width: (map['width'] ?? 0).toDouble(),
      height: (map['height'] ?? 0).toDouble(),
      depth: (map['depth'] ?? 0).toDouble(),
    );
  }
}
class ReviewModel {
  final int rating;
  final String comment;
  final String date;
  final String reviewerName;
  final String reviewerEmail;

  ReviewModel({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      rating: map['rating'] ?? 0,
      comment: map['comment'] ?? '',
      date: map['date'] ?? '',
      reviewerName: map['reviewerName'] ?? '',
      reviewerEmail: map['reviewerEmail'] ?? '',
    );
  }
}
class MetaModel {
  final String createdAt;
  final String updatedAt;
  final String barcode;
  final String qrCode;

  MetaModel({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory MetaModel.fromMap(Map<String, dynamic> map) {
    return MetaModel(
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
      barcode: map['barcode'] ?? '',
      qrCode: map['qrCode'] ?? '',
    );
  }
}
