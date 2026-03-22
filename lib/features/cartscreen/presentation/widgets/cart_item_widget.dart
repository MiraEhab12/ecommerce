import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_udemy/config/style/app_color.dart';
import 'package:ecommerce_udemy/config/style/text_styles.dart';
import 'package:ecommerce_udemy/core/widgets/components/app_image_view.dart';
import 'package:ecommerce_udemy/features/cartscreen/presentation/manager/cart_cubit.dart';
import 'package:ecommerce_udemy/features/cartscreen/presentation/manager/cart_state.dart';
import 'package:ecommerce_udemy/generated/assets.dart';
import 'package:ecommerce_udemy/utils/extentions/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CartItemWidget extends StatelessWidget {
  final double price;
  final String tittle;
  final String image;
  final double subtotal;
  final double vat;
  final double shipping;
  final double total;
   const CartItemWidget({super.key, required this.price, required this.tittle, required this.image, required this.subtotal, required this.vat, required this.shipping, required this.total});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            CachedNetworkImage(imageUrl:  image,
              width: 83.w,
              height: 83.h,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 83.w,
                  height: 83.h,
                  color: Colors.white,
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          
            
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          tittle,
                         
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyle.font14black2400,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.delete_forever_outlined,
                        color: Colors.red,
                        size: 16,
                      ),
                    ],
                  ),
          
                  36.hs,
                  Row(
                    children: [
                      Text("\$ $price", style: AppTextStyle.font14black2400),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    
    
    ) ;
  }
  
            

}
