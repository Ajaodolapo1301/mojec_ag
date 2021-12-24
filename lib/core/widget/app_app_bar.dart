// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:mojec_customer/core/values/assets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mojec_customer/core/values/colors.dart';
//
// class AppAppBar2 extends StatelessWidget implements PreferredSizeWidget {
//   final Color? backgroundColor;
//   final Widget? leading;
//   final Widget? titleWidget;
//   final Widget? trailing;
//   final String? titleText;
//   final double? leadingWidth;
//   final bool centerTitle;
//   final bool elevate;
//   const AppAppBar2({
//     Key? key,
//     this.elevate = false,
//     this.leading,
//     this.leadingWidth,
//     this.titleWidget,
//     this.trailing,
//     this.centerTitle = true,
//     this.titleText,
//     this.backgroundColor = Colors.transparent,
//   })  : assert(titleWidget == null || titleText == null),
//         super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       elevation: elevate ? 8 : 0,
//       toolbarHeight: elevate ? 90 : 56,
//       leadingWidth: leadingWidth ?? 60.w,
//       shadowColor: elevate
//           ? const Color(0xFF255AA2).withOpacity(.1)
//           : Colors.transparent,
//       backgroundColor: backgroundColor,
//       centerTitle: centerTitle,
//       leading: Container(
//         margin: EdgeInsets.only(left: 30.w),
//         child: leading ??
//             GestureDetector(
//               onTap: () => Navigator.pop(context),
//               child: Container(
//                 width: 38.w,
//                 height: 38.h,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: primaryColor.withOpacity(.1),
//                 ),
//                 child: Center(
//                   child: SvgPicture.asset(
//                     Assets.ARROW_BACK,
//                     width: 9.w,
//                     height: 15.h,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//       ),
//       title: titleText == null
//           ? titleWidget ?? const SizedBox()
//           : Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(titleText!),
//               ],
//             ),
//       titleTextStyle: Theme.of(context).textTheme.headline5,
//     );
//   }
//
//   @override
//   Size get preferredSize => Size.fromHeight(elevate ? 90 : 56);
// }
