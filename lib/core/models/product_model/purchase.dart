import 'package:equatable/equatable.dart';

class Purchase extends Equatable {
  final String? id;
  final String? forUser;
  final String? createdAt;
  final String? forProduct;
  final bool? isPurchased;

  const Purchase({
    this.id,
    this.forUser,
    this.createdAt,
    this.forProduct,
    this.isPurchased,
  });

  factory Purchase.fromJson(Map<String, dynamic> json) => Purchase(
    id: json['id'] as String?,
    forUser: json['for_user'] as String?,
    createdAt: json['created_at'] as String?,
    forProduct: json['for_product'] as String?,
    isPurchased: json['is_purchased'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'for_user': forUser,
    'created_at': createdAt,
    'for_product': forProduct,
    'is_purchased': isPurchased,
  };

  Purchase copyWith({
    String? id,
    String? forUser,
    String? createdAt,
    String? forProduct,
    bool? isPurchased,
  }) {
    return Purchase(
      id: id ?? this.id,
      forUser: forUser ?? this.forUser,
      createdAt: createdAt ?? this.createdAt,
      forProduct: forProduct ?? this.forProduct,
      isPurchased: isPurchased ?? this.isPurchased,
    );
  }

  @override
  List<Object?> get props {
    return [id, forUser, createdAt, forProduct, isPurchased];
  }
}
