import 'package:check_out_app/features/check_out/presentation/widget/build_app_bar.dart';
import 'package:check_out_app/features/check_out/presentation/widget/my_cart_view_body.dart';
import 'package:flutter/material.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(title: 'My Cart'),
      body: MyCartViewBody(),
    );
  }
}
