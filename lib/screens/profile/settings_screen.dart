import 'package:flutter/material.dart';

import 'change_phone_screen.dart';
import 'change_email_screen.dart';
import 'change_password_screen.dart';
import '../auth/login_screen.dart';
import 'profile_widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  static const Color primaryGreen = Color(0xFF1B5E4B);
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _showDeleteAccountDialog() {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'HAPUS AKUN',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'PERHATIAN! Tindakan ini akan menghapus seluruh data akun Anda secara permanen dan tidak dapat dikembalikan.',
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFFDECEA),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'PERINGATAN: Aksi ini berbahaya dan dapat menghapus seluruh data akun Anda secara permanen. Lanjutkan dengan hati-hati.',
                style: TextStyle(color: Colors.red, fontSize: 11),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Masukkan kata sandi Anda',
                style: TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(height: 6),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Kata Sandi',
                hintStyle: TextStyle(fontSize: 12),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
          ],
        ),
        actionsPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        actions: [
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    _passwordController.clear();
                    Navigator.pop(dialogContext);
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: primaryGreen),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Batal',
                    style: TextStyle(color: primaryGreen),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    final password = _passwordController.text.trim();
                    if (password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Masukkan kata sandi.'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }
                    _passwordController.clear();
                    Navigator.pop(dialogContext);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Hapus',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ProfileAppBar(title: 'Pengaturan'),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _buildSettingItem(
            icon: Icons.phone_outlined,
            title: 'Ubah Nomor Hp',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChangePhoneScreen()),
              );
            },
          ),
          _buildSettingItem(
            icon: Icons.email_outlined,
            title: 'Ubah Email',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChangeEmailScreen()),
              );
            },
          ),
          _buildSettingItem(
            icon: Icons.lock_outline,
            title: 'Ubah Kata Sandi',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ChangePasswordScreen()),
              );
            },
          ),
          _buildSettingItem(
            icon: Icons.delete_outline,
            title: 'Hapus Akun',
            isDanger: true,
            onTap: _showDeleteAccountDialog,
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDanger = false,
  }) {
    final color = isDanger ? Colors.red : Colors.black87;
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          leading: Icon(icon, color: color, size: 22),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios, size: 14, color: color),
          onTap: onTap,
        ),
        Divider(
          height: 1,
          color: Colors.grey.shade300,
          indent: 12,
          endIndent: 12,
        ),
      ],
    );
  }
}
