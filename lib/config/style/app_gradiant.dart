import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:ecommerce_udemy/config/style/app_color.dart';

class AppGradiant {
  static const splashGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      AppColors.blue5, // Strong dark blue at bottom
      AppColors.blue2, // Medium blue
      AppColors.blue,
    ],
  );

  static const gradientofcard = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.veryLightSilver, AppColors.veryLightSilver, 
    AppColors.white,      AppColors.white],
    stops: [ 0.0,
    0.53,  
    0.5,  
    1.0,],
  );

  static const gradiant2 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.transparent],
  );
  static const gradiant3 = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xBF0162dd), Color(0xBF003477)],
  );
  static const gradiant4 = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xff0162dd), Color(0xff003477)],
  );
}
