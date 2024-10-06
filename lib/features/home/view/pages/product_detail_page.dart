import 'package:e_shop/core/constants/app_colors.dart';
import 'package:e_shop/core/constants/constants.dart';
import 'package:e_shop/core/extensions/buildcontext/media_query_size.dart';
import 'package:e_shop/features/home/model/product.dart';
import 'package:e_shop/features/home/view/widgets/image_slider.dart';
import 'package:e_shop/features/home/view/widgets/review_tile.dart';
import 'package:e_shop/features/home/view/widgets/star_ratings.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  final Product productDetails;
  const ProductDetailPage({
    super.key,
    required this.productDetails,
  });

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  double discountedPrice = 0;
  bool displayDiscountedPrice = true;

  @override
  void initState() {
    discountedPrice = widget.productDetails.price *
        (widget.productDetails.discountPercentage / 100);
    settingRemoteConfig();
    super.initState();
  }

  settingRemoteConfig() {
    final remoteConfig = FirebaseRemoteConfig.instance;
    displayDiscountedPrice = remoteConfig.getBool(displayDiscountedPriceKey);
    remoteConfig.onConfigUpdated.listen((RemoteConfigUpdate event) async {
      await remoteConfig.activate();
      setState(() {
        displayDiscountedPrice =
            remoteConfig.getBool(displayDiscountedPriceKey);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('e-Shop'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          // vertical: 0.03 * context.mqSize.height,
          horizontal: 0.046 * context.mqSize.width,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 0.03 * context.mqSize.height,
              ),
              // Image Slider
              SizedBox(
                height: 0.4018 * context.mqSize.height,
                child: ImageSlider(
                  imgList: widget.productDetails.images,
                ),
              ),
              SizedBox(
                height: 0.0342 * context.mqSize.height,
              ),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (displayDiscountedPrice)
                        Text(
                          '-${widget.productDetails.discountPercentage}%',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff15F911),
                          ),
                        ),
                      if (displayDiscountedPrice) SizedBox(width: 10),
                      Text(
                        '₹',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: blackColor,
                        ),
                      ),
                      Text(
                        (displayDiscountedPrice
                                ? (widget.productDetails.price -
                                    discountedPrice)
                                : widget.productDetails.price)
                            .toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                          color: blackColor,
                        ),
                      ),
                    ],
                  ),
                  if (displayDiscountedPrice)
                    Row(
                      children: [
                        Text(
                          'M.R.P.: ',
                          style: TextStyle(
                            color: Color(0xff808080),
                            fontWeight: FontWeight.w400,
                            fontSize: 0.016 * context.mqSize.height,
                          ),
                        ),
                        Text(
                          '₹${widget.productDetails.price}',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Color(0xff808080),
                            fontWeight: FontWeight.w400,
                            fontSize: 0.016 * context.mqSize.height,
                          ),
                        ),
                      ],
                    )
                ],
              ),
              SizedBox(
                height: 0.01 * context.mqSize.height,
              ),
              Text(
                widget.productDetails.title,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 0.025 * context.mqSize.height,
                ),
              ),
              SizedBox(
                height: 0.0114 * context.mqSize.height,
              ),
              Row(
                children: [
                  StarRatings(
                    rating: widget.productDetails.rating,
                  ),
                  SizedBox(
                    width: 0.0121 * context.mqSize.width,
                  ),
                  Text(
                    widget.productDetails.rating.toString(),
                    style: TextStyle(
                      fontSize: 0.0182 * context.mqSize.height,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff12121D),
                    ),
                  ),
                  SizedBox(
                    width: 0.0121 * context.mqSize.width,
                  ),
                  Text(
                    '(${widget.productDetails.reviews.length} Reviews)',
                    style: TextStyle(
                      fontSize: 0.0182 * context.mqSize.height,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffB7B7B7),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 0.0342 * context.mqSize.height,
              ),
              const Text('Description'),
              SizedBox(
                height: 0.0114 * context.mqSize.height,
              ),
              Text(
                widget.productDetails.description,
                style: TextStyle(
                  color: const Color(0xff6F6F6F),
                  fontSize: 0.0205 * context.mqSize.height,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 0.0342 * context.mqSize.height,
              ),
              Text('Reviews (${widget.productDetails.reviews.length})'),
              SizedBox(
                height: 0.0171 * context.mqSize.height,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.productDetails.reviews.length,
                itemBuilder: (context, index) => ReviewTile(
                  review: widget.productDetails.reviews[index],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
