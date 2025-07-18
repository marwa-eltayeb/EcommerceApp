import 'package:flutter/material.dart';

class ProductDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;
  final FontWeight? valueFontWeight;
  final FontStyle? valueFontStyle;

  const ProductDetailRow({
    super.key,
    required this.label,
    required this.value,
    this.valueColor,
    this.valueFontWeight,
    this.valueFontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: RichText(
        text: TextSpan(
          children: [

            TextSpan(
              text: "$label: ",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            TextSpan(
              text: value,
              style: TextStyle(
                fontSize: 14,
                color: valueColor ?? Colors.black54,
                fontWeight: valueFontWeight,
                fontStyle: valueFontStyle,
              ),
            ),

          ],
        ),
      ),
    );
  }
}