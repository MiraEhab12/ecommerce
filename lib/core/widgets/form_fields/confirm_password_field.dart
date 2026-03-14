import 'package:ecommerce_udemy/config/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../config/style/app_color.dart';
import '../../../utils/app_utils/app_strings.dart';
import '../../../utils/helpers/validation_form.dart';

class ConfirmPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController password;
  const ConfirmPasswordField({
    super.key,
    required this.controller,
    required this.password,
  });

  @override
  State<ConfirmPasswordField> createState() => _ConfirmPasswordFieldState();
}

class _ConfirmPasswordFieldState extends State<ConfirmPasswordField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
       width: 341.w,
      height: 52.h,
      child: TextFormField(
        controller: widget.controller,
        obscureText: !isVisible,
        validator: (v) =>
            ValidationForm.confirmPasswordValidator(v, widget.password.text),
      
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
           hintText: "Enter your password",
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
      
       
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            icon: Icon(
              isVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              size: 25,
            ),
          ),
        ),
      ),
    );
  }
}
