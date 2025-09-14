import 'package:check_out_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    this.onPressed,
    this.isLoading = false,
  });
  final String text;
  final Color color;
  final Function()? onPressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.fromMap({
          WidgetState.any: Size(double.infinity, 64),
        }),
        shape: WidgetStateProperty.fromMap({
          WidgetState.any: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        }),
        backgroundColor: WidgetStateColor.fromMap({
          WidgetState.any: color,
        }),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 67.0, vertical: 23),
        child: isLoading
            ? CircularProgressIndicator()
            : Text(
                textAlign: TextAlign.center,
                text,
                style: Styles.styleMedium22,
              ),
      ),
    );
  }
}
