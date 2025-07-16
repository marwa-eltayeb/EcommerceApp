import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/features/home/data/model/product_model.dart';
import 'product_states.dart';

class ProductCubit extends Cubit<ProductState> {

  final Dio dio;
  ProductCubit(this.dio) : super(InitialState());

  Future<void> getProducts() async {
    emit(LoadingState());
    try {
      final response = await dio.get('https://dummyjson.com/products');
      final products = (response.data['products'] as List)
          .map((json) => ProductModel.fromJson(json))
          .toList();
      emit(SuccessState(products: products));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}