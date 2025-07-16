import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/features/home/presentation/cubit/product_cubit.dart';
import 'package:products_app/features/home/presentation/cubit/product_states.dart';

import 'widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context){
        return ProductCubit(Dio())..getProducts();
      } ,
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state){},
        builder: (context, state){
          return  Scaffold(
              backgroundColor: Color(0xFFFFF5F5),
              body: SafeArea(
                child:
                state is LoadingState ? Center(child: CircularProgressIndicator()) :
                state is ErrorState ? Center(child: Text(state.errorMessage)):
                state is SuccessState ? state.products.isEmpty ? Center(child: Text("No Products Yet")):
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      itemCount: state.products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 15,
                        mainAxisExtent: 280,
                      ),
                      itemBuilder: (context, index) {
                        return ProductItem(
                            imageUrl: state.products[index].imageUrl ?? "No Image",
                            name: state.products[index].title ?? "No Title",
                            price: state.products[index].price ?? 0,
                            description: state.products[index].description ?? "No Description"
                        );
                      },
                    )
                ): SizedBox()
              )
          );
        },
      ),
    );
  }
}