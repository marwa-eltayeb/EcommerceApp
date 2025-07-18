import 'package:products_app/features/details/data/product_model.dart';

abstract class SingleProductState {}

class InitialState extends SingleProductState {}

class LoadingState extends SingleProductState {}

class ErrorState extends SingleProductState {
  final String errorMessage;
  ErrorState({required this.errorMessage});
}

class SuccessState extends SingleProductState {
  final ProductModel singleProduct;
  SuccessState({required this.singleProduct});
}