import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/features/details/data/product_model.dart';
import 'single_product_states.dart';

class SingleProductCubit extends Cubit<SingleProductState> {

  final Dio dio;

  SingleProductCubit(this.dio) : super(InitialState());

  Future<void> getProductById(int id) async {
    emit(LoadingState());
    try {
      final response = await dio.get('https://dummyjson.com/products/$id');
      final product = ProductModel.fromJson(response.data);
      emit(SuccessState(singleProduct: product));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}