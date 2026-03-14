import 'package:ecommerce_udemy/config/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_udemy/config/style/app_color.dart';

import '../../../utils/app_utils/app_strings.dart';
import '../../../utils/helpers/validation_form.dart';

class NameField extends StatelessWidget {
  final bool isReadOnly;
  final TextEditingController controller;
  const NameField({
    super.key,
    required this.controller,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
       width: 341.w,
      height: 52.h,
      child: TextFormField(
        readOnly: isReadOnly,
        controller: controller,
        validator: ValidationForm.nameValidator,
      
        keyboardType: TextInputType.name,
        decoration: InputDecoration( 
          hintText: "Enter your email address",
          hintStyle: AppTextStyle.font16graytext400,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.bordercolor),
            
          ),
          fillColor: Colors.white,
          focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1, color: AppColors.bordercolor)
          ) ,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1, color: AppColors.bordercolor)
          ),
         
          contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 15.w),
        ),
      ),
    );
  }
}
