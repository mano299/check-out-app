import 'package:check_out_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar({required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Text(
      title,
      style: Styles.styleMedium25,
    ),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {},
      icon: Icon(Icons.arrow_back),
    ),
  );
}
