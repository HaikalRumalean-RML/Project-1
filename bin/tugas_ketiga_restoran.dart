import 'dart:io';

void main() {

  Map<String, int> makanan = {
    '1' : 20000, // Nasi Goreng
    '2' : 15000, // Mie Goreng
    '3' : 25000, // Ayam Bakar
  };

  Map<String, int> minuman = {
    '1' : 8000, // Es Teh
    '2' : 8000, // Es Jeruk
    '3' : 5000, // Air Mineral
  };

  print("=== Menu Makanan ===");
  print("1. Nasi Goreng - Rp 20.000");
  print("2. Mie Goreng - Rp 20.000");
  print("3. Ayam Bakar - Rp 25.000");
  stdout.write("Pilih makanan (1-3): ");
  var pilihanMakanan = stdin.readLineSync()?.split(',') ?? [];

  print("\n=== Menu Minuman ===");
  print("1. Es Teh - Rp 8.000");
  print("2. Es Jeruk - Rp 8.000");
  print("3. Air Mineral - Rp 5.000");
  stdout.write("Pilih minuman (1-3): ");
  var pilihanMinuman = stdin.readLineSync()?.split(',') ?? [];

  int total = 0;
  print("\n=== Struk Pesanan ===");

  for (var pilihan in pilihanMakanan) {
    pilihan = pilihan.trim();
    if (makanan.containsKey(pilihan)) {
      total += makanan[pilihan]!;
      print("Makanan: ${pilihan} - Rp ${makanan[pilihan]}");
    }
  }

  for (var pilihan in pilihanMinuman) {
    pilihan = pilihan.trim();
    if (minuman.containsKey(pilihan)) {
      total += minuman[pilihan]!;
      print("Minuman: ${pilihan} - Rp ${minuman[pilihan]}");
    }
  }

  print("=====================");
  print("Total Bayar: Rp $total");
  print("=====================");
  print("Terima Kasih Sudah Memesan!");

}