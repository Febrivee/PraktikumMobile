
class ProdukDigital {
  String nama;
  double harga;
  String kategori;

  ProdukDigital(this.nama, this.harga, this.kategori);

  double hitungHargaAkhir(int jumlahTerjual) {
    double diskon = 0;
    if (kategori == 'NetworkAutomation' && jumlahTerjual > 50) {
      diskon = harga * 0.15; 
    }
    return harga - diskon;
  }
}
class Karyawan {
  String nama;
  int umur;
  String posisi;

  Karyawan(this.nama, this.umur, this.posisi);

  void tampilkanInfo() {
    print('Nama: $nama, Umur: $umur, Posisi: $posisi');
  }
}
class Manajer extends Karyawan {
  Manajer(String nama, int umur) : super(nama, umur, 'Manajer');

  void ambilKeputusan() {
    print('$nama mengambil keputusan penting.');
  }
}
class KaryawanTetap extends Karyawan {
  KaryawanTetap(String nama, int umur) : super(nama, umur, 'Karyawan Tetap');
}
class KaryawanKontrak extends Karyawan {
  KaryawanKontrak(String nama, int umur) : super(nama, umur, 'Karyawan Kontrak');
}
class Perusahaan {
  String nama;
  List<Karyawan> karyawanList = [];

  Perusahaan(this.nama);

  void tambahKaryawan(Karyawan karyawan) {
    karyawanList.add(karyawan);
    print('Karyawan ${karyawan.nama} ditambahkan ke perusahaan $nama.');
  }

  void tampilkanKaryawan() {
    print('Daftar Karyawan di $nama:');
    for (var karyawan in karyawanList) {
      karyawan.tampilkanInfo();
    }
  }
}
void main() {
  Perusahaan perusahaan = Perusahaan('Tech Solutions');

  perusahaan.tambahKaryawan(KaryawanTetap('Lufyy', 27));
  perusahaan.tambahKaryawan(KaryawanKontrak('Zoro', 25));
  perusahaan.tambahKaryawan(Manajer('Yami', 25));

  perusahaan.tampilkanKaryawan();

  ProdukDigital produk = ProdukDigital('Router', 250000, 'NetworkAutomation');
  double hargaAkhir = produk.hitungHargaAkhir(60);
  print('Harga akhir produk ${produk.nama} setelah diskon: $hargaAkhir');
}