import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../widgets/app_drawer.dart';
import '../widgets/custom_button.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Kontak & Lokasi')),
      drawer: const AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Hubungi Kami', style: AppTextStyles.display),
          const SizedBox(height: 4),
          Text('Kami siap membantu kebutuhanmu', style: AppTextStyles.body),
          const SizedBox(height: 20),

          // Quick contact
          Row(
            children: const [
              Expanded(
                child: _ContactCard(
                  icon: Icons.call,
                  label: 'Telepon',
                  value: '+62 812-3456',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _ContactCard(
                  icon: Icons.email,
                  label: 'Email',
                  value: 'hello@lumiere.id',
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Map placeholder
          Text('Lokasi', style: AppTextStyles.heading),
          const SizedBox(height: 10),
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: AppColors.blush,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: const [
                Icon(Icons.map, size: 64, color: AppColors.rose),
                Positioned(
                  bottom: 12,
                  left: 12,
                  right: 12,
                  child: _AddressPill(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const _InfoTile(
            icon: Icons.location_on,
            title: 'Alamat',
            subtitle: 'Jl. Melati No. 10, Denpasar, Bali 80361',
          ),
          const _InfoTile(
            icon: Icons.access_time,
            title: 'Jam Operasional',
            subtitle: 'Senin - Minggu, 09:00 - 21:00',
          ),
          const _InfoTile(
            icon: Icons.email,
            title: 'Email',
            subtitle: 'hello@lumiere.id',
          ),
          const SizedBox(height: 24),

          // Form pesan
          Text('Kirim Pesan', style: AppTextStyles.heading),
          const SizedBox(height: 12),
          _field('Nama'),
          const SizedBox(height: 12),
          _field('Email'),
          const SizedBox(height: 12),
          _field('Pesan', maxLines: 4),
          const SizedBox(height: 16),
          CustomButton(label: 'Kirim', icon: Icons.send, onPressed: () {}),
        ],
      ),
    );
  }

  Widget _field(String label, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      style: AppTextStyles.label,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTextStyles.body,
        filled: true,
        fillColor: const Color(0xFFF7F4F2),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
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

class _ContactCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _ContactCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.blush,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.rose, size: 22),
          const SizedBox(height: 10),
          Text(label, style: AppTextStyles.caption),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTextStyles.subheading,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _AddressPill extends StatelessWidget {
  const _AddressPill();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: const [
          Icon(Icons.location_on, size: 16, color: AppColors.rose),
          SizedBox(width: 6),
          Expanded(
            child: Text(
              'Jl. Melati No. 10, Denpasar',
              style: TextStyle(fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const _InfoTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.hairline),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.blush,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppColors.rose, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.caption),
                const SizedBox(height: 2),
                Text(subtitle, style: AppTextStyles.subheading),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
