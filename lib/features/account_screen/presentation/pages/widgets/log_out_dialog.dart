import 'package:ecommerce_udemy/config/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_udemy/config/style/app_color.dart';
import 'package:ecommerce_udemy/config/style/text_styles.dart';
import 'package:ecommerce_udemy/core/widgets/components/app_image_view.dart';
import 'package:ecommerce_udemy/generated/assets.dart';
import 'package:ecommerce_udemy/utils/app_utils/app_route_name.dart';
import 'package:ecommerce_udemy/utils/extentions/extention.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class LogOutDialogScreen extends StatelessWidget {
  const LogOutDialogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
              onTap: () {
                
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Logout?"),
                      content: Text("Are you sure you want to logout?"),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                           // context.read<AuthCubit>().logout();
                            RouterApp.pushNamed(RouteName.loginScreen);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: AppColors.brightRed,
                            fixedSize: Size(293, 54),
                          ),
                          child: Text(
                            "Yes, Logout",
                            style: AppTextStyle.font16white600,
                          ),
                        ),
                        12.hs,
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: AppColors.bordercolor),
                            ),
    
                            fixedSize: Size(293, 54),
                          ),
                          child: Text(
                            "No, Cancel",
                            style: AppTextStyle.font16black2600,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Row(
                children: [
                  AppImageView(
                    imagePath: Assets.assetsImagesVector,
                    width: 24.w,
                    height: 24.h,
                  ),
                  16.ws,
                  Text(
                    "Logout",
                    style: AppTextStyle.font16black2600.copyWith(
                      color: AppColors.brightRed,
                    ),
                  ),
                ],
              ),
            );
  }
}