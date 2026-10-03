import 'package:flutter/material.dart';
import '../../widgets/custom_clipper.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool _isObscure1 = true;
  bool _isObscure2 = true;
  static const Color primaryGreen = Color(0xFF1B5E4B);
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
                      children: const [
                        Text('ECOWA', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: primaryGreen, letterSpacing: 1.2)),
                        Icon(Icons.directions_run_rounded, color: primaryGreen, size: 36),
                        Text('K', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: primaryGreen, letterSpacing: 1.2)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text('LUPA KATA SANDI', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryGreen)),
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
                  const Text('Masukan Kata Sandi Baru', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87)),
                  
                  const SizedBox(height: 32),
                  
                  TextField(
                    obscureText: _isObscure1,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock, color: Colors.grey, size: 20),
                      suffixIcon: IconButton(
                        icon: Icon(_isObscure1 ? Icons.visibility_off : Icons.visibility, color: Colors.grey, size: 20),
                        onPressed: () => setState(() => _isObscure1 = !_isObscure1),
                      ),
                      hintText: 'Kata Sandi Baru',
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13, fontStyle: FontStyle.italic),
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  TextField(
                    obscureText: _isObscure2,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock, color: Colors.grey, size: 20),
                      suffixIcon: IconButton(
                        icon: Icon(_isObscure2 ? Icons.visibility_off : Icons.visibility, color: Colors.grey, size: 20),
                        onPressed: () => setState(() => _isObscure2 = !_isObscure2),
                      ),
                      hintText: 'Konfirmasi Kata Sandi',
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13, fontStyle: FontStyle.italic),
                    ),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryGreen,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('UBAH KATA SANDI', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
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