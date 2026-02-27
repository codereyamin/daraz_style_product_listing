import 'package:daraz_style_product_listing/screens/home_screen/providers/home_screen_provider_state.dart';
import 'package:daraz_style_product_listing/services/repository/product_repository.dart';
import 'package:daraz_style_product_listing/utils/app_log.dart';
import 'package:flutter_riverpod/legacy.dart';

final homeScreenProvider = StateNotifierProvider((ref) => _HomeScreenProvider());

class _HomeScreenProvider extends StateNotifier<HomeScreenProviderState> {
  _HomeScreenProvider() : super(HomeScreenProviderState()) {
    onDataLoad();
  }

  final ProductRepository _productRepository = ProductRepository.instance;

  Future<void> onDataLoad() async {
    try {
      var products = await _productRepository.getProduct();
      state = state.copyWith(listOfProduct: products, isLoading: false, hasError: false);
    } catch (e) {
      errorLog("onDataLoad provider", e);
      state = state.copyWith(hasError: true);
    }
  }

  Future<void> onDataRefresh() async {
    try {
      state = state.copyWith(isLoading: true, hasError: false, listOfProduct: []);
      var products = await _productRepository.getProduct();
      state = state.copyWith(listOfProduct: products, isLoading: false, hasError: false);
    } catch (e) {
      errorLog("onDataRefresh provider", e);
      state = state.copyWith(isLoading: false, hasError: true, listOfProduct: []);
    }
  }
}
