import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_udemy/config/style/app_color.dart';

class AppTextStyle {
  ///FontSize
  static final TextStyle _fontSize36 = TextStyle(fontSize: 36.sp);
  static final TextStyle _fontSize30 = TextStyle(fontSize: 30.sp);
  static final TextStyle _fontSize28 = TextStyle(fontSize: 28.sp);
  static final TextStyle _fontSize24 = TextStyle(fontSize: 24.sp);
   static final TextStyle _fontSize22 = TextStyle(fontSize: 22.sp);
  static final TextStyle _fontSize20 = TextStyle(fontSize: 20.sp);
  static final TextStyle _fontSize32 = TextStyle(fontSize: 32.sp);
   static final TextStyle _fontSize17 = TextStyle(fontSize: 17.sp);
  static final TextStyle _fontSize16 = TextStyle(fontSize: 16.sp);
  static final TextStyle _fontSize14 = TextStyle(fontSize: 14.sp);
  static final TextStyle _fontSize13 = TextStyle(fontSize: 13.sp);
  static final TextStyle _fontSize12 = TextStyle(fontSize: 12.sp);
  static final TextStyle _fontSize10 = TextStyle(fontSize: 10.sp);
  static final TextStyle _fontSize11 = TextStyle(fontSize: 11.sp);

  ///FontWeight
  static const TextStyle _fontWeight800 = TextStyle(
    fontWeight: FontWeight.w800,
  );
  static const TextStyle _fontWeight700 = TextStyle(
    fontWeight: FontWeight.w700,
  );
  static const TextStyle _fontWeight600 = TextStyle(
    fontWeight: FontWeight.w600,
  );
  static const TextStyle _fontWeight500 = TextStyle(
    fontWeight: FontWeight.w500,
  );
  static const TextStyle _fontWeight400 = TextStyle(
    fontWeight: FontWeight.w400,
  );
  static const TextStyle _fontWeight300 = TextStyle(
    fontWeight: FontWeight.w300,
  );

  ///Font Family
  static const TextStyle _fontDMSans = TextStyle(
    fontFamily: "IBMPlexSansArabic",
    height: 1.5,
  );

 

 static TextStyle font32black600 = _fontDMSans
      .merge(_fontWeight600)
      .merge(_fontSize32)
      .copyWith(color: AppColors.black);


      
 static TextStyle font16gray400 = _fontDMSans
      .merge(_fontWeight400)
      .merge(_fontSize16)
      .copyWith(color: AppColors.primaryGray);

  static TextStyle font16graytext400 = _fontDMSans
      .merge(_fontWeight400)
      .merge(_fontSize16)
      .copyWith(color: AppColors.primarySmallText);

       static TextStyle font16black500 = _fontDMSans
      .merge(_fontWeight500)
      .merge(_fontSize16)
      .copyWith(color: AppColors.black2);

  static TextStyle font14white600 = _fontDMSans
      .merge(_fontWeight600)
      .merge(_fontSize14)
      .copyWith(color: AppColors.white);


      static TextStyle font16black2600 = _fontDMSans
      .merge(_fontWeight600)
      .merge(_fontSize16)
      .copyWith(color: AppColors.black2);
static TextStyle font16white600 = _fontDMSans
      .merge(_fontWeight600)
      .merge(_fontSize16)
      .copyWith(color: AppColors.white);
      static TextStyle font24black2600 = _fontDMSans
      .merge(_fontWeight600)
      .merge(_fontSize24)
      .copyWith(color: AppColors.black2);
      static TextStyle font16gray600 = _fontDMSans
      .merge(_fontWeight600)
      .merge(_fontSize16)
      .copyWith(color: AppColors.primaryGray);
       static TextStyle font12gray500 = _fontDMSans
      .merge(_fontWeight500)
      .merge(_fontSize12)
      .copyWith(color: AppColors.primaryGray);

 //dont remove 
  static TextStyle font16mainColor700 = _fontDMSans
      .merge(_fontWeight700)
      .merge(_fontSize16)
      .copyWith(color: AppColors.mainColor);
  static TextStyle font16white700 = _fontDMSans
      .merge(_fontWeight700)
      .merge(_fontSize16)
      .copyWith(color: AppColors.white);
  static TextStyle font16black2400 = _fontDMSans
      .merge(_fontWeight400)
      .merge(_fontSize16)
      .copyWith(color: AppColors.black2);
  
  static TextStyle font16softGrey400 = _fontDMSans
      .merge(_fontWeight400)
      .merge(_fontSize16)
      .copyWith(color: AppColors.softGrey);

 


  static TextStyle font14black2400 = _fontDMSans
      .merge(_fontWeight400)
      .merge(_fontSize14)
      .copyWith(color: AppColors.black2);
  static TextStyle font14green500 = _fontDMSans
      .merge(_fontWeight500)
      .merge(_fontSize14)
      .copyWith(color: AppColors.green);

////////////////////////////////////////////

 


 





}

