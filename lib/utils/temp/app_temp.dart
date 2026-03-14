// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:news_app/config/style/text_styles.dart';
// import 'package:news_app/core/widgets/components/app_image_view.dart';
// import 'package:news_app/generated/assets.dart';
// import 'package:news_app/utils/extentions/extention.dart';
//
// class TempScreen extends StatelessWidget {
//   const TempScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             AppImageView(
//               svgPath: Assets.svgArrow,
//               height: 30.h,
//               width: 30.w,
//             ),
//             AppImageView(
//               svgPath: Assets.svgArrow,
//               height: 30.h,
//               width: 30.w,
//             ),
//             AppImageView(
//               svgPath: Assets.svgArrow,
//               height: 30.h,
//               width: 30.w,
//             ),
//           ],
//         ),
//       ),
//       body: SizedBox(
//         width: 150.w,
//         child: ListView.separated(
//             itemBuilder: (context, index) => Container(
//                   color: Colors.black,
//                   width: 150.w,
//                   height: 300.h,
//                   child: Column(
//                     children: [
//                       AppImageView(
//                         imagePath: Assets.tempUserImage2,
//                         height: 120.h,
//                         width: 120.w,
//                       ),
//                       Text(
//                         "Ay klam",
//                         style: AppTextStyle.font14black2400,
//                       ),
//                       Text(
//                         "200",
//                         style: AppTextStyle.font14black2400,
//                       ),
//                       Text(
//                         "Gamed",
//                         style: AppTextStyle.font14black2400,
//                       ),
//                       Text(
//                         "Gamed",
//                         style: AppTextStyle.font14black2400,
//                       ),
//                     ],
//                   ),
//                 ),
//             separatorBuilder: (context, index) => 10.hs,
//             itemCount: 20),
//       ),
//     );
//   }
// }
