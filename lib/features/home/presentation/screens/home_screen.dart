import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/core/routing/routes.dart';
import 'package:products_app/features/home/presentation/cubit/product_cubit.dart';
import 'package:products_app/features/home/presentation/cubit/product_states.dart';

import 'widgets/product_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(Dio())..getProducts(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LoadingState) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state is ErrorState) {
            return Scaffold(
              body: Center(child: Text(state.errorMessage)),
            );
          } else if (state is SuccessState) {
            if (state.products.isEmpty) {
              return Scaffold(
                body: Center(child: Text("No Products Yet")),
              );
            } else {

              return Scaffold(
                  backgroundColor: Color(0xFFFFF5F5),
                  body: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        itemCount: state.products.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 15,
                          mainAxisExtent: 280,
                        ),

                        itemBuilder: (context, index) {
                          final product = state.products[index];
                          return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.detailsScreen,
                                arguments: product.id,
                              );
                            },
                            child: ProductItem(
                              imageUrl: product.imageUrl,
                              name: product.title,
                              price: product.price,
                              description: product.description,
                            ),
                          );
                        },

                      ),
                    ),
                  )
              );

            }
          } else {
            return const Scaffold();
          }
        },
      ),
    );
  }
}
