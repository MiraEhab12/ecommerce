import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ecommerce_udemy/config/style/app_color.dart';
import 'package:ecommerce_udemy/config/style/text_styles.dart';
import 'package:ecommerce_udemy/core/widgets/components/app_image_view.dart';
import 'package:ecommerce_udemy/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const AppBottomNavBar({super.key, required this.currentIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    final iconList = [
   Assets.assetsSvgHome,
      Assets.assetsSvgCart,

   Assets.assetsSvgUser,

   

    ];

    final iconSelected = [
      "Home", "Cart", "Account"
    
    ];

    return AnimatedBottomNavigationBar.builder(
      safeAreaValues: SafeAreaValues(bottom: true),
      shadow: BoxShadow(color: Colors.black.withAlpha(50), blurRadius: 10),
      height: 60.h,
      backgroundColor: AppColors.mainColor,
      activeIndex: currentIndex,
      notchMargin: 8.0,
      gapLocation: GapLocation.end,
      notchSmoothness: NotchSmoothness.softEdge,
      onTap: (int index) => onTap?.call(index),
      itemCount: 3,
      tabBuilder: (int index, bool isActive) => _bottomNavItem(
        selectedicon: iconList[index],
        label: iconSelected[index],
        index: index,
       
      ),
    );
  }

  Widget _bottomNavItem({
    String? selectedicon,
    required String label,
    required int index,
   
  }) {
    final bool isSelected = currentIndex == index;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isSelected
            ? AppImageView(
                svgPath: selectedicon,
                width: 24.w,
                height: 24.h,
                color: AppColors.primarycolor,
                fit: BoxFit.cover,
              )
            : AppImageView(
                svgPath: selectedicon,
                width: 24.w,
                height: 24.h,
                fit: BoxFit.cover,
              ),
             isSelected? Text(label,style: TextStyle(color: AppColors.primarycolor),)
        : Text(label,style: TextStyle(color: Colors.grey),)
      ],
    );
  }
}
