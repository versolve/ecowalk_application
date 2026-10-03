import 'package:flutter/material.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;
  bool _isAgreed = false;

  static const Color primaryGreen = Color(0xFF1B5E4B);
  static const Color accentBlue = Color(0xFF29B6F6);

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // Helper Widget untuk TextField dengan placeholder miring (italic)
  Widget _buildCustomTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    bool isPassword = false,
    bool isObscure = false,
    VoidCallback? onToggleVisibility,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword ? isObscure : false,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.grey,
          fontSize: 13,
        ),
        prefixIcon: Icon(prefixIcon, color: Colors.grey, size: 20),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  isObscure ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                  size: 20,
                ),
                onPressed: onToggleVisibility,
              )
            : null,
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
    );
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
              const SizedBox(height: 20),

              // Header Logo & Judul "BUAT AKUN ECOWALK"
              const Text(
                'BUAT AKUN',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: primaryGreen,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'ECOWA',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: primaryGreen,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Icon(
                    Icons.directions_run_rounded,
                    color: primaryGreen,
                    size: 34,
                  ),
                  Text(
                    'K',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: primaryGreen,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 36),

              // Form Nama Pengguna
              _buildCustomTextField(
                controller: _usernameController,
                hintText: 'Nama Pengguna',
                prefixIcon: Icons.person,
              ),

              const SizedBox(height: 16),

              // Form Email
              _buildCustomTextField(
                controller: _emailController,
                hintText: 'Email',
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 16),

              // Form Nomor Hp
              _buildCustomTextField(
                controller: _phoneController,
                hintText: 'Nomor Hp',
                prefixIcon: Icons.phone,
                keyboardType: TextInputType.phone,
              ),

              const SizedBox(height: 16),

              // Form Kata Sandi
              _buildCustomTextField(
                controller: _passwordController,
                hintText: 'Kata Sandi',
                prefixIcon: Icons.lock,
                isPassword: true,
                isObscure: _isObscurePassword,
                onToggleVisibility: () {
                  setState(() {
                    _isObscurePassword = !_isObscurePassword;
                  });
                },
              ),

              const SizedBox(height: 16),

              // Form Konfirmasi Kata Sandi
              _buildCustomTextField(
                controller: _confirmPasswordController,
                hintText: 'Konfirmasi Kata Sandi',
                prefixIcon: Icons.lock,
                isPassword: true,
                isObscure: _isObscureConfirmPassword,
                onToggleVisibility: () {
                  setState(() {
                    _isObscureConfirmPassword = !_isObscureConfirmPassword;
                  });
                },
              ),

              const SizedBox(height: 20),

              // Checkbox Persyaratan dan Privasi
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: _isAgreed,
                      activeColor: primaryGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      onChanged: (bool? value) {
                        setState(() {
                          _isAgreed = value ?? false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'Saya telah membaca dan menyetujui ',
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                        children: [
                          TextSpan(
                            text: 'persyaratan dan privasi pengguna',
                            style: const TextStyle(
                              color: accentBlue,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // Tombol BUAT AKUN
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    // Logic pendaftaran
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'BUAT AKUN',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // Footer Pindah ke Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sudah punya akun? ',
                    style: TextStyle(color: Colors.black87, fontSize: 13),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Masuk',
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