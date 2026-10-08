import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widgets/custom_clipper.dart';
import 'reset_password_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool _isUsingEmail = true;
  static const Color primaryGreen = Color(0xFF1B5E4B);
  static const Color accentBlue = Color(0xFF29B6F6);
  static const Color headerBgColor = Color(0xFFE8F1EF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: HeaderDiagonalClipper(), // Gunakan class clipper dari kode sebelumnya
              child: Container(
                width: double.infinity,
                height: 260,
                color: headerBgColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'ECOWA',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            color: primaryGreen,
                            letterSpacing: 1.2,
                          ),
                        ),
                        SvgPicture.asset(
                          'lib/assets/icons/logo_lari.svg',
                          height: 36,
                          width: 36,
                          colorFilter: const ColorFilter.mode(
                            primaryGreen,
                            BlendMode.srcIn,
                          ),
                        ),
                        const Text(
                          'K',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            color: primaryGreen,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'LUPA KATA SANDI',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: primaryGreen,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.notifications_none,
                        size: 28,
                        color: Colors.black87,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Periksa dan masukan ${_isUsingEmail ? 'alamat Email' : 'Nomor Hp'} untuk mendapatkan kode verifikasi',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.black87,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  TextField(
                    decoration: InputDecoration(
                      hintText: _isUsingEmail ? 'Alamat Email' : 'Nomor Hp',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                      border: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: primaryGreen, width: 2),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isUsingEmail = !_isUsingEmail;
                      });
                    },
                    child: Text(
                      _isUsingEmail ? 'Gunakan Nomor Hp' : 'Gunakan Email',
                      style: const TextStyle(
                        color: accentBlue,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResetPasswordScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryGreen,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'KIRIM',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
