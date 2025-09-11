import 'package:check_out_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar({required String title, required BuildContext context}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Text(
      title,
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
