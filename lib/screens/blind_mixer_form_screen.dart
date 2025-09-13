import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/date_time_card.dart';
import '../widgets/status_indicator.dart';

class BlindMixerFormScreen extends StatelessWidget {
  const BlindMixerFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // If you have a selected date/time, send it back in result map too.
    final selectedDate = "Saturday, 24 June";
    final selectedTime = "7:00 PM";

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Create Blind Date",
          style: TextStyle(
            color: AppColors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close, color: AppColors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StatusIndicator(activeStep: 2, totalSteps: 3),
            const SizedBox(height: 30),
            const Text(
              "Choose Date & Time",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 15),
            const DateTimeCard(date: "Friday, 23 June", time: "6:30 PM"),
            const SizedBox(height: 20),
            const DateTimeCard(
              date: "Saturday, 24 June",
              time: "7:00 PM",
              selected: true,
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                // Return to previous screen with confirmation result.
                Navigator.pop(context, {
                  'justConfirmed': true,
                  'date': selectedDate,
                  'time': selectedTime,
                });
              },
              child: const Text(
                "Confirm",
                style: TextStyle(color: AppColors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
