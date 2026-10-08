import 'package:flutter/material.dart';
import 'auth/splash_screen.dart';
import 'auth/login_screen.dart';
import 'auth/register_screen.dart';
import 'auth/verification_screen.dart';
import 'auth/forgot_password_screen.dart';
import 'auth/reset_password_screen.dart';
import 'profile/profile_screen.dart';

class DevMenuScreen extends StatelessWidget {
  const DevMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Pengujian Halaman'),
        backgroundColor: const Color(0xFF1B5E4B),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          _buildMenuItem(context, 'Splash Screen', const SplashScreen()),
          _buildMenuItem(context, 'Login Screen', const LoginScreen()),
          _buildMenuItem(context, 'Register Screen', const RegisterScreen()),
          _buildMenuItem(context, 'Verification OTP Screen', const VerificationScreen()),
          _buildMenuItem(context, 'Forgot Password Screen', const ForgotPasswordScreen()),
          _buildMenuItem(context, 'Reset Password Screen', const ResetPasswordScreen()),
          _buildMenuItem(context, 'Profile Screen', const ProfileScreen()),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, Widget targetScreen) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetScreen),
        );
      },
    );
  }
}