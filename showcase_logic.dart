// SHOWCASE: High-Performance Real-Time Engine
// Explaining: Dynamic countdown calculation and surgical UI updates.

void updateCountdown() {
  final now = DateTime.now();
  // Bulunan bir sonraki vakit ile şu an arasındaki farkı cerrahi hassasiyetle hesapla
  final remaining = nextPrayerTime.difference(now);

  // TÜM SAYFAYI DEĞİL, SADECE BU DEĞİŞKENİ GÜNCELLE (CPU Tasarrufu)
  _kalanSureNotifier.value = _formatDuration(remaining);
}

// UI Katmanı: Sadece değişen rakamı dinleyen akıllı widget
ValueListenableBuilder<String>(
  valueListenable: _kalanSureNotifier,
  builder: (context, value, child) => Text(value, style: logicStyle),
);
