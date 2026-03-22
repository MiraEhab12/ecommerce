import 'package:ecommerce_udemy/config/routes/app_routes.dart';
import 'package:ecommerce_udemy/config/style/app_color.dart';
import 'package:ecommerce_udemy/config/style/text_styles.dart';
import 'package:ecommerce_udemy/core/widgets/components/app_image_view.dart';
import 'package:ecommerce_udemy/features/account_screen/presentation/pages/widgets/account_list_widget.dart';
import 'package:ecommerce_udemy/features/account_screen/presentation/pages/widgets/log_out_dialog.dart';
import 'package:ecommerce_udemy/features/auth_screen/presentation/manager/auth_cubit.dart';
import 'package:ecommerce_udemy/generated/assets.dart';
import 'package:ecommerce_udemy/locator.dart';
import 'package:ecommerce_udemy/utils/app_utils/app_route_name.dart';
import 'package:ecommerce_udemy/utils/extentions/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account", style: AppTextStyle.font24black2600),
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          children: [
            Divider(color: AppColors.bordercolor, thickness: 2),
            25.hs,
            AccountListItem(
              imagePath: Assets.assetsImagesBox,
              title: "My Orders",
              onTap: () {
                // Handle tap for My Details
              },
            ),
            AccountListItem(
              imagePath: Assets.assetsImagesDetails,
              title: "My Details",
              onTap: () {
                // Handle tap for My Details
              },
            ),
            AccountListItem(
              imagePath: Assets.assetsImagesAddress,
              title: "Address Book",
              onTap: () {
                // Handle tap for My Details
              },
            ),
            AccountListItem(
              imagePath: Assets.assetsImagesQuestion,
              title: "FAQs",
              onTap: () {
                // Handle tap for My Details
              },
            ),
            AccountListItem(
              imagePath: Assets.assetsImagesHeadphones,
              title: "Help Center",
              onTap: () {
                // Handle tap for My Details
              },
            ),
            200.hs,
          LogOutDialogScreen()
          ],
        ),
      ),
    );
  }
}
