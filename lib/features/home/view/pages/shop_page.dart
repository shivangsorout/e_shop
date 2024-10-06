import 'package:e_shop/core/extensions/buildcontext/media_query_size.dart';
import 'package:e_shop/features/auth/view/pages/login_page.dart';
import 'package:e_shop/features/auth/view/widgets/loading_overlay_wrapper.dart';
import 'package:e_shop/features/auth/view_model/auth_view_model.dart';
import 'package:e_shop/features/home/view/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    return LoadingOverlayWrapper(
      child: Scaffold(
        appBar: AppBar(
          title: Text('e-Shop'),
          actions: [
            IconButton(
              onPressed: () async {
                final authVM =
                    Provider.of<AuthViewModel>(context, listen: false);
                await authVM.logout();
                if (context.mounted) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false,
                  );
                }
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: GridView.builder(
          controller: _scrollController,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 0.025 * context.mqSize.height,
            crossAxisSpacing: 0.039 * context.mqSize.width,
            childAspectRatio: 0.55,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 0.03 * context.mqSize.height,
            horizontal: 0.046 * context.mqSize.width,
          ),
          scrollDirection: Axis.vertical,
          itemCount: 8,
          itemBuilder: (context, index) {
            return ProductCard(
              imgUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzGZjYoGAucaCujzsBeSVzFsJBg1Aon99pCA&s',
              name: 'iPhone 9',
              desc: 'An apple mobile which is nothing like apple ...',
              price: 549,
              discountPercentage: 12.96,
              displayDiscountedPrice: true,
            );
          },
        ),
      ),
    );
  }
}
