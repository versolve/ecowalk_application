import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  static const primaryGreen = Color(0xFF176B5B);
  static const weatherBackground = Color(0xFFD9E8E6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: weatherBackground,
      appBar: AppBar(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        title: const Text(
          'Cuaca',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 28, 16, 28),
        children: [
          const Text(
            'Prakiraan Cuaca',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          const Text('Klapanunggal, Bogor', style: TextStyle(fontSize: 12)),
          const SizedBox(height: 8),
          SizedBox(
            height: 104,
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '30°C',
                        style: TextStyle(
                          fontSize: 48,
                          height: 1,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('Cerah Berawan', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                SizedBox(width: 150, child: _WeatherIllustration()),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _MetricCard(
                  key: const Key('weather-metric-card'),
                  icon: Icons.water_drop_outlined,
                  label: 'Kelembapan',
                  value: '92%',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _MetricCard(
                  key: const Key('weather-metric-card'),
                  icon: Icons.air,
                  label: 'Kualitas Udara',
                  value: '39.1',
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Hari ini',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 90,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              separatorBuilder: (_, index) => const SizedBox(width: 12),
              itemBuilder: (_, index) =>
                  _ForecastCard(time: index == 0 ? 'Sekarang' : '07:00'),
            ),
          ),
          const SizedBox(height: 32),
          _buildDailySummary(),
          const SizedBox(height: 32),
          const Text(
            'Aktivitas Harian',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const _ActivityRow(
            icon: Icons.sentiment_satisfied_alt_outlined,
            text: 'Berjalan-jalan adalah pilihan terbaik saat ini !',
            link: 'Lihat Destinasi Wisata',
          ),
          const _ActivityRow(
            icon: Icons.umbrella_outlined,
            text: 'Jangan lupa bawa payung untuk berjaga-jaga',
          ),
          const _ActivityRow(
            icon: Icons.home_work_outlined,
            text: 'Aktivitas outdoor direkomendasikan',
          ),
        ],
      ),
    );
  }

  Widget _buildDailySummary() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 3)),
        ],
      ),
      child: const Column(
        children: [
          _SummaryRow(day: 'Hari Ini'),
          SizedBox(height: 12),
          _SummaryRow(day: 'Besok'),
        ],
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 8),
      decoration: BoxDecoration(
        color: WeatherScreen.primaryGreen,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.white, size: 13),
              const SizedBox(width: 5),
              Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                height: 1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WeatherIllustration extends StatelessWidget {
  const _WeatherIllustration();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 4,
          right: 20,
          child: Container(
            width: 64,
            height: 64,
            decoration: const BoxDecoration(
              color: Color(0xFFFFDD00),
              shape: BoxShape.circle,
            ),
          ),
        ),
        const Icon(Icons.cloud, color: Color(0xFFB9DDF4), size: 98),
        const Icon(Icons.cloud_outlined, color: Color(0xFF087DB5), size: 98),
      ],
    );
  }
}

class _ForecastCard extends StatelessWidget {
  const _ForecastCard({required this.time});

  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 77,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.cloud_queue, color: Colors.lightBlue, size: 30),
          const Text('30°C', style: TextStyle(fontSize: 9)),
          Text(
            time,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.day});

  final String day;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 65,
          child: Text(day, style: const TextStyle(fontSize: 12)),
        ),
        const Icon(Icons.cloud_queue, color: Colors.lightBlue, size: 24),
        const SizedBox(width: 18),
        const Expanded(
          child: Text('Cerah Berawan', style: TextStyle(fontSize: 12)),
        ),
        const Text(
          '30°C / 20°C',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _ActivityRow extends StatelessWidget {
  const _ActivityRow({required this.icon, required this.text, this.link});

  final IconData icon;
  final String text;
  final String? link;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 25),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text, style: const TextStyle(fontSize: 11)),
                if (link != null)
                  Text(
                    link!,
                    style: const TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 8,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
