import 'package:ecommerce_udemy/config/style/app_color.dart';
import 'package:ecommerce_udemy/config/style/text_styles.dart';
import 'package:ecommerce_udemy/core/widgets/components/app_image_view.dart';
import 'package:ecommerce_udemy/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchFilterWidgets extends StatelessWidget {
  const SearchFilterWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return    Row(
                spacing: 8.w,
                children: [
                  SizedBox(
                    width: 281.w,
                    height: 52.h,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 20,
                        ),
                        fillColor: Colors.white,
                        hintText: "Search for clothes...",
                        hintStyle: AppTextStyle.font16graytext400,
                        prefixIcon: Icon(Icons.search, size: 24),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColors.bordercolor),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(52, 52),
                      backgroundColor: AppColors.primarycolor,
                      padding: EdgeInsets.all(14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: AppImageView(
                      svgPath: Assets.assetsSvgFilter,
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                ],
              );
  }
}