import 'package:equatable/equatable.dart';

class RateModel extends Equatable {
  final String? id;
  final String? createdAt;
  final double? rate;
  final String? forUser;
  final String? forProduct;

  const RateModel({
    this.id,
    this.createdAt,
    this.rate,
    this.forUser,
    this.forProduct,
  });

  factory RateModel.fromJson(Map<String, dynamic> json) => RateModel(
    id: json['id'] as String?,
    createdAt: json['created_at'] as String?,
    rate: (json['rate'] as num?)?.toDouble(),
    forUser: json['for_user'] as String?,
    forProduct: json['for_product'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'created_at': createdAt,
    'rate': rate,
    'for_user': forUser,
    'for_product': forProduct,
  };

  RateModel copyWith({
    String? id,
    String? createdAt,
    double? rate,
    String? forUser,
    String? forProduct,
  }) {
    return RateModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      rate: rate ?? this.rate,
      forUser: forUser ?? this.forUser,
      forProduct: forProduct ?? this.forProduct,
    );
  }

  @override
  List<Object?> get props => [id, createdAt, rate, forUser, forProduct];
}
