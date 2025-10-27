import 'dart:math';

abstract class Transportasi {
  String id;
  String nama;
  double _tarifDasar;
  int kapasitas;

  Transportasi(this.id, this.nama, this._tarifDasar, this.kapasitas);

  double get tarifDasar => _tarifDasar;

  double hitungTarif(int jumlahPenumpang);

  void tampilInfo() {
    print(
      'ID: $id, Nama: $nama, Tarif dasar ${_tarifDasar.toStringAsFixed(0)}, Kapasitas: $kapasitas',
    );
  }
}

class Taksi extends Transportasi {
  double jarak;

  Taksi(String id, String nama, double tarifDasar, int kapasitas, this.jarak)
    : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    return tarifDasar * jarak;
  }

  @override
  void tampilInfo() {
    super.tampilInfo();
    print('Tipe: Taksi, jarak: ${jarak} km');
  }
}

class Bus extends Transportasi {
  bool adaWifi;

  Bus(String id, String nama, double tarifDasar, int kapasitas, this.adaWifi)
    : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    double tambahWifi = adaWifi ? 5000.0 : 0.0;
    return (tarifDasar * jumlahPenumpang) + tambahWifi;
  }

  @override
  void tampilInfo() {
    super.tampilInfo();
    print('Tipe: bus, ada Wifi: ${adaWifi ? "ya" : "tidak"}');
  }
}

class Pesawat extends Transportasi {
  String kelas;

  Pesawat(String id, String nama, double tarifDasar, int kapasitas, this.kelas)
    : super(id, nama, tarifDasar, kapasitas);

  @override
  double hitungTarif(int jumlahPenumpang) {
    double multipiler = (kelas.toLowerCase() == 'bisnis') ? 1.5 : 1.0;
    return tarifDasar * jumlahPenumpang * multipiler;
  }

  @override
  void tampilInfo() {
    super.tampilInfo();
    print('Tipe: pesawat, kelas: $kelas');
  }
}

class Pemesanan {
  String idPemesanan;
  String namaPelanggan;
  Transportasi transportasi;
  int jumlahPenumpang;
  double totalTarif;

  Pemesanan({
    required this.idPemesanan,
    required this.namaPelanggan,
    required this.transportasi,
    required this.jumlahPenumpang,
    required this.totalTarif,
  });

  Map<String, dynamic> toMap() {
    return {
      'idPemesanan': idPemesanan,
      'namaPelanggan': namaPelanggan,
      'trasPortasi': {'id': transportasi.id, 'nama': transportasi.nama},
      'jumlahPenumpang': jumlahPenumpang,
      'totalTarif': totalTarif,
    };
  }
}

Pemesanan buatPemesanan(Transportasi t, String nama, int jumlahPenumpang) {
  double total = t.hitungTarif(jumlahPenumpang);

  String idp =
      '${DateTime.now().millisecondsSinceEpoch}-${Random().nextInt(999)}';

  return Pemesanan(
    idPemesanan: idp,
    namaPelanggan: nama,
    transportasi: t,
    jumlahPenumpang: jumlahPenumpang,
    totalTarif: total,
  );
}

void tampilSemuaPesanan(List<Pemesanan> daftar) {
  print('===== DAFTAR PEMESANAN ===== (${daftar.length}) ==');
  for (var p in daftar) {
    print(
      'Nama: ${p.namaPelanggan}, Trasnportasi: ${p.transportasi.nama},'
      'penumpang: ${p.jumlahPenumpang}, Total: ${p.totalTarif.toStringAsFixed(2)}',
    );
  }
}

void main() {
  var taksi = Taksi('T001', 'Taksi Maliaro', 3000.0, 4, 20.4);
  var bus = Bus('B001', 'Bus tras seram', 15000.0, 45, true);
  var pesawat = Pesawat('T001', 'Garuda indonesias', 500000.0, 170, 'bisnis');

  taksi.tampilInfo();
  print('');
  bus.tampilInfo();
  print('');
  pesawat.tampilInfo();

  List<Pemesanan> daftarPemesanan = [];

  var p1 = buatPemesanan(taksi, 'erik', 1);
  var p2 = buatPemesanan(bus, 'arif', 4);
  var p3 = buatPemesanan(pesawat, 'Haikal', 2);

  daftarPemesanan.addAll([p1, p2, p3]);

  print('');
  tampilSemuaPesanan(daftarPemesanan);

  print('n\Data dalam bentuk Map:');
  for (var p in daftarPemesanan) {
    print(p.toMap());
  }
}