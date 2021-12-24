import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mojec_agent/core/constants/text_style_constants.dart';
import 'package:mojec_agent/core/utils/styles/color_utils.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Widget? leading;
  final Widget? titleWidget;
  final Widget? trailing;
  final String? titleText;
  final double? leadingWidth;
  final bool centerTitle;
  final bool elevate;
  const AppAppBar({
    Key? key,
    this.elevate = false,
    this.leading,
    this.leadingWidth,
    this.titleWidget,
    this.trailing,
    this.centerTitle = true,
    this.titleText,
    this.backgroundColor = Colors.transparent,
  })  : assert(titleWidget == null || titleText == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevate ? 8 : 0,
      toolbarHeight: elevate ? 90 : 56,
      leadingWidth: leadingWidth ?? 60.w,
      shadowColor: elevate
          ? const Color(0xFF255AA2).withOpacity(.1)
          : Colors.transparent,
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      leading: Container(
        margin: EdgeInsets.only(left: 30.w),
        child: leading ??
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: blue.withOpacity(0.1),
                ),
                child: Icon(Icons.arrow_back_ios, size: 18, color: blue,),
              ),
            ),
      ),
      title: titleText == null
          ? titleWidget ?? const SizedBox()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titleText!, style: kBold700.copyWith(fontSize: 18.sp),),
              ],
            ),
      titleTextStyle: Theme.of(context).textTheme.headline5,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(elevate ? 90 : 56);
}
