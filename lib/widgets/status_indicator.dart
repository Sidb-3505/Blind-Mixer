import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class StatusIndicator extends StatelessWidget {
  final int activeStep;
  final int totalSteps;

  const StatusIndicator({
    super.key,
    required this.activeStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalSteps, (index) {
        bool isActive = index < activeStep;
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 6,
            decoration: BoxDecoration(
              color: isActive ? AppColors.deepPurple : AppColors.borderGray,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        );
      }),
    );
  }
}
