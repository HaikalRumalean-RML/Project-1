void main() {

  String karyawan = "Fadel";
  int jam_kerja = 7;
  double upah_per_jam = 25.000;
  bool status_karyawan = true;

  gajiKotor() {
    return jam_kerja * upah_per_jam;
  }

  pajak() {
    if (status_karyawan) {
      return gajiKotor() * 0.05;
    } else {
      return gajiKotor() * 0.10;
    }
  }

  gaji_bersih() {
    return gaji_kotor() - pajak();
  }

  print("Nama Karyawan : $karyawan");
  print("Jam Kerja : $jam_kerja");
  print("Upah Per Jam : $upah_per_jam");
  print("Status Karyawan : $status_karyawan");
  print("Gaji Kotor : ${gajiKotor()}");
  print("Pajak : ${pajak()}");
  print("Gaji Bersih : ${gaji_bersih()}");
}