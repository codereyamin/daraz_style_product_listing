import 'package:daraz_style_product_listing/models/models.dart';

class HomeScreenProviderState {
  final bool isLoading;
  final bool hasError;
  final List<Product> listOfProduct;
  const HomeScreenProviderState({this.hasError = false, this.isLoading = true, this.listOfProduct = const []});

  HomeScreenProviderState copyWith({final bool? isLoading, final bool? hasError, final List<Product>? listOfProduct}) {
    return HomeScreenProviderState(isLoading: isLoading ?? this.isLoading, hasError: hasError ?? this.hasError, listOfProduct: listOfProduct ?? this.listOfProduct);
  }
}
