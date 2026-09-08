import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    this.icon = Icons.inbox_outlined,
    this.title = 'Data Tidak Ditemukan',
    this.description = 'Belum ada data yang tersedia',
    this.iconColor = const Color(0xFF6C5CE7),
    this.action,
  });

  final IconData icon;
  final String title;
  final String description;
  final Color iconColor;
  final Widget? action;

  // 📦 Factory untuk kasus spesifik
  factory EmptyState.wallet() {
    return const EmptyState(
      icon: Icons.account_balance_wallet_outlined,
      title: 'Belum ada wallet',
      description: 'Klik tombol + untuk tambah wallet',
    );
  }

  factory EmptyState.transaction() {
    return const EmptyState(
      icon: Icons.receipt_long_outlined,
      title: 'Belum ada transaksi',
      description: 'Mulai transaksi sekarang',
    );
  }

  factory EmptyState.category() {
    return const EmptyState(
      icon: Icons.category_outlined,
      title: 'Belum ada kategori',
      description: 'Buat kategori baru',
    );
  }

  factory EmptyState.search(String query) {
    return EmptyState(
      icon: Icons.search_off_outlined,
      title: 'Tidak ditemukan',
      description: 'Hasil pencarian "$query" tidak ditemukan',
      iconColor: Colors.grey,
    );
  }

  factory EmptyState.noConnection() {
    return EmptyState(
      icon: Icons.signal_wifi_off_outlined,
      title: 'Tidak ada koneksi',
      description: 'Periksa koneksi internet Anda',
      iconColor: Colors.red,
      action: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
          onPressed: null, // ← Isi dengan fungsi refresh
          child: Text('Coba Lagi'),
        ),
      ),
    );
  }

  factory EmptyState.error(String message) {
    return EmptyState(
      icon: Icons.error_outline,
      title: 'Terjadi Kesalahan',
      description: message,
      iconColor: Colors.red,
      action: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
          onPressed: null, // ← Isi dengan fungsi retry
          child: Text('Ulangi'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 88,
              height: 88,
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 40, color: iconColor),
            ),
            const SizedBox(height: 20),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF1A1A2E),
              ),
            ),
            const SizedBox(height: 6),

            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13.5,
                color: Color(0xFF8B8B9E),
                height: 1.4,
              ),
            ),

            if (action != null) ...[const SizedBox(height: 20), action!],
          ],
        ),
      ),
    );
  }
}
