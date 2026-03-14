
import 'package:ecommerce_udemy/config/style/app_color.dart';
import 'package:ecommerce_udemy/config/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton2 extends StatelessWidget {
  final bool isLoading;
  final String? title;
  final Color? color;
  final Widget? leading;
  final VoidCallback? onPressed;
  final double? horizontalTitleGap;
  final double? width;
  final ButtonStyle? style;

  const AppButton2({
    super.key,
    this.style,
    this.title,
    this.leading,
    this.onPressed,
    this.horizontalTitleGap,
    this.width,
    this.color,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed ?? () {},
      style: style?? ButtonStyle(
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
        ),
        fixedSize: WidgetStatePropertyAll(Size(width ?? 343.w, 60.h)),
        shadowColor: const WidgetStatePropertyAll(Colors.transparent),
        surfaceTintColor: WidgetStatePropertyAll(color ?? AppColors.mainColor),
        overlayColor: WidgetStatePropertyAll(color ?? AppColors.mainColor),
        backgroundColor: WidgetStatePropertyAll(color ?? AppColors.mainColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
      child: leading == null
          ? isLoading
                ? CircularProgressIndicator(color: AppColors.white)
                : Center(
                    child: Text(
                      title ?? "",
                      style: AppTextStyle.font16white700,
                    ),
                  )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                leading!,
                // horizontalTitleGap?.ws ?? 8.ws,
                Text(title ?? "", style: AppTextStyle.font14green500),
              ],
            ),
    );
  }
}
