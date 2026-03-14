import 'package:ecommerce_udemy/config/style/app_color.dart';
import 'package:ecommerce_udemy/config/style/text_styles.dart';
import 'package:ecommerce_udemy/core/widgets/components/app_image_view.dart';
import 'package:ecommerce_udemy/generated/assets.dart';
import 'package:ecommerce_udemy/utils/extentions/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
                padding: EdgeInsets.all(12.h),
                width: 342.w,
                height: 107.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: AppColors.bordercolor),
                ),
                child: Row(
                  children: [
                    AppImageView(
                      imagePath: Assets.assetsImagesShirt,
                      width: 83.w,
                      height: 83.h,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Regular Fit Slogan",
                                style: AppTextStyle.font14black2400,
                              ),
                            Spacer(),
                              Icon(Icons.delete_forever_outlined,color: Colors.red,size: 16,)
                            ],
                          ),
                      
                          36.hs,
                          Row(
                            
                            children: [
                              Text(
                                "\$ 1,190",
                                style: AppTextStyle.font14black2400,
                              ),
                              
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}