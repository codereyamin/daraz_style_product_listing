import 'package:daraz_style_product_listing/models/models.dart';
import 'package:daraz_style_product_listing/services/api/api_services.dart';

class AuthRepository {
  ////////////// Contractures
  AuthRepository._privetContractures();
  static final AuthRepository _instance = AuthRepository._privetContractures();
  static AuthRepository get instance => _instance;

  /////////////// object
  ApiServices apiServices = ApiServices.instance;

  Future<List<Product>> getProduct() async {
    List<Product> listOfProduct = [];
    try {} catch (e) {}
    return listOfProduct;
  }
}
