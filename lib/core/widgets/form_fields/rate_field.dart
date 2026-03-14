import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommerce_udemy/utils/helpers/validation_form.dart';

class RateField extends StatelessWidget {
  final TextEditingController controller;
   RateField({ required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      validator: ValidationForm.rateValidator,
   
      decoration: InputDecoration( 
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          
        ),
        fillColor: Colors.white,
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(width: 1,)
        ) ,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(width: 1,)
        ),
       
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 15.w),
      ),
    );
  }
}


