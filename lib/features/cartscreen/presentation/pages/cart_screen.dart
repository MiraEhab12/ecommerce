import 'package:ecommerce_udemy/config/style/app_color.dart';
import 'package:ecommerce_udemy/config/style/text_styles.dart';
import 'package:ecommerce_udemy/core/widgets/components/app_image_view.dart';
import 'package:ecommerce_udemy/features/cartscreen/presentation/widgets/cart_item_widget.dart';
import 'package:ecommerce_udemy/generated/assets.dart';
import 'package:ecommerce_udemy/utils/extentions/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart", style: AppTextStyle.font24black2600),
        leading: BackButton(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
            CartItemWidget(
            ),
            
                  CartItemWidget(),
                    CartItemWidget(),
                      CartItemWidget(),
              145.hs,
              buildCartItemDetails(title: "Sub-total", price: "\$ 250"),
              buildCartItemDetails(title: "Discount", price: "\$ 0"),
              buildCartItemDetails(title: "Shipping", price: "\$ 80"),
        
              Divider(color: AppColors.bordercolor),
              16.hs,
              Row(
                children: [
                  Text("Total", style: AppTextStyle.font16black2400),
                  Spacer(),
                  Text("\$ 5,950", style: AppTextStyle.font16black2400),
                ],
              ),
              16.hs,
              Padding(
                padding: const EdgeInsets.only(bottom: 190),
                child: ElevatedButton(
                  onPressed: () {},
                        
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 91),
                    minimumSize: Size(341, 54),
                    backgroundColor: AppColors.primarycolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    
                    children: [
                      Text("Go To Checkout", style: AppTextStyle.font16white600),
                      10.ws,
                      AppImageView(svgPath: Assets.assetsSvgArrow),
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCartItemDetails({required String title, required String price}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Text("Sub-total", style: AppTextStyle.font16gray400),
          Spacer(),
          Text("\$ 250", style: AppTextStyle.font16black2400),
        ],
      ),
    );
  }
}
