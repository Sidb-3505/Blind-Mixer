import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/bottom_navigation.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fields = [
      {"icon": Icons.person_outline, "label": "About me (Bio)"},
      {"icon": Icons.search, "label": "What are you looking for?"},
      {"icon": Icons.male, "label": "Gender"},
      {"icon": Icons.cake_outlined, "label": "Birthday (Age)"},
      {"icon": Icons.height, "label": "Height"},
      {"icon": Icons.favorite_outline, "label": "Interested in?"},
      {"icon": Icons.wc, "label": "Sexuality"},
      {"icon": Icons.people_alt_outlined, "label": "Relationship"},
      {"icon": Icons.public, "label": "Ethnicity"},
      {"icon": Icons.child_care, "label": "Kids"},
      {"icon": Icons.local_bar, "label": "Drinking"},
      {"icon": Icons.smoking_rooms, "label": "Smoking"},
      {"icon": Icons.grass, "label": "Marijuana"},
      {"icon": Icons.church, "label": "Religious Beliefs"},
      {"icon": Icons.policy, "label": "Political Views"},
      {"icon": Icons.interests, "label": "Interests and Hobbies"},
      {"icon": Icons.self_improvement, "label": "Values & Lifestyle"},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            color: AppColors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: AppColors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Image Section (single slot)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 120,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                  child: const Icon(
                    Icons.add_a_photo,
                    size: 40,
                    color: AppColors.textGray,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 5),

            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(bottom: 0),
              child: Text(
                "Your Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            // Fields List
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: fields.length,
              separatorBuilder: (_, __) => const Divider(height: 0.5),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    fields[index]["icon"] as IconData,
                    color: AppColors.deepPurple,
                  ),
                  title: Text(
                    fields[index]["label"] as String,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: AppColors.textGray,
                  ),
                  onTap: () {
                    // TODO: Navigate to edit field screen
                  },
                );
              },
            ),

            const SizedBox(height: 20),

            // Bottom Card
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.lightPink,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Discover your Perfect Match",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Take the quiz again",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(selectedIndex: 4),
    );
  }
}
