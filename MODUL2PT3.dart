// Kelas ProdukDigital
class ProdukDigital {
  String nama;
  double harga;
  String kategori;

  ProdukDigital(this.nama, this.harga, this.kategori) {
    if (kategori == 'NetworkAutomation' && harga < 200000) {
      throw Exception(
        'Harga untuk produk NetworkAutomation harus minimal 200.000',
      );
    }
    if (kategori == 'DataManagement' && harga >= 200000) {
      throw Exception(
        'Harga untuk produk DataManagement harus di bawah 200.000',
      );
    }
  }

  double terapkanDiskon(int jumlahTerjual) {
    if (kategori == 'NetworkAutomation' && jumlahTerjual > 50) {
      double diskon = harga * 0.15;
      double hargaAkhir = harga - diskon;
      return hargaAkhir < 200000 ? 200000 : hargaAkhir;
    }
    return harga;
  }
}

// Kelas Karyawan
class Karyawan {
  String nama;
  int umur;
  String peran;

  Karyawan(this.nama, this.umur, this.peran);

  void bekerja() {
    print('$nama bekerja sebagai $peran.');
  }
}

// Kelas Proyek
class Proyek {
  String nama;
  List<Karyawan> tim;
  String fase;

  Proyek(this.nama, this.tim, {this.fase = 'Perencanaan'});

  void nextFase() {
    if (fase == 'Perencanaan') {
      fase = 'Pengembangan';
      print('Fase proyek $nama beralih ke Pengembangan.');
    } else if (fase == 'Pengembangan') {
      fase = 'Evaluasi';
      print('Fase proyek $nama beralih ke Evaluasi.');
    } else {
      print('Proyek $nama sudah berada di fase Evaluasi.');
    }
  }
}

// Kelas Perusahaan
class Perusahaan {
  List<Karyawan> karyawanAktif = [];
  List<ProdukDigital> produk = [];
  List<Proyek> proyek = [];

  void tambahKaryawan(Karyawan karyawan) {
    karyawanAktif.add(karyawan);
    print('Karyawan ${karyawan.nama} ditambahkan.');
  }

  void tambahProduk(ProdukDigital produkDigital) {
    produk.add(produkDigital);
    print('Produk ${produkDigital.nama} ditambahkan.');
  }

  void tambahProyek(Proyek proyekBaru) {
    proyek.add(proyekBaru);
    print('Proyek ${proyekBaru.nama} ditambahkan.');
  }

  void tampilkanKaryawan() {
    print('Daftar Karyawan:');
    for (var karyawan in karyawanAktif) {
      print('- ${karyawan.nama}, Peran: ${karyawan.peran}');
    }
  }

  void tampilkanProduk() {
    print('Daftar Produk Digital:');
    for (var p in produk) {
      print('- ${p.nama}, Harga: ${p.harga}, Kategori: ${p.kategori}');
    }
  }

  void tampilkanProyek() {
    print('Daftar Proyek:');
    for (var p in proyek) {
      print('- ${p.nama}, Fase: ${p.fase}');
    }
  }
}

// Contoh penggunaan
void main() {
  Perusahaan perusahaan = Perusahaan();

  // Menambahkan karyawan
  Karyawan karyawan1 = Karyawan('Luffy', 27, 'Developer');
  Karyawan karyawan2 = Karyawan('Zoro', 28, 'Designer');
  perusahaan.tambahKaryawan(karyawan1);
  perusahaan.tambahKaryawan(karyawan2);

  // Menambahkan produk digital
  ProdukDigital produk1 = ProdukDigital(
    'Automasi Jaringan',
    250000,
    'NetworkAutomation',
  );

  perusahaan.tambahProduk(produk1);

  // Menambahkan proyek
  Proyek proyek1 = Proyek('Proyek pddy', [karyawan1, karyawan2]);
  perusahaan.tambahProyek(proyek1);

  // Menampilkan data
  perusahaan.tampilkanKaryawan();
  perusahaan.tampilkanProduk();
  perusahaan.tampilkanProyek();

  // Menghitung harga produk digital
  ProdukDigital produk = ProdukDigital('Router', 250000, 'NetworkAutomation');
  double hargaAkhir = (120);
  print('Harga akhir produk ${produk.nama} setelah diskon: $hargaAkhir');
}
