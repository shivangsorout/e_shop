import 'package:e_shop/core/constants/app_colors.dart';
import 'package:e_shop/features/home/view/widgets/network_image_viewer.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String imgUrl;
  final String name;
  final String desc;
  final double price;
  final double discountPercentage;
  final bool displayDiscountedPrice;

  const ProductCard({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.desc,
    required this.price,
    required this.discountPercentage,
    required this.displayDiscountedPrice,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  double discountedPrice = 0;

  @override
  void initState() {
    if (widget.displayDiscountedPrice) {
      discountedPrice = widget.price * (widget.discountPercentage / 100);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 18,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: NetworkImageViewer(
              imgUrl: widget.imgUrl,
            ),
          ),
          SizedBox(height: 15),
          Text(
            widget.name,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: blackColor,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 7),
          Text(
            widget.desc,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: blackColor,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Text(
                ' \$${(widget.price).toInt()}',
                style: TextStyle(
                  decoration: widget.displayDiscountedPrice
                      ? TextDecoration.lineThrough
                      : null,
                  color: widget.displayDiscountedPrice
                      ? Color(0xff808080)
                      : blackColor,
                  fontWeight: widget.displayDiscountedPrice
                      ? FontWeight.w400
                      : FontWeight.w500,
                  fontStyle: FontStyle.italic,
                ),
              ),
              if (widget.displayDiscountedPrice)
                Row(
                  children: [
                    Text(
                      '  \$${(widget.price - discountedPrice).toInt()}',
                      style: TextStyle(
                        color: blackColor,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      '  ${(widget.discountPercentage).toStringAsFixed(2)}% off',
                      style: TextStyle(
                        color: Color(0xff15F911),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
