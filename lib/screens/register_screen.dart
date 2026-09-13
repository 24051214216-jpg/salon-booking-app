import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/routes/app_routes.dart';
import '../widgets/custom_button.dart';
import '../widgets/responsive_content.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Daftar Akun')),
      body: ResponsiveContent(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Buat akun baru', style: AppTextStyles.display),
              const SizedBox(height: 24),
              _field('Nama Lengkap'),
              const SizedBox(height: 16),
              _field('Email'),
              const SizedBox(height: 16),
              _field('Password', obscure: true),
              const SizedBox(height: 32),
              CustomButton(
                label: 'Daftar',
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, AppRoutes.login),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _field(String label, {bool obscure = false}) {
    return TextField(
      obscureText: obscure,
      style: AppTextStyles.label,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTextStyles.body,
        filled: true,
        fillColor: const Color(0xFFF7F4F2),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.rose, width: 1.4),
        ),
      ),
    );
  }
}
