import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/routes/app_routes.dart';
import '../widgets/app_drawer.dart';
import '../widgets/custom_button.dart';
import '../widgets/responsive_content.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ivory,
      appBar: AppBar(title: const Text('Profil')),
      drawer: const AppDrawer(),
      body: ResponsiveContent(
        maxWidth: 420,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Container(
                width: 88,
                height: 88,
                decoration: const BoxDecoration(
                  color: AppColors.blush,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person,
                  size: 40,
                  color: AppColors.rose,
                ),
              ),
              const SizedBox(height: 16),
              Text('Daffa', style: AppTextStyles.heading),
              Text('daffa@email.com', style: AppTextStyles.body),
              const SizedBox(height: 32),
              CustomButton(
                label: 'Logout',
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.login,
                  (r) => false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
