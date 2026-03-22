import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:ecommerce_udemy/config/routes/app_routes.dart';
import 'package:ecommerce_udemy/config/style/app_color.dart';
import 'package:ecommerce_udemy/config/style/text_styles.dart';
import 'package:ecommerce_udemy/core/data/local/cache_helper.dart';
import 'package:ecommerce_udemy/core/widgets/form_fields/name_field.dart';
import 'package:ecommerce_udemy/core/widgets/form_fields/password_field.dart';
import 'package:ecommerce_udemy/features/auth_screen/data/repo/auth_repo.dart';
import 'package:ecommerce_udemy/features/auth_screen/presentation/manager/auth_cubit.dart';
import 'package:ecommerce_udemy/features/auth_screen/presentation/manager/auth_state.dart';
import 'package:ecommerce_udemy/features/cartscreen/presentation/manager/cart_cubit.dart';
import 'package:ecommerce_udemy/generated/assets.dart';
import 'package:ecommerce_udemy/locator.dart';
import 'package:ecommerce_udemy/utils/app_utils/app_route_name.dart';
import 'package:ecommerce_udemy/utils/cache_utils/cach_saving.dart';
import 'package:ecommerce_udemy/utils/cache_utils/pref_keys.dart';
import 'package:ecommerce_udemy/utils/extentions/extention.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => AuthCubit(sl<AuthRepo>()),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) async {
            /// ✅ Login Success
            if (state.user != null) {
              await CacheSave.saveUserId(state.user!.id);
              print("🔥 SAVED USER ID = ${state.user!.id}");
              print(
                "🔥 FROM CACHE = ${CacheHelper.getData(key: PrefKeys.userId)}",
              );
              context.read<CartCubit>().getUserCart();
              AnimatedSnackBar(
                builder: (context) {
                  return MaterialAnimatedSnackBar(
                    messageText: "Login Successful",
                    type: AnimatedSnackBarType.success,
                  );
                },
              ).show(context);
              RouterApp.pushNamedAndRemoveUntil(RouteName.mainScreen);
            }

            /// ❌ Error
            if (state.error != null) {
              AnimatedSnackBar(
                builder: (context) {
                  return MaterialAnimatedSnackBar(
                    messageText: state.error!,
                    type: AnimatedSnackBarType.error,
                  );
                },
              ).show(context);
            }
          },
          builder: (context, state) {
            if (state.loading) {
              return LottieBuilder.asset(Assets.assetsLottieLoading);
            } else {
              return Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login to your account",
                        style: AppTextStyle.font32black600,
                      ),
                      8.hs,
                      Text(
                        "It’s great to see you again.",
                        style: AppTextStyle.font16gray400,
                      ),
                      24.hs,

                      /// Username
                      Text("User Name", style: AppTextStyle.font16black500),
                      4.hs,
                      NameField(controller: namecontroller),

                      16.hs,

                      /// Password
                      Text("Password", style: AppTextStyle.font16black500),
                      4.hs,
                      PasswordField(controller: passwordcontroller),

                      55.hs,

                      /// Sign In Button
                      ElevatedButton(
                        onPressed: state.loading
                            ? null
                            : () {
                                context.read<AuthCubit>().login(
                                  username: namecontroller.text.trim(),
                                  password: passwordcontroller.text.trim(),
                                );
                              },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: AppColors.primarycolor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: state.loading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Sign In",
                                style: AppTextStyle.font14white600,
                              ),
                      ),

                      const Spacer(),

                      /// Register
                      RichText(
                        text: TextSpan(
                          text: "Don’t have an account? ",
                          style: AppTextStyle.font16gray400,
                          children: [
                            TextSpan(
                              text: "Join",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  RouterApp.pushNamed(RouteName.signupSceen);
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
