/*import 'dart:async';

import 'package:ecommerce_udemy/config/style/app_gradiant.dart';
import 'package:ecommerce_udemy/config/style/app_status_bar.dart';
import 'package:ecommerce_udemy/core/widgets/components/app_image_view.dart';
import 'package:ecommerce_udemy/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../config/routes/app_routes.dart';
import '../../utils/app_utils/app_route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _logoOpacity = 0.0;

  @override
  void initState() {
    super.initState();

    AppStatusBar.hide();
    _loading();

    // Start fade-in animation for logo
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _logoOpacity = 1.0;
      });
    });
  }

  _loading() {
    Timer(const Duration(seconds: 3), () {
      RouterApp.pushNamedAndRemoveUntil(RouteName.onboardingScreen);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    AppStatusBar.show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Gradiented(
            gradient: AppGradiant.splashGradient,
            child: AppImageView(
              imagePath: Assets.assetsImagesSplashImage,
              fit: BoxFit.fill,
              width: double.infinity,
            ),
          ),
          AppImageView(
            imagePath: Assets.assetsImagesBack,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
          Positioned(
            bottom: 100.h,
            child: AnimatedOpacity(
              opacity: _logoOpacity,
              duration: const Duration(seconds: 1),
              child: AppImageView(
                imagePath: Assets.assetsImagesLogo,
                fit: BoxFit.fill,
                height: 90.h,
                width: 173.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/