import 'package:flutter/material.dart';

import '../../screens/splash_screen.dart';
import '../../screens/login_screen.dart';
import '../../screens/register_screen.dart';
import '../../screens/home_screen.dart';
import '../../screens/services_screen.dart';
import '../../screens/salon_detail_screen.dart';
import '../../screens/booking_form_screen.dart';
import '../../screens/booking_confirmation_screen.dart';
import '../../screens/contact_screen.dart';
import '../../screens/about_screen.dart';
import '../../screens/team_screen.dart';
import '../../screens/gallery_screen.dart';
import '../../screens/promo_screen.dart';
import '../../screens/review_screen.dart';
import '../../screens/profile_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String services = '/services';
  static const String salonDetail = '/salon-detail';
  static const String bookingForm = '/booking-form';
  static const String bookingConfirmation = '/booking-confirmation';
  static const String contact = '/contact';
  static const String about = '/about';
  static const String team = '/team';
  static const String gallery = '/gallery';
  static const String promo = '/promo';
  static const String review = '/review';
  static const String profile = '/profile';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    login: (context) => const LoginScreen(),
    register: (context) => const RegisterScreen(),
    home: (context) => const HomeScreen(),
    services: (context) => const ServicesScreen(),
    salonDetail: (context) => const SalonDetailScreen(),
    bookingForm: (context) => const BookingFormScreen(),
    bookingConfirmation: (context) => const BookingConfirmationScreen(),
    contact: (context) => const ContactScreen(),
    about: (context) => const AboutScreen(),
    team: (context) => const TeamScreen(),
    gallery: (context) => const GalleryScreen(),
    promo: (context) => const PromoScreen(),
    review: (context) => const ReviewScreen(),
    profile: (context) => const ProfileScreen(),
  };
}
