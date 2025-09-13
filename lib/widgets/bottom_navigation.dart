import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class BottomNavigationWidget extends StatelessWidget {
  final int selectedIndex;

  const BottomNavigationWidget({Key? key, required this.selectedIndex})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icons = [
      Icons.settings_outlined,
      Icons.favorite_outline,
      Icons.camera_alt_outlined,
      Icons.remove_red_eye_outlined,
      Icons.person_outline,
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          icons.length,
          (index) => _buildNavIcon(
            context,
            icons[index],
            index,
            index == selectedIndex,
          ),
        ),
      ),
    );
  }

  Widget _buildNavIcon(
    BuildContext context,
    IconData icon,
    int index,
    bool isSelected,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: () {
        if (index == 4) Navigator.pushNamed(context, '/edit-profile');
        if (index == 3) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/blind-mixer',
            (route) => false, // remove ALL previous routes
          );
        }
      },
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.deepPurple.withOpacity(0.1) : null,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Icon(
          icon,
          size: 24,
          color: isSelected ? AppColors.deepPurple : AppColors.textGray,
        ),
      ),
    );
  }
}
