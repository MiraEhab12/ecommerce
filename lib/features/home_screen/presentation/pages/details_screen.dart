import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_udemy/config/style/app_color.dart';
import 'package:ecommerce_udemy/config/style/text_styles.dart';
import 'package:ecommerce_udemy/core/widgets/components/app_image_view.dart';
import 'package:ecommerce_udemy/features/home_screen/data/model/home_model.dart';
import 'package:ecommerce_udemy/generated/assets.dart';
import 'package:ecommerce_udemy/utils/extentions/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        title: Text("Details",style: AppTextStyle.font24black2600,),
        leading: BackButton(color: Colors.black,),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
               padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
               
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(imageUrl:  product.thumbnail, width: double.infinity, height: 368.h, fit: BoxFit.cover,),
                 
                  12.hs,
                  Text(
                    product.title,
                    style: AppTextStyle.font16black2600,
                  ),
                  13.hs,
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16.w,),
                      4.ws,
                      Text(product.rating.toString() , style: AppTextStyle.font16black2600,),
                      8.ws,
                      Text("(230 Reviews)", style: AppTextStyle.font16gray600,),
                    ],
                  ),
                  13.hs,
                  Text(product.description , style: AppTextStyle.font16gray400,),                      
    
               
                
                ],
              ),
            ),
          ),
             //Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
                  width: double.infinity,
                  height: 105.h,
                  decoration: BoxDecoration(
                   color: AppColors.white,
                  border: Border.symmetric(    
                    horizontal: BorderSide(
                      color: AppColors.bordercolor,
                      width: 1,
                    ),
                  ),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text("Price",style: AppTextStyle.font16gray400,),
                          8.hs,
                          Text("\$${product.price}",style: AppTextStyle.font24black2600,),
                        ],
                      ),
                      16.ws,
                      ElevatedButton(onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primarycolor,
                        minimumSize: Size(240.w,52.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      
                       child: 
                      Row(
                        children: [
                        AppImageView(
                          svgPath: Assets.assetsSvgBag,
                          width: 24.w,
                          height: 24.h,
                        ),
                          10.ws,
                          Text("Add to Cart",style: AppTextStyle.font16white600,),
                        ],
                      )
                      
                      )
                    ],
                  )
                ),
        ],
      )
    );
  }
}