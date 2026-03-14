import 'package:ecommerce_udemy/config/style/app_color.dart';
import 'package:ecommerce_udemy/config/style/text_styles.dart';
import 'package:ecommerce_udemy/core/widgets/form_fields/confirm_password_field.dart';
import 'package:ecommerce_udemy/core/widgets/form_fields/name_field.dart';
import 'package:ecommerce_udemy/core/widgets/form_fields/password_field.dart';
import 'package:ecommerce_udemy/utils/extentions/extention.dart';
import 'package:flutter/material.dart';

class SignupSceen extends StatelessWidget {
  SignupSceen({super.key});
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController fullnamecontroller = TextEditingController();

  TextEditingController confirmpasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Create an account", style: AppTextStyle.font32black600),
                8.hs,
                Text(
                  "Let’s create your account.",
                  style: AppTextStyle.font16gray400,
                ),
                24.hs,
                Text("Full Name", style: AppTextStyle.font16black500),
                4.hs,
                NameField(controller: fullnamecontroller),
                16.hs,
                Text("Full Name", style: AppTextStyle.font16black500),
                4.hs,
                NameField(controller: fullnamecontroller),
                16.hs,
                Text("Password", style: AppTextStyle.font16black500),
                4.hs,
                PasswordField(controller: passwordcontroller),
                16.hs,
                Text("Confirm Password", style: AppTextStyle.font16black500),
                4.hs,
                ConfirmPasswordField(
                  controller: confirmpasswordcontroller,
                  password: passwordcontroller,
                ),

                55.hs,
                ElevatedButton(
                  onPressed: () {},

                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 12.5,
                    ),
                    minimumSize: Size(325, 50),
                    backgroundColor: AppColors.primarycolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Create Account",
                    style: AppTextStyle.font14white600,
                  ),
                ),
                //Spacer(),
                100.hs,
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account?",
                      style: AppTextStyle.font16gray400,
                      children: [
                        TextSpan(
                          text: " Log In",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
