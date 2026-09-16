# Pretty Salon - Salon Booking App

Aplikasi booking salon berbasis Flutter yang dibuat untuk memenuhi tugas kelompok mata kuliah [Nama Mata Kuliah].

## Kelompok 5

| No | Nama | NIM |
|----|------|-----|
| 1  | Naufal Daffa Wimasurya | 24051214216 |
| 2  | Reza Mortasefi | 24051214220 |
| 3  | Arvy Revaldy | 24051214227 |
| 4  | Delvia Aurelia Erwant | 24051214246 |

## Fitur Aplikasi

1. **Splash Screen** - Halaman pembuka
2. **Login & Register** - Autentikasi pengguna
3. **Beranda** - Daftar salon & promo
4. **Layanan & Harga** - Daftar layanan dengan harga
5. **Detail Salon** - Info lengkap salon (Services, Photo, Package, Review, About)
6. **Form Booking** - Formulir pemesanan
7. **Konfirmasi Booking** - Ringkasan pesanan
8. **Kontak & Lokasi** - Info kontak & peta
9. **Tentang Kami** - Profil perusahaan
10. **Tim / Stylist** - Daftar stylist
11. **Galeri** - Galeri foto
12. **Promo & Paket** - Penawaran spesial
13. **Testimoni / Review** - Ulasan pelanggan
14. **Profil** - Profil pengguna

## Teknologi

- **Framework:** Flutter
- **Bahasa:** Dart
- **Font:** Google Fonts (Inter, Playfair Display)
- **Editor:** Visual Studio Code

## Struktur Folder

```text
lib/
├── main.dart                    # Entry point aplikasi
├── core/
│   ├── constants/
│   │   ├── app_colors.dart      # Palet warna
│   │   └── app_text_styles.dart # Style teks
│   └── routes/
│       └── app_routes.dart      # Konfigurasi navigasi
├── widgets/                     # Komponen reusable
│   ├── app_drawer.dart
│   ├── bottom_nav.dart
│   ├── custom_button.dart
│   ├── responsive_content.dart
│   ├── section_header.dart
│   └── tab_pill.dart
└── screens/                     # Halaman aplikasi
    ├── splash_screen.dart
    ├── login_screen.dart
    ├── register_screen.dart
    ├── home_screen.dart
    ├── services_screen.dart
    ├── salon_detail_screen.dart
    ├── booking_form_screen.dart
    ├── booking_confirmation_screen.dart
    ├── contact_screen.dart
    ├── about_screen.dart
    ├── team_screen.dart
    ├── gallery_screen.dart
    ├── promo_screen.dart
    ├── review_screen.dart
    └── profile_screen.dart
