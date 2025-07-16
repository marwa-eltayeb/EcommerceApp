import 'package:flutter/material.dart';

import 'custom_text.dart';

class ProductItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double price;
  final String description;

  const ProductItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 12),

          // Name
          CustomText(
            name: name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          // Description
          CustomText(
            name: description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),

          const SizedBox(height: 12),

          // Price
          CustomText(
            name: "\$${price}",
            style: TextStyle(
              fontSize: 14,
              color: Colors.pink,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
