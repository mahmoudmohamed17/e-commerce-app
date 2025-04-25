import 'package:equatable/equatable.dart';

import 'favorite_product.dart';
import 'purchase.dart';

class ProductModel extends Equatable {
  final String? productId;
  final String? createdAt;
  final String? productName;
  final double? productCurrentPrice;
  final double? productOldPrice;
  final double? productSale;
  final String? productDescription;
  final String? productCategory;
  final String? productImage;
  final List<FavoriteProduct>? favoriteProducts;
  final List<Purchase>? purchases;

  const ProductModel({
    this.productId,
    this.createdAt,
    this.productName,
    this.productCurrentPrice,
    this.productOldPrice,
    this.productSale,
    this.productDescription,
    this.productCategory,
    this.productImage,
    this.favoriteProducts,
    this.purchases,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    productId: json['product_id'] as String?,
    createdAt: json['created_at'] as String?,
    productName: json['product_name'] as String?,
    productCurrentPrice: json['product_current_price'] as double?,
    productOldPrice: json['product_old_price'] as double?,
    productSale: json['product_sale'] as double?,
    productDescription: json['product_description'] as String?,
    productCategory: json['product_category'] as String?,
    productImage: json['product_image'] as String?,
    favoriteProducts:
        (json['favorite_products'] as List<dynamic>?)
            ?.map((e) => FavoriteProduct.fromJson(e as Map<String, dynamic>))
            .toList(),
    purchases:
        (json['purchases'] as List<dynamic>?)
            ?.map((e) => Purchase.fromJson(e as Map<String, dynamic>))
            .toList(),
  );

  Map<String, dynamic> toJson() => {
    'product_id': productId,
    'created_at': createdAt,
    'product_name': productName,
    'product_current_price': productCurrentPrice,
    'product_old_price': productOldPrice,
    'product_sale': productSale,
    'product_description': productDescription,
    'product_category': productCategory,
    'product_image': productImage,
    'favorite_products': favoriteProducts?.map((e) => e.toJson()).toList(),
    'purchases': purchases?.map((e) => e.toJson()).toList(),
  };

  ProductModel copyWith({
    String? productId,
    String? createdAt,
    String? productName,
    double? productCurrentPrice,
    double? productOldPrice,
    double? productSale,
    String? productDescription,
    String? productCategory,
    String? productImage,
    List<FavoriteProduct>? favoriteProducts,
    List<Purchase>? purchases,
  }) {
    return ProductModel(
      productId: productId ?? this.productId,
      createdAt: createdAt ?? this.createdAt,
      productName: productName ?? this.productName,
      productCurrentPrice: productCurrentPrice ?? this.productCurrentPrice,
      productOldPrice: productOldPrice ?? this.productOldPrice,
      productSale: productSale ?? this.productSale,
      productDescription: productDescription ?? this.productDescription,
      productCategory: productCategory ?? this.productCategory,
      productImage: productImage ?? this.productImage,
      favoriteProducts: favoriteProducts ?? this.favoriteProducts,
      purchases: purchases ?? this.purchases,
    );
  }

  @override
  List<Object?> get props {
    return [
      productId,
      createdAt,
      productName,
      productCurrentPrice,
      productOldPrice,
      productSale,
      productDescription,
      productCategory,
      productImage,
      favoriteProducts,
      purchases,
    ];
  }
}
