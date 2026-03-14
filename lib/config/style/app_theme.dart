import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_udemy/config/style/text_styles.dart';

import 'app_color.dart';

ThemeData get appTheme => ThemeData(
  inputDecorationTheme: InputDecorationTheme(
    fillColor: AppColors.veryLightSilver,
    filled: true,
    prefixIconColor: AppColors.softGrey,
    hintStyle: AppTextStyle.font16softGrey400,
    prefixStyle: AppTextStyle.font16mainColor700,
    suffixIconColor: AppColors.softGrey,
    errorMaxLines: 4,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(color: AppColors.veryLightSilver, width: 2),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(color: AppColors.veryLightSilver, width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(color: AppColors.mainColor, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(color: AppColors.brightRed, width: 2),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
  ),

  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.transparent,
    modalBackgroundColor: AppColors.white,
    surfaceTintColor: AppColors.white,
  ),
  useMaterial3: true,
  fontFamily: "Montserrat",
  appBarTheme: const AppBarTheme(
    toolbarHeight: 70,
    backgroundColor: Colors.white,
    shadowColor: AppColors.black,
    centerTitle: true,
    shape: RoundedRectangleBorder(
      
      borderRadius: BorderRadiusGeometry.vertical(bottom: Radius.circular(15))
    ),
    iconTheme: IconThemeData( color: AppColors.mainColor),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
  highlightColor: Colors.transparent,
  focusColor: Colors.transparent,
  hoverColor: Colors.transparent,
  colorScheme: const ColorScheme.light(
    primary: AppColors.blue,
    surface: AppColors.white,
  ),
  
);
