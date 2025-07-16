import 'package:products_app/features/home/data/model/product_model.dart';

abstract class ProductState {}

class InitialState extends ProductState {}

class LoadingState extends ProductState {}

class ErrorState extends ProductState {
  final String errorMessage;
  ErrorState({required this.errorMessage});
}

class SuccessState extends ProductState {
  final List<ProductModel> products;
  SuccessState({required this.products});
}