import 'package:ecommerce_udemy/config/style/app_color.dart';
import 'package:ecommerce_udemy/config/style/text_styles.dart';
import 'package:ecommerce_udemy/features/home_screen/presentation/manager/category_cubit.dart';
import 'package:ecommerce_udemy/features/home_screen/presentation/manager/category_state.dart';
import 'package:ecommerce_udemy/features/home_screen/presentation/manager/home_cubit.dart';
import 'package:ecommerce_udemy/generated/assets.dart';
import 'package:ecommerce_udemy/utils/extentions/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CustomTabsWidgets extends StatelessWidget {
  const CustomTabsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state.loading) {
          return SizedBox(
            height: 40.h,
            child: LottieBuilder.asset(Assets.assetsLottieLoading),
          );
        } else if (state.error != null) {
          return SizedBox(
            height: 40.h,
            child: Center(child: Text(state.error!)),
          );
        } else if (state.categories.isEmpty) {
          return SizedBox(
            height: 40.h,
            child: Center(child: Text("No Categories Found")),
          );
        } else {
          return SizedBox(
            width: double.infinity,
            height: 40.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              separatorBuilder: (_, __) => 8.ws,
              itemBuilder: (context, index) {
                final category = state.categories[index];
                final bool isSelected = state.selectedIndex == index;

                return GestureDetector(
                  onTap: () {
                    context.read<CategoryCubit>().selectCategory(index);

                    if (category == "All") {
                      context.read<ProductCubit>().getProducts();
                    } else {
                      context.read<ProductCubit>().getProductsByCategory(
                        category,
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 7.h,
                      horizontal: 20.w,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primarycolor
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color: AppColors.bordercolor,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      category,
                      style: isSelected
                          ? AppTextStyle.font16white700
                          : AppTextStyle.font16black2600,
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
