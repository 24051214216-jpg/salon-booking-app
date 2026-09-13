import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/routes/app_routes.dart';
import '../widgets/app_drawer.dart';
import '../widgets/custom_button.dart';
import '../widgets/tab_pill.dart';

class SalonDetailScreen extends StatefulWidget {
  const SalonDetailScreen({super.key});

  @override
  State<SalonDetailScreen> createState() => _SalonDetailScreenState();
}

class _SalonDetailScreenState extends State<SalonDetailScreen> {
  int _tabIndex = 0;
  final List<String> _tabs = const [
    'Services',
    'Photo',
    'Package',
    'Review',
    'About',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const AppDrawer(),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // ---------- Header Image + Overlay ----------
            Stack(
              children: [
                // Cover
                Container(
                  height: 220,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: AppColors.blush),
                  child: const Icon(
                    Icons.storefront,
                    size: 64,
                    color: AppColors.rose,
                  ),
                ),
                // Tombol back
                Positioned(
                  top: 12,
                  left: 12,
                  child: _CircleIconButton(
                    icon: Icons.arrow_back,
                    onTap: () => Navigator.pop(context),
                  ),
                ),
                // Tombol favorite & share
                Positioned(
                  top: 12,
                  right: 12,
                  child: Row(
                    children: [
                      _CircleIconButton(
                        icon: Icons.favorite_border,
                        onTap: () {},
                      ),
                      const SizedBox(width: 8),
                      _CircleIconButton(icon: Icons.ios_share, onTap: () {}),
                    ],
                  ),
                ),
                // Rating badge
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: AppColors.gold, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          '4.8',
                          style: AppTextStyles.label.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(' (1.2k Review)', style: AppTextStyles.caption),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ---------- Nama & Info ----------
                  Text('Glow Beauty Salon', style: AppTextStyles.display),
                  const SizedBox(height: 4),
                  Text(
                    'Haircuts, Make Up, Shaving, Massage',
                    style: AppTextStyles.body,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: AppColors.rose,
                        size: 16,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          'Jl. Melati No. 10, Denpasar, Bali 80361',
                          style: AppTextStyles.caption,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: AppColors.rose,
                        size: 16,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '15 min • 1.5km • Mon - Sun | 11am - 11pm',
                        style: AppTextStyles.caption,
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),

                  // ---------- Quick Actions ----------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _QuickAction(icon: Icons.language, label: 'Website'),
                      _QuickAction(
                        icon: Icons.chat_bubble_outline,
                        label: 'Message',
                      ),
                      _QuickAction(icon: Icons.call, label: 'Call'),
                      _QuickAction(icon: Icons.directions, label: 'Direction'),
                      _QuickAction(icon: Icons.ios_share, label: 'Share'),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // ---------- Tab Pill ----------
                  TabPill(
                    tabs: _tabs,
                    selectedIndex: _tabIndex,
                    onSelected: (i) => setState(() => _tabIndex = i),
                  ),
                  const SizedBox(height: 8),
                  const Divider(color: AppColors.hairline, height: 1),
                  const SizedBox(height: 16),

                  // ---------- Konten Tab ----------
                  _buildTabContent(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
      // Tombol Book Appointment di bawah
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: AppColors.hairline)),
        ),
        child: SafeArea(
          top: false,
          child: CustomButton(
            label: 'Book Appointment',
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.bookingForm),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_tabIndex) {
      case 0:
        return _servicesTab();
      case 1:
        return _photoTab();
      case 2:
        return _packageTab();
      case 3:
        return _reviewTab();
      default:
        return _aboutTab();
    }
  }

  // ---------- TAB: Services ----------
  Widget _servicesTab() {
    final items = [
      ('Hair Cut', '20 Types', 'Rp 75.000'),
      ('Hair Coloring', '12 Types', 'Rp 250.000'),
      ('Hair Wash', '08 Types', 'Rp 60.000'),
      ('Hair Spa', '06 Types', 'Rp 120.000'),
      ('Facial Treatment', '10 Types', 'Rp 150.000'),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Services (${items.length})', style: AppTextStyles.subheading),
            Text(
              'Lihat semua',
              style: AppTextStyles.label.copyWith(color: AppColors.rose),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...items.map((e) => _ServiceTile(name: e.$1, type: e.$2, price: e.$3)),
      ],
    );
  }

  // ---------- TAB: Photo ----------
  Widget _photoTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Photos (8)', style: AppTextStyles.subheading),
            Row(
              children: [
                const Icon(
                  Icons.add_circle_outline,
                  size: 16,
                  color: AppColors.rose,
                ),
                const SizedBox(width: 4),
                Text(
                  'Tambah foto',
                  style: AppTextStyles.label.copyWith(color: AppColors.rose),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: List.generate(
            6,
            (i) => Container(
              decoration: BoxDecoration(
                color: AppColors.blush,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.image, color: AppColors.rose, size: 28),
            ),
          ),
        ),
      ],
    );
  }

  // ---------- TAB: Package ----------
  Widget _packageTab() {
    final packages = [
      ('Hair Cutting & Hair Stylist', 'Spesial Offer Package', 'Rp 125.000'),
      ('Beauty Make Up', 'Spesial Offer Package', 'Rp 140.000'),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Package (${packages.length})', style: AppTextStyles.subheading),
        const SizedBox(height: 12),
        ...packages.map(
          (p) => Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.hairline),
            ),
            child: Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
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
                      Text(p.$1, style: AppTextStyles.subheading),
                      const SizedBox(height: 2),
                      Text(p.$2, style: AppTextStyles.caption),
                      const SizedBox(height: 6),
                      Text(p.$3, style: AppTextStyles.price),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.rose,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Book Now',
                      style: AppTextStyles.caption.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ---------- TAB: Review ----------
  Widget _reviewTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Reviews', style: AppTextStyles.subheading),
            Row(
              children: [
                const Icon(Icons.edit, size: 14, color: AppColors.rose),
                const SizedBox(width: 4),
                Text(
                  'Tulis ulasan',
                  style: AppTextStyles.label.copyWith(color: AppColors.rose),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(
            hintText: 'Cari ulasan...',
            hintStyle: AppTextStyles.body,
            prefixIcon: const Icon(
              Icons.search,
              color: AppColors.grey,
              size: 18,
            ),
            filled: true,
            fillColor: const Color(0xFFF7F4F2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 16),
        _ReviewItem(
          name: 'Dale Thiel',
          rating: '5.0',
          comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
        ),
        _ReviewItem(
          name: 'Katheryn Murphy',
          rating: '4.8',
          comment: 'Pelayanan ramah, hasil potongan rapi dan sesuai request. Recommended!',
        ),
      ],
    );
  }

  // ---------- TAB: About ----------
  Widget _aboutTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('About Us', style: AppTextStyles.subheading),
        const SizedBox(height: 8),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
          'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
          style: AppTextStyles.body,
        ),
        const SizedBox(height: 20),
        Text('Working Hours', style: AppTextStyles.subheading),
        const SizedBox(height: 8),
        const _WorkingHourRow(day: 'Monday', hour: '11:00 - 22:00'),
        const _WorkingHourRow(day: 'Tuesday', hour: '11:00 - 22:00'),
        const _WorkingHourRow(day: 'Wednesday', hour: '11:00 - 22:00'),
        const _WorkingHourRow(day: 'Thursday', hour: '11:00 - 22:00'),
        const _WorkingHourRow(day: 'Friday', hour: '11:00 - 23:00'),
        const _WorkingHourRow(day: 'Saturday', hour: '10:00 - 23:00'),
        const _WorkingHourRow(day: 'Sunday', hour: '10:00 - 21:00'),
      ],
    );
  }
}

// =====================================================
// Komponen pendukung
// =====================================================

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _CircleIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, size: 18, color: AppColors.plum),
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  const _QuickAction({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.blush,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.rose, size: 20),
        ),
        const SizedBox(height: 6),
        Text(label, style: AppTextStyles.caption),
      ],
    );
  }
}

class _ServiceTile extends StatelessWidget {
  final String name;
  final String type;
  final String price;
  const _ServiceTile({
    required this.name,
    required this.type,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.hairline),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppTextStyles.subheading),
                const SizedBox(height: 2),
                Text(type, style: AppTextStyles.caption),
              ],
            ),
          ),
          Text(price, style: AppTextStyles.price),
          const SizedBox(width: 6),
          const Icon(Icons.chevron_right, size: 18, color: AppColors.grey),
        ],
      ),
    );
  }
}

class _ReviewItem extends StatelessWidget {
  final String name;
  final String rating;
  final String comment;
  const _ReviewItem({
    required this.name,
    required this.rating,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.hairline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.blush,
                child: const Icon(
                  Icons.person,
                  size: 16,
                  color: AppColors.rose,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(child: Text(name, style: AppTextStyles.subheading)),
              const Icon(Icons.star, color: AppColors.gold, size: 14),
              const SizedBox(width: 4),
              Text(rating, style: AppTextStyles.label),
            ],
          ),
          const SizedBox(height: 8),
          Text(comment, style: AppTextStyles.body),
        ],
      ),
    );
  }
}

class _WorkingHourRow extends StatelessWidget {
  final String day;
  final String hour;
  const _WorkingHourRow({required this.day, required this.hour});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(day, style: AppTextStyles.body),
          Text(hour, style: AppTextStyles.label),
        ],
      ),
    );
  }
}
