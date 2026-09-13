import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_styles.dart';
import '../core/routes/app_routes.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;

  const AppBottomNav({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final items = [
      _NavItem(Icons.home_filled, 'Home', AppRoutes.home),
      _NavItem(Icons.search, 'Explore', AppRoutes.services),
      _NavItem(Icons.calendar_today, 'Bookings', AppRoutes.bookingForm),
      _NavItem(Icons.chat_bubble_outline, 'Chat', AppRoutes.contact),
      _NavItem(Icons.person_outline, 'Profile', AppRoutes.profile),
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.hairline)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 62,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(items.length, (i) {
              final active = i == currentIndex;
              final item = items[i];
              return InkWell(
                onTap: () {
                  if (!active)
                    Navigator.pushReplacementNamed(context, item.route);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      item.icon,
                      size: 22,
                      color: active ? AppColors.rose : AppColors.grey,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      item.label,
                      style: AppTextStyles.caption.copyWith(
                        color: active ? AppColors.rose : AppColors.grey,
                        fontWeight: active ? FontWeight.w600 : FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  final String route;
  _NavItem(this.icon, this.label, this.route);
}
