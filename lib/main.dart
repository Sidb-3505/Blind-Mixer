import 'package:flutter/material.dart';
import 'constants/app_colors.dart';
import 'screens/edit_profile_screen.dart';
import 'screens/blind_mixer_screen.dart';
import 'screens/blind_mixer_form_screen.dart';

void main() {
  runApp(const BlindMixerApp());
}

class BlindMixerApp extends StatelessWidget {
  const BlindMixerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blind Mixer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'SF Pro Display',
        scaffoldBackgroundColor: AppColors.white,
      ),
      initialRoute: '/blind-mixer',
      routes: {
        '/edit-profile': (context) => const EditProfileScreen(),
        '/blind-mixer': (context) => const BlindMixerScreen(),
        '/blind-mixer-form': (context) => const BlindMixerFormScreen(),
      },
    );
  }
}
