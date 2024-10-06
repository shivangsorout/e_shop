import 'package:e_shop/features/home/model/review.dart';

class Product {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final num discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String? brand; // Nullable
  final String sku;
  final int weight;
  final Dimensions dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<Review> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final Meta meta;
  final List<String> images;
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    this.brand, // Nullable
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

  // Factory constructor to create a Product object from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json[idKey],
      title: json[titleKey],
      description: json[descriptionKey],
      category: json[categoryKey],
      price: json[priceKey],
      discountPercentage: json[discountPercentageKey],
      rating: json[ratingKey],
      stock: json[stockKey],
      tags: List<String>.from(json[tagsKey]),
      brand: json[brandKey], // Nullable
      sku: json[skuKey],
      weight: json[weightKey],
      dimensions: Dimensions.fromJson(json[dimensionsKey]),
      warrantyInformation: json[warrantyInformationKey],
      shippingInformation: json[shippingInformationKey],
      availabilityStatus: json[availabilityStatusKey],
      reviews: (json[reviewsKey] as List)
          .map((review) => Review.fromJson(review))
          .toList(),
      returnPolicy: json[returnPolicyKey],
      minimumOrderQuantity: json[minimumOrderQuantityKey],
      meta: Meta.fromJson(json[metaKey]),
      images: List<String>.from(json[imagesKey]),
      thumbnail: json[thumbnailKey],
    );
  }

  // Method to convert a Product object into JSON
  Map<String, dynamic> toJson() {
    return {
      idKey: id,
      titleKey: title,
      descriptionKey: description,
      categoryKey: category,
      priceKey: price,
      discountPercentageKey: discountPercentage,
      ratingKey: rating,
      stockKey: stock,
      tagsKey: tags,
      brandKey: brand, // Nullable
      skuKey: sku,
      weightKey: weight,
      dimensionsKey: dimensions.toJson(),
      warrantyInformationKey: warrantyInformation,
      shippingInformationKey: shippingInformation,
      availabilityStatusKey: availabilityStatus,
      reviewsKey: reviews.map((review) => review.toJson()).toList(),
      returnPolicyKey: returnPolicy,
      minimumOrderQuantityKey: minimumOrderQuantity,
      metaKey: meta.toJson(),
      imagesKey: images,
      thumbnailKey: thumbnail,
    };
  }
}

// Constant keys for Product model
const idKey = 'id';
const titleKey = 'title';
const descriptionKey = 'description';
const categoryKey = 'category';
const priceKey = 'price';
const discountPercentageKey = 'discountPercentage';
const ratingKey = 'rating';
const stockKey = 'stock';
const tagsKey = 'tags';
const brandKey = 'brand';
const skuKey = 'sku';
const weightKey = 'weight';
const dimensionsKey = 'dimensions';
const warrantyInformationKey = 'warrantyInformation';
const shippingInformationKey = 'shippingInformation';
const availabilityStatusKey = 'availabilityStatus';
const reviewsKey = 'reviews';
const returnPolicyKey = 'returnPolicy';
const minimumOrderQuantityKey = 'minimumOrderQuantity';
const metaKey = 'meta';
const imagesKey = 'images';
const thumbnailKey = 'thumbnail';

// Dimension Model
class Dimensions {
  final num width;
  final num height;
  final num depth;

  Dimensions({
    required this.width,
    required this.height,
    required this.depth,
  });

  // Factory constructor to create a Dimensions object from JSON
  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      width: json[widthKey],
      height: json[heightKey],
      depth: json[depthKey],
    );
  }

  // Method to convert a Dimensions object into JSON
  Map<String, dynamic> toJson() {
    return {
      widthKey: width,
      heightKey: height,
      depthKey: depth,
    };
  }
}

// Constant keys for Dimensions model
const widthKey = 'width';
const heightKey = 'height';
const depthKey = 'depth';

// Meta model
class Meta {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String barcode;
  final String qrCode;

  Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  // Factory constructor to create a Meta object from JSON
  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      createdAt: DateTime.parse(json[createdAtKey]),
      updatedAt: DateTime.parse(json[updatedAtKey]),
      barcode: json[barcodeKey],
      qrCode: json[qrCodeKey],
    );
  }

  // Method to convert a Meta object into JSON
  Map<String, dynamic> toJson() {
    return {
      createdAtKey: createdAt.toIso8601String(),
      updatedAtKey: updatedAt.toIso8601String(),
      barcodeKey: barcode,
      qrCodeKey: qrCode,
    };
  }
}

// Constant keys for Meta model
const createdAtKey = 'createdAt';
const updatedAtKey = 'updatedAt';
const barcodeKey = 'barcode';
const qrCodeKey = 'qrCode';
