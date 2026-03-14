import 'package:flutter/material.dart';
import 'package:ecommerce_udemy/config/style/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_utils/app_strings.dart';
import '../../../utils/helpers/validation_form.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  const PasswordField({super.key, required this.controller});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 341.w,
      height: 52.h,
      child: TextFormField(
        
        controller: widget.controller,
        obscureText: !isVisible,
        validator: ValidationForm.passwordValidator,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
           fillColor: Colors.white,
          enabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.bordercolor,width: 1),
          ),
          focusedBorder:  OutlineInputBorder(
             borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.bordercolor,width: 1),
          ),
        contentPadding: EdgeInsets.only(top: 15.h, left: 20.w,bottom: 15.h),
          hintText: 'Enter your password',
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
