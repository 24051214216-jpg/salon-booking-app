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
    // Daftar layanan Pretty Salon sesuai daftar harga
    final perawatanDasar = [
      _Service('Cuci rambut', 'Perawatan Dasar', 15000, Icons.water_drop),
      _Service(
        'Gunting pria dewasa',
        'Perawatan Dasar',
        25000,
        Icons.content_cut,
      ),
      _Service(
        'Gunting + cuci pria',
        'Perawatan Dasar',
        30000,
        Icons.content_cut,
      ),
      _Service('Gunting anak pria', 'Perawatan Dasar', 20000, Icons.child_care),
      _Service(
        'Gunting anak wanita',
        'Perawatan Dasar',
        25000,
        Icons.child_care,
      ),
      _Service(
        'Gunting wanita dewasa',
        'Perawatan Dasar',
        30000,
        Icons.content_cut,
      ),
    ];

    final stylingRambut = [
      _Service('Catok', 'Styling Rambut', 30000, Icons.brush),
      _Service('Catok + cuci', 'Styling Rambut', 40000, Icons.brush),
      _Service('Blow biasa + cuci', 'Styling Rambut', 25000, Icons.air),
      _Service('Blow panjang variasi', 'Styling Rambut', 40000, Icons.air),
    ];

    final perawatanRambut = [
      _Service('Creambath tradisional', 'Perawatan Rambut', 60000, Icons.spa),
      _Service('Masker rambut', 'Perawatan Rambut', 70000, Icons.spa),
      _Service('Hair spa', 'Perawatan Rambut', 75000, Icons.spa),
    ];

    final pewarnaanRambut = [
      _Service('Bleaching pria', 'Pewarnaan Rambut', 75000, Icons.palette),
      _Service('Bleaching wanita', 'Pewarnaan Rambut', 100000, Icons.palette),
      _Service(
        'Pewarnaan pria pendek',
        'Pewarnaan Rambut',
        100000,
        Icons.palette,
      ),
      _Service('Pewarnaan wanita', 'Pewarnaan Rambut', 150000, Icons.palette),
      _Service('Highlight pria', 'Pewarnaan Rambut', 100000, Icons.palette),
      _Service('Highlight wanita', 'Pewarnaan Rambut', 150000, Icons.palette),
      _Service('Keriting', 'Pewarnaan Rambut', 150000, Icons.auto_awesome),
    ];

    final makeUp = [
      _Service('Make up', 'Make Up', 100000, Icons.face_retouching_natural),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Layanan & Harga')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 100),
        children: [
          Text('Daftar Harga', style: AppTextStyles.display),
          const SizedBox(height: 4),
          Text(
            'Pretty Salon - Harga transparan, kualitas terjamin',
            style: AppTextStyles.body,
          ),
          const SizedBox(height: 20),

          // Perawatan Dasar
          _SectionTitle(icon: Icons.content_cut, title: 'Perawatan Dasar'),
          ...perawatanDasar.map((s) => _ServiceTile(service: s)),

          // Styling Rambut
          _SectionTitle(icon: Icons.brush, title: 'Styling Rambut'),
          ...stylingRambut.map((s) => _ServiceTile(service: s)),

          // Perawatan Rambut
          _SectionTitle(icon: Icons.spa, title: 'Perawatan Rambut'),
          ...perawatanRambut.map((s) => _ServiceTile(service: s)),

          // Pewarnaan Rambut
          _SectionTitle(icon: Icons.palette, title: 'Pewarnaan Rambut'),
          ...pewarnaanRambut.map((s) => _ServiceTile(service: s)),

          // Make Up
          _SectionTitle(icon: Icons.face_retouching_natural, title: 'Make Up'),
          ...makeUp.map((s) => _ServiceTile(service: s)),

          const SizedBox(height: 16),
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
  final String category;
  final int price;
  final IconData icon;
  _Service(this.name, this.category, this.price, this.icon);
}

class _SectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  const _SectionTitle({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.blush,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppColors.rose, size: 16),
          ),
          const SizedBox(width: 10),
          Text(title, style: AppTextStyles.heading),
        ],
      ),
    );
  }
}

class _ServiceTile extends StatelessWidget {
  final _Service service;
  const _ServiceTile({required this.service});

  String _formatPrice(int price) {
    final str = price.toString();
    final buf = StringBuffer();
    for (int i = 0; i < str.length; i++) {
      if (i > 0 && (str.length - i) % 3 == 0) buf.write('.');
      buf.write(str[i]);
    }
    return buf.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.hairline),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.blush,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(service.icon, color: AppColors.rose, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(service.name, style: AppTextStyles.subheading)),
          Text('Rp ${_formatPrice(service.price)}', style: AppTextStyles.price),
        ],
      ),
    );
  }
}
