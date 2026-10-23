import 'package:flutter/material.dart';

import '../auth/login_screen.dart';
import 'change_email_screen.dart';
import 'change_password_screen.dart';
import 'change_phone_screen.dart';
import 'profile_widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _passwordController = TextEditingController();
  bool _obscureDeletePassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _showDeleteAccountDialog() {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (dialogStateContext, setDialogState) => AlertDialog(
          backgroundColor: Colors.white,
          insetPadding: const EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          titlePadding: const EdgeInsets.fromLTRB(20, 24, 20, 14),
          title: const Text(
            'HAPUS AKUN',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF2B2B2B),
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _passwordController,
                obscureText: _obscureDeletePassword,
                decoration: InputDecoration(
                  labelText: 'Kata Sandi',
                  hintText: 'Masukan Kata Sandi',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                    fontStyle: FontStyle.italic,
                  ),
                  labelStyle: const TextStyle(
                    color: Colors.black87,
                    fontSize: 11,
                  ),
                  floatingLabelStyle: const TextStyle(
                    color: Colors.black87,
                    fontSize: 10,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureDeletePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: const Color(0xFF374151),
                    ),
                    onPressed: () {
                      setDialogState(() {
                        _obscureDeletePassword = !_obscureDeletePassword;
                      });
                    },
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(14, 12, 8, 8),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Colors.red, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Colors.red, width: 1.5),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                color: const Color(0xFFFFE3E3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 17,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'Anda akan menghapus akun anda. Tindakan ini tidak dapat dibatalkan. Semua data akan hilang.',
                        style: TextStyle(
                          color: Color(0xFF4B5563),
                          fontSize: 9,
                          height: 1.3,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.close,
                        color: Color(0xFF4B5563),
                        size: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          actionsPadding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
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
                    backgroundColor: const Color(0xFFE5252A),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(88, 38),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Hapus',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 32),
                TextButton(
                  onPressed: () {
                    _passwordController.clear();
                    Navigator.pop(dialogContext);
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF2B2B2B),
                    minimumSize: const Size(40, 38),
                    padding: EdgeInsets.zero,
                  ),
                  child: const Text(
                    'Batal',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
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
