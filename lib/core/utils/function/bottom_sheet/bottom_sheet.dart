

import 'package:flutter/material.dart';
import 'package:mojec_agent/features/authentication/presentation/widget/document_upload_widget.dart';


var _roundedRectangleBorder = const RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(25),
    topLeft: Radius.circular(25),
  )
);


void showUploadDoc({BuildContext? context,  }){
  showModalBottomSheet(
      context: context!,
      isScrollControlled: true,
      shape: _roundedRectangleBorder,
      builder: (context){
        return UploadDocumentWidget();
      });
}


