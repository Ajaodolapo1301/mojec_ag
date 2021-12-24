import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:mojec_agent/core/utils/styles/color_utils.dart';


class LoadingOverlayWidget extends StatelessWidget {
  final bool loading;
  final Widget child;

  LoadingOverlayWidget({required this.loading, required this.child});

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      useDefaultLoading: loading,
      overlayColor: blue,
      overlayOpacity: 0.55,
      overlayWidget: const Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
      child: child,
    );
  }
}
