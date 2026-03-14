
import 'package:ecommerce_udemy/config/style/app_color.dart';
import 'package:ecommerce_udemy/config/style/text_styles.dart';
import 'package:ecommerce_udemy/utils/extentions/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton1 extends StatelessWidget {
  final String? title;
  final Widget? leading;
  final VoidCallback? onPressed;
  final double? horizontalTitleGap;
  final double? width;

  const AppButton1({
    super.key,
    this.title,
    this.leading,
    this.onPressed,
    this.horizontalTitleGap,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed ?? () {},
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
        ),
        fixedSize: WidgetStatePropertyAll(Size(width ?? 343.w, 60.h)),
        shadowColor: const WidgetStatePropertyAll(Colors.transparent),
        surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide(color: AppColors.mainColor),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: leading == null
          ? Center(
              child: Text(title ?? "", style: AppTextStyle.font16mainColor700),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                leading!,
                horizontalTitleGap?.ws ?? 7.ws,
                Text(title ?? "", style: AppTextStyle.font14green500),
              ],
            ),
    );
  }
}
