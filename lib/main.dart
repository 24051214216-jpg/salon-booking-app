import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/routes/app_routes.dart';
import 'core/constants/app_colors.dart';
import 'core/constants/app_text_styles.dart';

void main() {
  runApp(const SalonBookingApp());
}

class SalonBookingApp extends StatelessWidget {
  const SalonBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lumière Salon',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.ivory,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.rose,
          surface: AppColors.surface,
        ),
        textTheme: GoogleFonts.interTextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.ivory,
          foregroundColor: AppColors.plum,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: AppTextStyles.heading,
          iconTheme: const IconThemeData(color: AppColors.plum),
        ),
        dividerColor: AppColors.hairline,
      ),
      builder: (context, child) {
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 430),
            child: child!,
          ),
        );
      },
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}
