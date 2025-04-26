import 'package:equatable/equatable.dart';

class FavoriteProduct extends Equatable {
  final String? id;
  final String? forUser;
  final String? createdAt;
  final String? forProduct;
  final bool? isFavorite;

  const FavoriteProduct({
    this.id,
    this.forUser,
    this.createdAt,
    this.forProduct,
    this.isFavorite,
  });

  factory FavoriteProduct.fromJson(Map<String, dynamic> json) {
    return FavoriteProduct(
      id: json['id'] as String?,
      forUser: json['for_user'] as String?,
      createdAt: json['created_at'] as String?,
      forProduct: json['for_product'] as String?,
      isFavorite: json['is_favorite'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'for_user': forUser,
    'created_at': createdAt,
    'for_product': forProduct,
    'is_favorite': isFavorite,
  };

  FavoriteProduct copyWith({
    String? id,
    String? forUser,
    String? createdAt,
    String? forProduct,
    bool? isFavorite,
  }) {
    return FavoriteProduct(
      id: id ?? this.id,
      forUser: forUser ?? this.forUser,
      createdAt: createdAt ?? this.createdAt,
      forProduct: forProduct ?? this.forProduct,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [id, forUser, createdAt, forProduct, isFavorite];
}
