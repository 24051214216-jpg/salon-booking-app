import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/routes/app_routes.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 100),
          children: [
            // Header: lokasi & avatar
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Lokasi', style: AppTextStyles.caption),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: AppColors.rose,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Denpasar, Bali',
                            style: AppTextStyles.subheading,
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            size: 18,
                            color: AppColors.grey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.blush,
                  child: const Icon(
                    Icons.person,
                    color: AppColors.rose,
                    size: 22,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Search bar
            Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F4F2),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: AppColors.grey, size: 20),
                  const SizedBox(width: 10),
                  Text(
                    'Cari salon, layanan, stylist...',
                    style: AppTextStyles.body,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Banner promo
            Container(
              height: 140,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: const LinearGradient(
                  colors: [AppColors.rose, AppColors.roseDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'PROMO HARI INI',
                      style: AppTextStyles.caption.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Diskon s.d 20%',
                        style: AppTextStyles.display.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Berlaku hingga 30 Sept 2026',
                        style: AppTextStyles.body.copyWith(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            SectionHeader(
              title: 'Layanan',
              actionLabel: 'Lihat semua',
              onAction: () => Navigator.pushNamed(context, AppRoutes.services),
            ),
            SizedBox(
              height: 88,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  _ServiceChip(icon: Icons.content_cut, label: 'Gunting'),
                  _ServiceChip(icon: Icons.water_drop, label: 'Cuci'),
                  _ServiceChip(icon: Icons.brush, label: 'Catok'),
                  _ServiceChip(icon: Icons.spa, label: 'Creambath'),
                  _ServiceChip(icon: Icons.palette, label: 'Warnai'),
                  _ServiceChip(
                    icon: Icons.face_retouching_natural,
                    label: 'Makeup',
                  ),
                ],
              ),
            ),

            SectionHeader(
              title: 'Salon Terpopuler',
              actionLabel: 'Lihat semua',
              onAction: () => Navigator.pushNamed(context, AppRoutes.services),
            ),
            _SalonListCard(
              name: 'Pretty Salon',
              address: 'Jl. Melati No. 10, Denpasar',
              rating: '4.8',
              price: 'Rp 15.000',
              onTap: () => Navigator.pushNamed(context, AppRoutes.salonDetail),
            ),
            _SalonListCard(
              name: 'Pretty Salon Cabang 2',
              address: 'Jl. Kenanga No. 5, Denpasar',
              rating: '4.6',
              price: 'Rp 20.000',
              onTap: () => Navigator.pushNamed(context, AppRoutes.salonDetail),
            ),
            _SalonListCard(
              name: 'Pretty Salon Cabang 3',
              address: 'Jl. Anggrek No. 22, Denpasar',
              rating: '4.9',
              price: 'Rp 15.000',
              onTap: () => Navigator.pushNamed(context, AppRoutes.salonDetail),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNav(currentIndex: 0),
    );
  }
}

class _ServiceChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _ServiceChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.blush,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.rose, size: 24),
          ),
          const SizedBox(height: 6),
          Text(label, style: AppTextStyles.caption),
        ],
      ),
    );
  }
}

class _SalonListCard extends StatelessWidget {
  final String name;
  final String address;
  final String rating;
  final String price;
  final VoidCallback onTap;

  const _SalonListCard({
    required this.name,
    required this.address,
    required this.rating,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.hairline),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: AppColors.blush,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.storefront,
                color: AppColors.rose,
                size: 28,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: AppTextStyles.subheading),
                  const SizedBox(height: 4),
                  Text(
                    address,
                    style: AppTextStyles.caption,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(Icons.star, color: AppColors.gold, size: 14),
                      const SizedBox(width: 4),
                      Text(rating, style: AppTextStyles.caption),
                      const SizedBox(width: 12),
                      Text(price, style: AppTextStyles.price),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.grey),
          ],
        ),
      ),
    );
  }
}
