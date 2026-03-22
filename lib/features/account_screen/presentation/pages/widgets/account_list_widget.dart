import 'package:ecommerce_udemy/config/style/app_color.dart';
import 'package:ecommerce_udemy/config/style/text_styles.dart';
import 'package:ecommerce_udemy/core/widgets/components/app_image_view.dart';
import 'package:ecommerce_udemy/utils/extentions/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AccountListItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback? onTap;

  const AccountListItem({
    super.key,
    required this.imagePath,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        12.hs,
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              AppImageView(imagePath: imagePath, width: 24.w, height: 24.h),
              16.ws,
              Text(title, style: AppTextStyle.font16black2600),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: AppColors.primaryGray,
                size: 16,
              ),
            ],
          ),
        ),
        15.hs,
        Divider(
          color: AppColors.bordercolor,
          thickness: 2,
          indent: 35,
          endIndent: 5,
        ),
      ],
    );
  }
}
