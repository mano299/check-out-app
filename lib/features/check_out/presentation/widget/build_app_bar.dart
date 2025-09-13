import 'package:check_out_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar({String? title, required BuildContext context}) {
  return AppBar(
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      title ?? '',
      style: Styles.styleMedium25,
    ),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
    ),
  );
}
