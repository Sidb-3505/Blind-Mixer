import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class DateTimeCard extends StatelessWidget {
  final String date;
  final String time;
  final bool selected;

  const DateTimeCard({
    Key? key,
    required this.date,
    required this.time,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: selected ? 3 : 1,
      color: selected ? AppColors.lightPink : AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: selected ? AppColors.deepPurple : AppColors.borderGray,
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              date,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: selected ? AppColors.deepPurple : AppColors.black,
              ),
            ),
            Text(
              time,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: selected ? AppColors.deepPurple : AppColors.textGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
