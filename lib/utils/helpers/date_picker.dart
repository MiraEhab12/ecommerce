import 'package:ecommerce_udemy/config/style/app_color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker {
  static Future<String> pickDate(BuildContext context) async {
    String? formattedDate;
    DateTime? pickedDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              secondaryContainer: AppColors.white,
              onSecondary: AppColors.black,
              primary: AppColors.green, // header background color
              onPrimary: AppColors.white, // header text color
              onSurface: AppColors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.green, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2025),
    );

    if (pickedDate != null) {
      formattedDate = DateFormat('yyyy-MM-dd', "en").format(pickedDate);
    }
    return formattedDate ?? "";
  }
}
