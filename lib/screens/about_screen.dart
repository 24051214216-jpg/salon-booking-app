import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../widgets/app_drawer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Tentang Kami')),
      drawer: const AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Banner
          Container(
            height: 160,
            decoration: BoxDecoration(
              color: AppColors.blush,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(
              Icons.storefront,
              size: 64,
              color: AppColors.rose,
            ),
          ),
          const SizedBox(height: 20),
          Text('Lumière Salon', style: AppTextStyles.display),
          const SizedBox(height: 8),
          Text(
            'Lumière Salon adalah platform booking salon yang menghubungkan '
            'kamu dengan salon dan stylist terbaik di kotamu. Kami percaya '
            'perawatan diri harus mudah, tenang, dan menyenangkan.',
            style: AppTextStyles.body,
          ),
          const SizedBox(height: 24),

          // Statistik singkat
          Row(
            children: const [
              Expanded(
                child: _StatCard(value: '500+', label: 'Salon'),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _StatCard(value: '2k+', label: 'Stylist'),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _StatCard(value: '50k+', label: 'Booking'),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Visi & Misi
          Text('Visi', style: AppTextStyles.heading),
          const SizedBox(height: 6),
          Text(
            'Menjadi platform kecantikan #1 di Indonesia yang '
            'mengutamakan kenyamanan pelanggan.',
            style: AppTextStyles.body,
          ),
          const SizedBox(height: 16),
          Text('Misi', style: AppTextStyles.heading),
          const SizedBox(height: 6),
          const _BulletPoint('Menyediakan akses ke salon terbaik.'),
          const _BulletPoint('Menghadirkan pengalaman booking yang mudah.'),
          const _BulletPoint('Mendukung pertumbuhan bisnis salon lokal.'),
          const SizedBox(height: 24),

          // Info kontak singkat
          Text('Hubungi Kami', style: AppTextStyles.heading),
          const SizedBox(height: 8),
          const _InfoRow(icon: Icons.call, label: '+62 812-3456-7890'),
          const _InfoRow(icon: Icons.email, label: 'hello@lumiere.id'),
          const _InfoRow(
            icon: Icons.location_on,
            label: 'Jl. Melati No. 10, Denpasar',
          ),
          const SizedBox(height: 24),
          Center(child: Text('Versi 1.0.0', style: AppTextStyles.caption)),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  const _StatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.blush,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: AppTextStyles.heading.copyWith(color: AppColors.rose),
          ),
          const SizedBox(height: 2),
          Text(label, style: AppTextStyles.caption),
        ],
      ),
    );
  }
}

class _BulletPoint extends StatelessWidget {
  final String text;
  const _BulletPoint(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, size: 16, color: AppColors.rose),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: AppTextStyles.body)),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  const _InfoRow({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.rose),
          const SizedBox(width: 10),
          Text(label, style: AppTextStyles.body),
        ],
      ),
    );
  }
}
