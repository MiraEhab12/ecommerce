import 'package:ecommerce_udemy/config/routes/app_routes.dart';
import 'package:ecommerce_udemy/blocobserve.dart';
import 'package:ecommerce_udemy/features/auth_screen/presentation/pages/login_screen.dart';
import 'package:ecommerce_udemy/features/cartscreen/data/repo/cart_repo.dart';
import 'package:ecommerce_udemy/features/cartscreen/presentation/manager/cart_cubit.dart';
import 'package:ecommerce_udemy/features/home_screen/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:ecommerce_udemy/config/localiztion/localization.dart';
import 'package:ecommerce_udemy/config/routes/app_routes.dart';
import 'package:ecommerce_udemy/config/style/app_color.dart';
import 'package:ecommerce_udemy/config/style/app_status_bar.dart';
import 'package:ecommerce_udemy/config/style/app_theme.dart';
import 'package:ecommerce_udemy/core/data/local/cache_helper.dart';
import 'package:ecommerce_udemy/core/manager/cubit.dart';
import 'package:ecommerce_udemy/core/screens/main_screen.dart';
import 'package:ecommerce_udemy/core/widgets/components/app_check_internet.dart';
import 'package:ecommerce_udemy/locator.dart';
import 'package:oktoast/oktoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await CacheHelper.init();
  await AppLocalization.init();

  await DbInjection.init();

  AppStatusBar.setStatusBarStyle();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (_, child) => OKToast(
        child: LocalizedApp(
          child: AppCheckInternetBuilder(
            child: MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => AppCubit()),
                BlocProvider(
                  create: (context) => CartCubit(sl<CartRepo>())//userid
                ),
              ],
              child: MaterialApp(
                title: 'news app',
                debugShowCheckedModeBanner: false,
                theme: appTheme,
                themeMode: ThemeMode.light,
                color: AppColors.white,
                home: MainScreen(),
                //LoginScreen(),
                navigatorKey: RouterApp.navigatorKey,
                onGenerateRoute: RouterApp.generateRoute,
                builder: LocalizeAndTranslate.directionBuilder,
                locale: context.locale,
                localizationsDelegates: context.delegates,
                supportedLocales: context.supportedLocales,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
