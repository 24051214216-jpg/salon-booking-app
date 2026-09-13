import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../widgets/app_drawer.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final team = [
      _Member('Katheryn Murphy', 'Hair Stylist', '4.8'),
      _Member('Esther Howard', 'Nail Artist', '4.8'),
      _Member('Dale Thiel', 'Make Up Artist', '5.0'),
      _Member('Jenny Wilson', 'Skin Therapist', '4.7'),
      _Member('Cameron W.', 'Barber', '4.9'),
      _Member('Marvin McKinney', 'Spa Therapist', '4.6'),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Tim / Stylist')),
      drawer: const AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Stylist (${team.length})', style: AppTextStyles.heading),
          const SizedBox(height: 4),
          Text('Pilih stylist favoritmu', style: AppTextStyles.body),
          const SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: 0.85,
            children: team.map((m) => _TeamCard(member: m)).toList(),
          ),
        ],
      ),
    );
  }
}

class _Member {
  final String name;
  final String role;
  final String rating;
  _Member(this.name, this.role, this.rating);
}

class _TeamCard extends StatelessWidget {
  final _Member member;
  const _TeamCard({required this.member});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.hairline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.blush,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.person, size: 48, color: AppColors.rose),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            member.name,
            style: AppTextStyles.subheading,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(member.role, style: AppTextStyles.caption),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.star, color: AppColors.gold, size: 13),
              const SizedBox(width: 4),
              Text(member.rating, style: AppTextStyles.caption),
            ],
          ),
        ],
      ),
    );
  }
}
