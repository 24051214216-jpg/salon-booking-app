import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../widgets/app_drawer.dart';
import '../widgets/custom_button.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Testimoni / Review')),
      drawer: const AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Ringkasan rating
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.blush,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '4.8',
                      style: AppTextStyles.display.copyWith(
                        color: AppColors.rose,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: List.generate(
                        5,
                        (_) => const Icon(
                          Icons.star,
                          size: 16,
                          color: AppColors.gold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text('1.2k ulasan', style: AppTextStyles.caption),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    _RatingBar(star: 5, value: 0.8),
                    _RatingBar(star: 4, value: 0.5),
                    _RatingBar(star: 3, value: 0.2),
                    _RatingBar(star: 2, value: 0.1),
                    _RatingBar(star: 1, value: 0.05),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          Text('Tulis Ulasan', style: AppTextStyles.heading),
          const SizedBox(height: 10),
          Row(
            children: List.generate(
              5,
              (_) => const Padding(
                padding: EdgeInsets.only(right: 6),
                child: Icon(Icons.star_border, size: 32, color: AppColors.gold),
              ),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Bagikan pengalamanmu...',
              hintStyle: AppTextStyles.body,
              filled: true,
              fillColor: const Color(0xFFF7F4F2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 12),
          CustomButton(label: 'Kirim Ulasan', onPressed: () {}),
          const SizedBox(height: 24),

          Text('Ulasan Terbaru', style: AppTextStyles.heading),
          const SizedBox(height: 12),
          _ReviewCard(
            name: 'Dale Thiel',
            rating: '5.0',
            date: '2 hari lalu',
            comment: 'Pelayanan sangat ramah, hasil potongan rapi sesuai request. Recommended!',
          ),
          _ReviewCard(
            name: 'Katheryn Murphy',
            rating: '4.8',
            date: '5 hari lalu',
            comment: 'Tempat nyaman, bersih, dan harga terjangkau. Pasti balik lagi.',
          ),
          _ReviewCard(
            name: 'Esther Howard',
            rating: '5.0',
            date: '1 minggu lalu',
            comment: 'Suka banget sama hasilnya, stylist-nya profesional dan detail.',
          ),
        ],
      ),
    );
  }
}

class _RatingBar extends StatelessWidget {
  final int star;
  final double value;
  const _RatingBar({required this.star, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text('$star', style: AppTextStyles.caption),
          const SizedBox(width: 4),
          const Icon(Icons.star, size: 12, color: AppColors.gold),
          const SizedBox(width: 6),
          SizedBox(
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: value,
                minHeight: 5,
                backgroundColor: Colors.white,
                valueColor: const AlwaysStoppedAnimation(AppColors.gold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  final String name;
  final String rating;
  final String date;
  final String comment;
  const _ReviewCard({
    required this.name,
    required this.rating,
    required this.date,
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
                radius: 18,
                backgroundColor: AppColors.blush,
                child: const Icon(
                  Icons.person,
                  size: 18,
                  color: AppColors.rose,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: AppTextStyles.subheading),
                    Text(date, style: AppTextStyles.caption),
                  ],
                ),
              ),
              const Icon(Icons.star, size: 14, color: AppColors.gold),
              const SizedBox(width: 4),
              Text(rating, style: AppTextStyles.label),
            ],
          ),
          const SizedBox(height: 10),
          Text(comment, style: AppTextStyles.body),
        ],
      ),
    );
  }
}
