import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_udemy/config/routes/app_routes.dart';
import 'package:ecommerce_udemy/config/style/text_styles.dart';
import 'package:ecommerce_udemy/features/home_screen/data/repo/category_repo.dart';
import 'package:ecommerce_udemy/features/home_screen/data/repo/home_repo.dart';
import 'package:ecommerce_udemy/features/home_screen/presentation/manager/category_cubit.dart';
import 'package:ecommerce_udemy/features/home_screen/presentation/manager/home_cubit.dart';
import 'package:ecommerce_udemy/features/home_screen/presentation/manager/home_state.dart';
import 'package:ecommerce_udemy/features/home_screen/presentation/widgets/custom_tabs_widgets.dart';
import 'package:ecommerce_udemy/features/home_screen/presentation/widgets/search_filter_widgets.dart';
import 'package:ecommerce_udemy/generated/assets.dart';
import 'package:ecommerce_udemy/locator.dart';
import 'package:ecommerce_udemy/utils/app_utils/app_route_name.dart';
import 'package:ecommerce_udemy/utils/extentions/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit(sl<ProductRepo>())..getProducts(),
        ),
        BlocProvider(
          create: (context) =>
              CategoryCubit(sl<CategoryRepo>())..getCategories(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Discover", style: AppTextStyle.font32black600),
                16.hs,
                SearchFilterWidgets(),
                16.hs,

                const CustomTabsWidgets(),
                24.hs,
                Expanded(
                  child: BlocBuilder<ProductCubit, ProductState>(
                    builder: (context, state) {
                      if (state.loading) {
                        return LottieBuilder.asset(Assets.assetsLottieLoading);
                      } else if (state.error != null) {
                        return Center(child: Text(state.error!));
                      } else if (state.products.isEmpty) {
                        return Center(child: Text("No Products Found"));
                      } else {
                        final products = state.products;
                        return RefreshIndicator(
                          onRefresh: () async {
                            context.read<CategoryCubit>().selectCategory(0);
                            context.read<ProductCubit>().getProducts();
                          },
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.6,
                                  crossAxisSpacing: 20.w,
                                  mainAxisSpacing: 20.h,
                                ),
                            itemCount: products.length,
                            itemBuilder: (context, index) {
                              final product = products[index];
                              return InkWell(
                                onTap: () {
                                  RouterApp.pushNamed(RouteName.detailsScreen,
                                      arguments: product);
                                },
                                child: Container(
                                  margin: EdgeInsets.all(8),
                                  width: 161.w,
                                  height: 224.h,
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          10.r,
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: product.thumbnail,
                                          width: double.infinity,
                                          height: 174.h,
                                        ),
                                      ),
                                      8.hs,
                                      Text(
                                        product.title,
                                        style: AppTextStyle.font16black2600,
                                        maxLines: 1,
                                      ),
                                      3.hs,
                                      Text(
                                        "\$${product.price}",
                                        style: AppTextStyle.font12gray500,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
