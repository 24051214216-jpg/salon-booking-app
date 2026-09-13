import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/routes/app_routes.dart';
import '../widgets/app_drawer.dart';

class PromoScreen extends StatelessWidget {
  const PromoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final promos = [
      _Promo(
        'Diskon 40% Haircut',
        'Berlaku s.d 30 Sept 2026',
        '40%',
        AppColors.rose,
      ),
      _Promo(
        'Bundling Facial + Spa',
        'Hemat Rp 100.000',
        'Rp 200rb',
        AppColors.gold,
      ),
      _Promo(
        'Free Hair Wash',
        'Min. transaksi Rp 150.000',
        'GRATIS',
        AppColors.plum,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Promo & Paket')),
      drawer: const AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Promo Spesial', style: AppTextStyles.display),
          const SizedBox(height: 4),
          Text('Jangan lewatkan penawaran terbatas', style: AppTextStyles.body),
          const SizedBox(height: 20),

          ...promos.map((p) => _PromoCard(promo: p)),
          const SizedBox(height: 8),

          Text('Paket Populer', style: AppTextStyles.heading),
          const SizedBox(height: 12),
          const _PackageCard(
            title: 'Hair Cutting & Stylist',
            subtitle: 'Spesial Offer Package',
            price: 'Rp 125.000',
          ),
          const _PackageCard(
            title: 'Beauty Make Up',
            subtitle: 'Spesial Offer Package',
            price: 'Rp 140.000',
          ),
          const _PackageCard(
            title: 'Facial Glow',
            subtitle: 'Termasuk masker & massage',
            price: 'Rp 180.000',
          ),
        ],
      ),
    );
  }
}

class _Promo {
  final String title;
  final String subtitle;
  final String badge;
  final Color color;
  _Promo(this.title, this.subtitle, this.badge, this.color);
}

class _PromoCard extends StatelessWidget {
  final _Promo promo;
  const _PromoCard({required this.promo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: [promo.color, promo.color.withOpacity(0.75)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    promo.badge,
                    style: AppTextStyles.caption.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  promo.title,
                  style: AppTextStyles.heading.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 4),
                Text(
                  promo.subtitle,
                  style: AppTextStyles.caption.copyWith(color: Colors.white70),
                ),
              ],
            ),
          ),
          const Icon(Icons.local_offer, color: Colors.white, size: 40),
        ],
      ),
    );
  }
}

class _PackageCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  const _PackageCard({
    required this.title,
    required this.subtitle,
    required this.price,
  });

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
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.blush,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.card_giftcard, color: AppColors.rose),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.subheading),
                const SizedBox(height: 2),
                Text(subtitle, style: AppTextStyles.caption),
                const SizedBox(height: 6),
                Text(price, style: AppTextStyles.price),
              ],
            ),
          ),
          SizedBox(
            height: 34,
            child: ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.bookingForm),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.rose,
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Book',
                style: AppTextStyles.caption.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
