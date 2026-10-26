import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  static const primaryGreen = Color(0xFF176B5B);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool _allRead = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: NotificationScreen.primaryGreen,
        foregroundColor: Colors.white,
        title: const Text('Notifikasi'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              onTap: () => setState(() => _allRead = true),
              child: Row(
                children: [
                  Checkbox(value: _allRead, onChanged: (_) {}),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Tandai Semua Dibaca',
                      style: TextStyle(
                        color: NotificationScreen.primaryGreen,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ...List.generate(3, (_) => _buildNotificationItem()),
        ],
      ),
    );
  }

  Widget _buildNotificationItem() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _allRead ? Colors.grey.shade50 : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Perjalanan Selesai',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            'Yudhistira, Perjalanan wisata anda telah selesai.',
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(height: 8),
          Text(
            '12 Febuari 2025',
            style: TextStyle(fontSize: 9, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
