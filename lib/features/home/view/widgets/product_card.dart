import 'package:e_shop/core/constants/app_colors.dart';
import 'package:e_shop/core/extensions/buildcontext/media_query_size.dart';
import 'package:e_shop/features/home/view/widgets/network_image_viewer.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String imgUrl;
  final String name;
  final String desc;
  final double price;
  final double discountPercentage;
  final bool displayDiscountedPrice;
  final void Function()? onTap;

  const ProductCard({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.desc,
    required this.price,
    required this.discountPercentage,
    required this.displayDiscountedPrice,
    required this.onTap,
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
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 0.016 * context.mqSize.height,
          horizontal: 0.041 * context.mqSize.width,
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
            SizedBox(height: 0.017 * context.mqSize.height),
            Text(
              widget.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: blackColor,
                fontSize: 0.02 * context.mqSize.height,
              ),
            ),
            SizedBox(height: 0.008 * context.mqSize.height),
            Text(
              widget.desc,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: blackColor,
                fontSize: 0.02 * context.mqSize.height,
              ),
            ),
            SizedBox(height: 0.0136 * context.mqSize.height),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    ' \$${(widget.price).toInt()}',
                    overflow: TextOverflow.ellipsis,
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
                      fontSize: 0.016 * context.mqSize.height,
                    ),
                  ),
                ),
                if (widget.displayDiscountedPrice)
                  Text(
                    '  \$${(widget.price - discountedPrice).toInt()}',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: blackColor,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      fontSize: 0.016 * context.mqSize.height,
                    ),
                  ),
                if (widget.displayDiscountedPrice)
                  Flexible(
                    child: Text(
                      '  ${(widget.discountPercentage).toStringAsFixed(2)}% off',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xff15F911),
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                        fontSize: 0.016 * context.mqSize.height,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
