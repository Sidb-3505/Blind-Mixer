import 'package:flutter/material.dart';
import 'package:mixer_assignment/widgets/bottom_navigation.dart';

class BlindMixerScreen extends StatefulWidget {
  const BlindMixerScreen({super.key});

  @override
  State<BlindMixerScreen> createState() => _BlindMixerScreenState();
}

class _BlindMixerScreenState extends State<BlindMixerScreen> {
  bool showAppliedState = false;

  Future<void> _openFormAndWait() async {
    // Push the form on top of this screen and wait for its result.
    final result = await Navigator.pushNamed(context, '/blind-mixer-form');

    // result should be a Map or null. Only trigger if confirmed.
    if (result is Map && result['justConfirmed'] == true) {
      if (!mounted) return;
      setState(() {
        showAppliedState = true;
      });

      // Auto-reset after 3 seconds
      Future.delayed(const Duration(seconds: 3), () {
        if (!mounted) return;
        setState(() {
          showAppliedState = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Blind Mixer",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.purple),
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Settings clicked")));
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.purple),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Notifications clicked")),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            // Center Illustration
            Center(child: Image.asset("assets/img.png", height: 280)),

            const SizedBox(height: 20),

            // Title + Subtitle
            Center(
              child: Column(
                children: [
                  Text(
                    showAppliedState
                        ? "Your Blind Date is Confirmed 🎉"
                        : "Upcoming Blind Date",
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Let Mixer surprise you with a match.",
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.calendar_today, size: 18, color: Colors.purple),
                    SizedBox(width: 8),
                    Text(
                      "September 28 - 10 PM",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // Bottom widget
            if (showAppliedState)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: BoxBorder.all(color: Colors.purple),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check),
                      Text(
                        "Applied for Blind Mixer",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              Column(
                children: [
                  const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Sign Up", style: TextStyle(color: Colors.purple)),
                        SizedBox(width: 16),
                        Text("•", style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 16),
                        Text(
                          "Smart Match",
                          style: TextStyle(color: Colors.purple),
                        ),
                        SizedBox(width: 16),
                        Text("•", style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 16),
                        Text(
                          "Blind Date",
                          style: TextStyle(color: Colors.purple),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: _openFormAndWait,
                      icon: const Icon(Icons.edit, color: Colors.white),
                      label: const Text(
                        "Fill out the Form",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(selectedIndex: 3),
    );
  }
}
