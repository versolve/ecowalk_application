import 'package:flutter/material.dart';
import '../../widgets/custom_clipper.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool _isUsingEmail = false; // Toggle metode verifikasi
  static const Color primaryGreen = Color(0xFF1B5E4B);
  static const Color accentBlue = Color(0xFF29B6F6);
  static const Color headerBgColor = Color(0xFFE8F1EF);

  Widget _buildOtpBox(BuildContext context) {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8F9),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          counterText: "",
          border: InputBorder.none,
        ),
        onChanged: (value) {
          if (value.length == 1) FocusScope.of(context).nextFocus();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Melengkung
            ClipPath(
              clipper: HeaderDiagonalClipper(),
              child: Container(
                width: double.infinity,
                height: 260,
                color: headerBgColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('ECOWA', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: primaryGreen, letterSpacing: 1.2)),
                        Icon(Icons.directions_run_rounded, color: primaryGreen, size: 36),
                        Text('K', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: primaryGreen, letterSpacing: 1.2)),
                      ],
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
                  // Judul
                  Row(
                    children: const [
                      Icon(Icons.check, color: Colors.black87, size: 20),
                      SizedBox(width: 8),
                      Text('VERIFIKASI', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Deskripsi & Ikon
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(_isUsingEmail ? Icons.mark_email_unread_outlined : Icons.phone_android, size: 32, color: Colors.black87),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Periksa dan ketik kode verifikasi yang telah dikirimkan ke ${_isUsingEmail ? 'contohsample@gmail.com' : '+6212371923719238'}',
                          style: const TextStyle(fontSize: 13, color: Colors.black87, height: 1.4),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Input OTP
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index) => _buildOtpBox(context)),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Toggle Email / No HP
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isUsingEmail = !_isUsingEmail;
                      });
                    },
                    child: Text(
                      _isUsingEmail ? 'Verifikasi menggunakan No. Hp' : 'Verifikasi menggunakan Email',
                      style: const TextStyle(color: accentBlue, fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Tombol Kirim
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryGreen,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('KIRIM', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                  ),
                  
                  const SizedBox(height: 20),
                  
                  // Tombol Kirim Ulang
                  Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Kirim Ulang Kode',
                        style: TextStyle(color: primaryGreen, fontSize: 13, fontWeight: FontWeight.w600),
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