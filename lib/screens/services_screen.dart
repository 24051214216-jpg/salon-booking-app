import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/routes/app_routes.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/custom_button.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      _Service('Haircut & Styling', '20 tipe', 75000, Icons.content_cut),
      _Service('Hair Coloring', '12 tipe', 250000, Icons.palette),
      _Service('Hair Spa', '8 tipe', 120000, Icons.spa),
      _Service('Facial Treatment', '6 tipe', 150000, Icons.face),
      _Service('Manicure & Pedicure', '10 tipe', 100000, Icons.brush),
      _Service('Make Up', '5 tipe', 200000, Icons.auto_awesome),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Layanan & Harga')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
        children: [
          Text('Pilih layanan favoritmu', style: AppTextStyles.display),
          const SizedBox(height: 4),
          Text(
            'Harga transparan, kualitas terjamin',
            style: AppTextStyles.body,
          ),
          const SizedBox(height: 20),
          ...services.map((s) => _ServiceTile(service: s)),
          const SizedBox(height: 12),
          CustomButton(
            label: 'Booking sekarang',
            icon: Icons.calendar_today,
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.bookingForm),
          ),
        ],
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 1),
    );
  }
}

class _Service {
  final String name;
  final String type;
  final int price;
  final IconData icon;
  _Service(this.name, this.type, this.price, this.icon);
}

class _ServiceTile extends StatelessWidget {
  final _Service service;
  const _ServiceTile({required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.hairline),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: AppColors.blush,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(service.icon, color: AppColors.rose, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(service.name, style: AppTextStyles.subheading),
                const SizedBox(height: 2),
                Text(service.type, style: AppTextStyles.caption),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Rp ${service.price ~/ 1000}.000',
                style: AppTextStyles.price,
              ),
              const SizedBox(height: 4),
              const Icon(Icons.chevron_right, size: 18, color: AppColors.grey),
            ],
          ),
        ],
      ),
    );
  }
}
