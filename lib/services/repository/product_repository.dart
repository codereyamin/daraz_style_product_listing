import 'package:daraz_style_product_listing/constant/app_api_url.dart';
import 'package:daraz_style_product_listing/models/models.dart';
import 'package:daraz_style_product_listing/services/api/api_services.dart';
import 'package:daraz_style_product_listing/utils/app_log.dart';

class ProductRepository {
  ////////////// Contractures
  ProductRepository._privetContractures();
  static final ProductRepository _instance = ProductRepository._privetContractures();
  static ProductRepository get instance => _instance;

  /////////////// object
  final ApiServices _apiServices = ApiServices.instance;
  final AppApiUrl _apiUrl = AppApiUrl.instance;

  Future<List<Product>> getProduct() async {
    List<Product> listOfProduct = [];
    try {
      var response = await _apiServices.getServices(_apiUrl.products);
      if (response != null) {
        if (response is List) {
          for (var element in response) {
            listOfProduct.add(Product.fromJson(element));
          }
        }
      }
    } catch (e) {
      errorLog("getProduct repo", e);
    }
    return listOfProduct;
  }
}
