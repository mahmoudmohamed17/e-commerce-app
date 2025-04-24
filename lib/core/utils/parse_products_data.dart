import 'package:e_commerce_app/core/models/product_model/product_model.dart';

List<ProductModel> parseProductsData(List<Map<String, dynamic>> data) {
  return data.map((product) {
    return ProductModel.fromJson(product);
  }).toList();
}
