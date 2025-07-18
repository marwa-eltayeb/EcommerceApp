import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_app/core/utils/text_styling.dart';
import 'package:products_app/features/details/presentation/cubit/single_product_cubit.dart';
import 'package:products_app/features/details/presentation/cubit/single_product_states.dart';
import 'package:products_app/features/details/presentation/screens/widgets/product_detail_row.dart';

class DetailsScreen extends StatelessWidget {
  final int productId;

  const DetailsScreen({super.key, required this.productId});

  static const Color backgroundColor = Color(0xFFFFF5F5);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SingleProductCubit(Dio())..getProductById(productId),
      child: BlocConsumer<SingleProductCubit, SingleProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LoadingState) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state is ErrorState) {
            return Scaffold(body: Center(child: Text(state.errorMessage)));
          } else if (state is SuccessState) {
            final product = state.singleProduct;

            return Scaffold(
              backgroundColor: backgroundColor,

              appBar: AppBar(
                backgroundColor: backgroundColor,
                title: Text(
                  product.category.capitalize(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                centerTitle: true,
              ),

              body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          product.imageUrl,
                          height: 180,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "\$${product.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.pink,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        product.description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: ProductDetailRow(
                        label: "Brand",
                        value: product.brand,
                        valueFontStyle: FontStyle.italic,
                      ),
                    ),

                    ProductDetailRow(
                      label: "Rating",
                      value: "${product.rating.toStringAsFixed(2)}/5",
                    ),

                    ProductDetailRow(
                      label: "In Stock",
                      value: "${product.stock} units",
                    ),

                    if (product.discountPercentage > 0)
                      ProductDetailRow(
                        label: "Discount",
                        value:
                            "${product.discountPercentage.toStringAsFixed(2)}% off",
                        valueColor: Colors.green,
                        valueFontWeight: FontWeight.bold,
                      ),

                    ProductDetailRow(
                      label: "Weight",
                      value: "${product.weight}g",
                    ),

                    ProductDetailRow(
                      label: "Warranty",
                      value: product.warrantyInformation,
                    ),

                    ProductDetailRow(
                      label: "Shipping",
                      value: product.shippingInformation,
                    ),

                    ProductDetailRow(
                      label: "Availability",
                      value: product.availabilityStatus,
                    ),
                  ],
                ),
              ),
            );

          } else {
            return const Scaffold();
          }
        },
      ),
    );
  }
}
