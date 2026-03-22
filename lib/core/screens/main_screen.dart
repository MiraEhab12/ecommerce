
import 'package:ecommerce_udemy/core/manager/cubit.dart';
import 'package:ecommerce_udemy/core/manager/state.dart';
import 'package:ecommerce_udemy/core/widgets/components/bottom_navbar.dart';
import 'package:ecommerce_udemy/features/account_screen/presentation/pages/account_screen.dart';
import 'package:ecommerce_udemy/features/cartscreen/presentation/pages/cart_screen.dart';
import 'package:ecommerce_udemy/features/home_screen/presentation/pages/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppCubit appCubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) => Container(
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          body: [
          HomeScreen(),
          CartScreen(),
          AccountScreen(),
          
           // const IngredientScreen(),
            //const ListviewScreen(),
            //const HomeScreen(),
            //const ListviewScreen(),
          ][appCubit.currentIndex],
          bottomNavigationBar:  AppBottomNavBar(
            currentIndex: appCubit.currentIndex,
            onTap: appCubit.changeCurrentIndex,
          ),
        ),
      ),
    );
  }
}
