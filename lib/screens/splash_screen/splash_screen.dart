import 'package:daraz_style_product_listing/routes/app_routes.dart';
import 'package:daraz_style_product_listing/routes/app_routes_key.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void onAppStart() {
    Future.delayed(Durations.medium1, () {
      AppRoutes.instance.go(AppRoutesKey.instance.homeScreen);
    });
  }

  @override
  void initState() {
    super.initState();
    onAppStart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator.adaptive()));
  }
}
