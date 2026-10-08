import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../profile/profile_screen.dart';
import 'forgot_password_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;

  static const Color primaryGreen = Color(0xFF1B5E4B);
  static const Color accentBlue = Color(0xFF29B6F6);

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 75),

              // Header Logo & Judul
              const Text(
                'MASUK',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: primaryGreen,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: 6),
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

              const SizedBox(height: 48),

              // Form Nama Pengguna
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nama Pengguna',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person, color: Colors.grey, size: 20),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  fillColor: const Color(0xFFF7F8F9),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: primaryGreen, width: 1.5),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Form Kata Sandi
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Kata Sandi',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                obscureText: _isObscure,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock, color: Colors.grey, size: 20),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  fillColor: const Color(0xFFF7F8F9),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: primaryGreen, width: 1.5),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Tombol MASUK
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // Ambil teks dari controller
                    String username = _usernameController.text;
                    String password = _passwordController.text;

                    // Logika Hardcode: Cek apakah input sama dengan "admin" dan "admin123"
                    if (username == 'admin' && password == 'admin123') {
                      // Jika benar, navigasi ke ProfileScreen (menggantikan halaman saat ini)
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfileScreen(),
                        ),
                      );
                    } else {
                      // Jika salah, tampilkan pop-up pesan error (SnackBar)
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Login gagal! Gunakan username: admin dan password: admin123',
                          ),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'MASUK',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Lupa Kata Sandi
                           // Lupa Kata Sandi
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordScreen(),
                    ),
                  );
                },
                child: const Text(

                  'Lupa Kata Sandi?',
                  style: TextStyle(
                    color: accentBlue,
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Divider "Atau"
              Row(
                children: const [
                  Expanded(child: Divider(color: Color(0xFFE2E8F0), thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Atau',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  Expanded(child: Divider(color: Color(0xFFE2E8F0), thickness: 1)),
                ],
              ),

              const SizedBox(height: 32),

              // Tombol Google
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  onPressed: () {
                    // Logic Google Sign-In
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: const Color(0xFFF8F9FA),
                    side: const BorderSide(color: Color(0xFFE2E8F0)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 1,
                    shadowColor: Colors.black12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'lib/assets/icons/google.png',
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Lanjutkan dengan Google',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Footer Registrasi
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Tidak punya akun? ',
                    style: TextStyle(color: Colors.black87, fontSize: 13),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Daftar disini',
                      style: TextStyle(
                        color: accentBlue,
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
