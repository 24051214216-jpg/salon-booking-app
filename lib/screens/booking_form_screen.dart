import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/routes/app_routes.dart';
import '../widgets/app_drawer.dart';
import '../widgets/custom_button.dart';
import '../widgets/responsive_content.dart';

class BookingFormScreen extends StatelessWidget {
  const BookingFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ivory,
      appBar: AppBar(title: const Text('Form Booking')),
      drawer: const AppDrawer(),
      body: ResponsiveContent(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Isi detail booking', style: AppTextStyles.display),
              const SizedBox(height: 24),
              _field('Pilih Layanan', Icons.content_cut),
              const SizedBox(height: 16),
              _field('Tanggal', Icons.calendar_today),
              const SizedBox(height: 16),
              _field('Jam', Icons.access_time),
              const SizedBox(height: 32),
              CustomButton(
                label: 'Konfirmasi booking',
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.bookingConfirmation),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _field(String label, IconData icon) {
    return TextField(
      style: AppTextStyles.label,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTextStyles.body,
        hintStyle: AppTextStyles.body,
        filled: true,
        fillColor: AppColors.blush.withOpacity(0.35),
        prefixIcon: Icon(icon, color: AppColors.rose, size: 20),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.rose, width: 1.4),
        ),
      ),
    );
  }
}
