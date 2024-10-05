import 'package:e_shop/core/constants/app_colors.dart';
import 'package:e_shop/core/extensions/buildcontext/media_query_size.dart';
import 'package:e_shop/features/home/view/widgets/network_image_viewer.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('e-Shop'),
        ),
        body: GridView.builder(
          controller: _scrollController,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0.0342 * context.mqSize.height,
            crossAxisSpacing: 0.039 * context.mqSize.width,
            childAspectRatio: 0.55,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 0.039 * context.mqSize.height,
            horizontal: 0.046 * context.mqSize.width,
          ),
          scrollDirection: Axis.vertical,
          itemCount: 4,
          itemBuilder: (context, index) {
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
                        imgUrl:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzGZjYoGAucaCujzsBeSVzFsJBg1Aon99pCA&s'),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'iPhone 9',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: blackColor,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    'An apple mobile which is nothing like apple ...',
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
                        ' \$549',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Color(0xff808080),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        '  \$499',
                        style: TextStyle(
                          color: blackColor,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Text(
                        '  12.96% off',
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
            );
          },
        ));
  }
}
