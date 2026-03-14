import 'package:ecommerce_udemy/config/routes/app_routes.dart';
import 'package:ecommerce_udemy/config/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: RouterApp.pop,
        child: Container(
          height: 50.h,
          width: 50.w,
          margin: EdgeInsets.only(left: 20.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.veryLightSilver,
          ),
          child: Icon(Icons.arrow_back, color: AppColors.mainColor),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 60.h);
}
