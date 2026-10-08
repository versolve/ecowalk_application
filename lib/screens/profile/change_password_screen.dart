import 'package:flutter/material.dart';

import '../auth/forgot_password_screen.dart';
import 'profile_widgets.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  static const Color primaryGreen = Color(0xFF1B5E4B);
  final _oldController = TextEditingController();
  final _newController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _obscureOld = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _oldController.dispose();
    _newController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _submit() {
    final oldPassword = _oldController.text.trim();
    final newPassword = _newController.text.trim();
    final confirmPassword = _confirmController.text.trim();

    if (oldPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Lengkapi seluruh kolom kata sandi.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (newPassword != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Konfirmasi kata sandi tidak sama.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Kata sandi berhasil diperbarui.'),
        backgroundColor: primaryGreen,
      ),
    );
  }

  InputDecoration _decoration(String hint, bool obscure, VoidCallback toggle) {
    return InputDecoration(
      hintText: hint,
      enabledBorder: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(),
      suffixIcon: IconButton(
        icon: Icon(obscure ? Icons.visibility_off : Icons.visibility),
        onPressed: toggle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ProfileAppBar(title: 'Ubah Kata Sandi'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(height: 36),
            TextField(
              controller: _oldController,
              obscureText: _obscureOld,
              decoration: _decoration('Kata sandi lama', _obscureOld, () {
                setState(() => _obscureOld = !_obscureOld);
              }),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ForgotPasswordScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Lupa Kata Sandi?',
                  style: TextStyle(color: primaryGreen, fontSize: 12),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _newController,
              obscureText: _obscureNew,
              decoration: _decoration('Kata sandi baru', _obscureNew, () {
                setState(() => _obscureNew = !_obscureNew);
              }),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _confirmController,
              obscureText: _obscureConfirm,
              decoration: _decoration(
                'Konfirmasi kata sandi',
                _obscureConfirm,
                () {
                  setState(() => _obscureConfirm = !_obscureConfirm);
                },
              ),
            ),
            const SizedBox(height: 36),
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  'UBAH',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
