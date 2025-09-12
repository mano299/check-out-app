import 'package:check_out_app/features/check_out/presentation/widget/custom_check_circle.dart';
import 'package:check_out_app/features/check_out/presentation/widget/custom_dashed_line.dart';
import 'package:check_out_app/features/check_out/presentation/widget/thank_you_card.dart';
import 'package:flutter/material.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ThankYouCard(),
            Positioned(
              bottom: MediaQuery.sizeOf(context).height * .2 + 20,
              left: 28,
              right: 28,
              child: CustomDashedLine(),
            ),
            Positioned(
              top: -50,
              right: 0,
              left: 0,
              child: CustomCheckCircle(),
            ),
            Positioned(
              left: -20,
              bottom: MediaQuery.sizeOf(context).height * .2,
              child: CircleAvatar(
                backgroundColor: Colors.white,
              ),
            ),
            Positioned(
              right: -20,
              bottom: MediaQuery.sizeOf(context).height * .2,
              child: CircleAvatar(
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
