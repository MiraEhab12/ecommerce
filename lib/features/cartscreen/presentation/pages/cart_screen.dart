import 'package:ecommerce_udemy/config/style/app_color.dart';
import 'package:ecommerce_udemy/config/style/text_styles.dart';
import 'package:ecommerce_udemy/core/widgets/components/app_image_view.dart';
import 'package:ecommerce_udemy/features/cartscreen/presentation/manager/cart_cubit.dart';
import 'package:ecommerce_udemy/features/cartscreen/presentation/manager/cart_state.dart';
import 'package:ecommerce_udemy/features/cartscreen/presentation/widgets/cart_item_widget.dart';
import 'package:ecommerce_udemy/generated/assets.dart';
import 'package:ecommerce_udemy/utils/extentions/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state.loading) {
          return Shimmer.fromColors(
            baseColor: AppColors.primaryGray,
            highlightColor: AppColors.white,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return CartItemWidget(
                  price: 0,
                  tittle: "Loading...",
                  image: "",
                  subtotal: 0,
                  vat: 0,
                  shipping: 0,
                  total: 0,
                );
              },
            ),
          );
        } else if (state.error != null) {
          return Center(child: Text(state.error!));
        } else if (state.productInCarts.isEmpty) {
          return Center(child: Text("Your cart is empty"));
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text("My Cart", style: AppTextStyle.font24black2600),
              leading: BackButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.productInCarts.length,
                      itemBuilder: (context, index) {
                        final product = state.productInCarts[index];
                        return CartItemWidget(
                          price: product.price.toDouble(),
                          tittle: product.title,
                          image: product.thumbnail,
                          subtotal: product.price * product.quantity,
                          vat: product.discountedTotal * 0.15,
                          shipping: 80,
                          total: product.total,
                        );
                      },
                    ),

                    // --------------- Cart details ----------------
                    buildCartItemDetails(title: "Sub-total", price: "50"),
                    buildCartItemDetails(title: "VAT (%)", price: "7.5"),
                    buildCartItemDetails(title: "Shipping", price: "80"),

                    Divider(color: AppColors.bordercolor),
                    16.hs,
                    Row(
                      children: [
                        Text("Total", style: AppTextStyle.font16black2400),
                        Spacer(),
                        Text("\$ 137.5", style: AppTextStyle.font16black2400),
                      ],
                    ),
                    16.hs,
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          minimumSize: Size(double.infinity, 54),
                          backgroundColor: AppColors.primarycolor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Go To Checkout",
                              style: AppTextStyle.font16white600,
                            ),
                            10.ws,
                            AppImageView(svgPath: Assets.assetsSvgArrow),
                          ],
                        ),
                      ),
                    ),
                    150.hs,
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget buildCartItemDetails({required String title, required String price}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(title, style: AppTextStyle.font16gray400),
          Spacer(),
          Text("\$ $price", style: AppTextStyle.font16black2400),
        ],
      ),
    );
  }
}
