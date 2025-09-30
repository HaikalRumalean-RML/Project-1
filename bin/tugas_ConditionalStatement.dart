import 'dart:io';

void main () {
  stdout.write("Masukkan nilai (0-100): ");
  String? input = stdin.readLineSync();

  if (input == null || input.isEmpty) {
    print("Input tidak valid.");
    return;
  }

  int? nilai = int.tryParse(input);

  if (nilai == null || nilai < 0 || nilai > 100) {
    print("Nilai harus berupa angka antara 0 sampai 100.");
    return;
  }

  if (nilai >= 85) {

    print("A");

  } else if (nilai >= 70) {

    print("B");

  } else if (nilai >= 60) {

    print("C");

  } else if (nilai >= 50) {

    print("D");

  } else {

    print("E");

  }

}