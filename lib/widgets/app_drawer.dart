import 'package:flutter/material.dart';

import '../core/routes/app_routes.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
              child: Text('Lumière Salon', style: AppTextStyles.logotype),
            ),
            const Divider(height: 1, indent: 24, endIndent: 24),
            const SizedBox(height: 8),
            _item(context, 'Home', AppRoutes.home),
            _item(context, 'Layanan & Harga', AppRoutes.services),
            _item(context, 'Detail Salon', AppRoutes.salonDetail),
            _item(context, 'Booking', AppRoutes.bookingForm),
            _item(context, 'Kontak & Lokasi', AppRoutes.contact),
            _item(context, 'Tentang Kami', AppRoutes.about),
            _item(context, 'Tim / Stylist', AppRoutes.team),
            _item(context, 'Galeri', AppRoutes.gallery),
            _item(context, 'Promo & Paket', AppRoutes.promo),
            _item(context, 'Testimoni', AppRoutes.review),
            _item(context, 'Profil', AppRoutes.profile),
          ],
        ),
      ),
    );
  }

  Widget _item(BuildContext context, String title, String route) {
    final active = ModalRoute.of(context)?.settings.name == route;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, route);
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: active ? AppColors.blush : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            title,
            style: AppTextStyles.label.copyWith(
              color: active ? AppColors.rose : AppColors.charcoal,
              fontWeight: active ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
