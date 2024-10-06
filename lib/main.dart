import 'package:e_shop/core/constants/app_colors.dart';
import 'package:e_shop/core/constants/constants.dart';
import 'package:e_shop/core/extensions/buildcontext/media_query_size.dart';
import 'package:e_shop/features/auth/repository/firebase_repo.dart';
import 'package:e_shop/features/auth/view/pages/login_page.dart';
import 'package:e_shop/features/auth/view/pages/verify_email_page.dart';
import 'package:e_shop/features/auth/view_model/auth_view_model.dart';
import 'package:e_shop/features/home/view/pages/shop_page.dart';
import 'package:e_shop/features/home/view_model/shop_view_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseRepo().initialize();

  // Remote Configuration setting default value
  final remoteConfig = FirebaseRemoteConfig.instance;
  remoteConfig.setDefaults(const {
    displayDiscountedPriceKey: true,
  });
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => ShopViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-shop App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: lightColor,
          ),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w700,
            color: lightColor,
            fontSize: 0.023 * context.mqSize.height,
          ),
          color: primaryColor,
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 0.0228 * context.mqSize.height,
            color: blackColor,
          ),
        ),
        fontFamily: 'Poppins',
        useMaterial3: true,
        scaffoldBackgroundColor: lightColor,
      ),
      home: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, authVM, _) {
        if (authVM.isAuthenticated) {
          if (authVM.isEmailVerified) {
            return ShopPage();
          } else {
            return VerifyEmailPage();
          }
        } else {
          return LoginPage();
        }
      },
    );
  }
}
