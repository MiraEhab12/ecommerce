import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_udemy/config/style/app_color.dart';
import 'package:ecommerce_udemy/config/style/text_styles.dart';
import '../../../utils/helpers/validation_form.dart';
class EmailField extends StatelessWidget {
  
  final TextEditingController controller;
    final Function(String)? onChanged; 
  const EmailField({
    super.key,
    required this.controller,
        this.onChanged, 
   
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: ValidationForm.emailValidator,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        
        prefixIcon: Icon(
          Icons.email_outlined,
          color:  AppColors.mainColor,
        ),
    
        hintText: "Email",
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        hintStyle: AppTextStyle.font16black2400.copyWith(color: AppColors.mainColor),
      ),
    );
  }
}
