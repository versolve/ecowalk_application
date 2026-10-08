import 'package:flutter/material.dart';

import 'profile_widgets.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  static const Color primaryGreen = Color(0xFF1B5E4B);
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _showImageSourceSheet() {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (sheetContext) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 100,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _sourceButton(
                    sheetContext,
                    Icons.camera_alt_outlined,
                    'Kamera',
                  ),
                  const SizedBox(width: 44),
                  _sourceButton(sheetContext, Icons.image_outlined, 'Galeri'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sourceButton(BuildContext sheetContext, IconData icon, String label) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        Navigator.pop(sheetContext);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('$label belum tersedia.')));
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: const Color(0xFFF3F3F3),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(icon, size: 34, color: Colors.black),
            ),
            const SizedBox(height: 6),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ProfileAppBar(title: 'Edit Profil'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(height: 30),
            ProfileAvatar(
              radius: 58,
              showEditBadge: true,
              onTapBadge: _showImageSourceSheet,
            ),
            const SizedBox(height: 44),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Nama Pengguna',
                hintStyle: TextStyle(fontStyle: FontStyle.italic),
                prefixIcon: Icon(Icons.person, color: Colors.grey),
                enabledBorder: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 90),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Profil berhasil diperbarui.'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  'SIMPAN',
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
