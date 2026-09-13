import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/routes/app_routes.dart';
import '../widgets/app_drawer.dart';
import '../widgets/custom_button.dart';
import '../widgets/responsive_content.dart';

class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ivory,
      appBar: AppBar(title: const Text('Konfirmasi Booking')),
      drawer: const AppDrawer(),
      body: ResponsiveContent(
        maxWidth: 420,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.check_circle, color: AppColors.rose, size: 56),
              const SizedBox(height: 16),
              Text('Booking berhasil', style: AppTextStyles.display),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.blush,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Column(
                  children: [
                    _SummaryRow(label: 'Salon', value: 'Glow Beauty Salon'),
                    _SummaryRow(label: 'Layanan', value: 'Haircut & Styling'),
                    _SummaryRow(label: 'Tanggal', value: '18 September 2026'),
                    _SummaryRow(label: 'Jam', value: '10:00'),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              CustomButton(
                label: 'Kembali ke beranda',
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.home,
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

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;

  const _SummaryRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyles.body),
          Text(value, style: AppTextStyles.subheading),
        ],
      ),
    );
  }
}
