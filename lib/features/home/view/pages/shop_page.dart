import 'package:e_shop/core/constants/app_colors.dart';
import 'package:e_shop/core/constants/constants.dart';
import 'package:e_shop/core/extensions/buildcontext/media_query_size.dart';
import 'package:e_shop/core/helpers/overlays/dialogs/logout_dialog.dart';
import 'package:e_shop/features/auth/view/pages/login_page.dart';
import 'package:e_shop/core/helpers/overlays/overlay_wrapper.dart';
import 'package:e_shop/features/auth/view_model/auth_view_model.dart';
import 'package:e_shop/features/home/view/widgets/product_card.dart';
import 'package:e_shop/features/home/view_model/shop_view_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  late final ScrollController _scrollController;
  ShopViewModel shopViewModel = ShopViewModel();
  bool displayDiscountedPrice = true;

  @override
  void initState() {
    shopViewModel.fetchProducts();
    _scrollController = ScrollController();
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
    return OverlayWrapper(
      viewModel: context.read<AuthViewModel>(),
      child: ChangeNotifierProvider.value(
        value: shopViewModel,
        child: Consumer<ShopViewModel>(
          builder: (context, shopVM, _) {
            return OverlayWrapper(
              viewModel: shopVM,
              child: Scaffold(
                appBar: AppBar(
                  title: Text('e-Shop'),
                  actions: [
                    // Logout Icon for logging out of the application
                    IconButton(
                      onPressed: () {
                        final authVM =
                            Provider.of<AuthViewModel>(context, listen: false);
                        showLogOutDialog(context).then((value) async {
                          if (value) {
                            await authVM.logout();
                            if (context.mounted) {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                                (route) => false,
                              );
                            }
                          }
                        });
                      },
                      icon: Icon(Icons.logout),
                    ),
                  ],
                ),
                body: shopVM.isLoading
                    ? Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    color: primaryColor,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    shopVM.loadingText.isEmpty
                                        ? 'Loading..'
                                        : shopVM.loadingText,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : GridView.builder(
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
                        itemCount: shopVM.products.length,
                        itemBuilder: (context, index) {
                          final product = shopVM.products[index];
                          return ProductCard(
                            onTap: () {},
                            imgUrl: product.thumbnail,
                            name: product.title,
                            desc: product.description,
                            price: product.price,
                            discountPercentage:
                                product.discountPercentage.toDouble(),
                            displayDiscountedPrice: displayDiscountedPrice,
                          );
                        },
                      ),
              ),
            );
          },
          // child:
        ),
      ),
    );
  }
}
