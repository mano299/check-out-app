import 'package:check_out_app/core/utils/styles.dart';
import 'package:check_out_app/features/check_out/presentation/views/payments_details_view.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.fromMap({
          WidgetState.any: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        }),
        backgroundColor: WidgetStateColor.fromMap({
          WidgetState.any: color,
        }),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PaymentsDetailsView(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 67.0, vertical: 23),
        child: Text(
          textAlign: TextAlign.center,
          text,
          style: Styles.styleMedium22,
        ),
      ),
    );
  }
}
