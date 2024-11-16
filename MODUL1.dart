import 'dart:async';

// Enum untuk Role
enum Role { Admin, Customer }

// Kelas Product
class Product {
  String productName;
  double price;
  bool inStock;

  Product(this.productName, this.price, this.inStock);
}

// Kelas User
class User {
  String name;
  int age;
  late List<Product> products; // Menggunakan late initialization
  Role? role; // Nullable type

  User(this.name, this.age) {
    products = [];
  }
}

// Subclass AdminUser 
class AdminUser  extends User {
  AdminUser (String name, int age) : super(name, age) {
    role = Role.Admin; // Mengatur role sebagai Admin
  }

  void addProduct(Product product) {
    if (product.inStock) {
      products.add(product);
      print('Produk "${product.productName}" berhasil ditambahkan.');
    } else {
      throw Exception('Produk "${product.productName}" tidak tersedia dalam stok.');
    }
  }

  void removeProduct(String productName) {
    products.removeWhere((product) => product.productName == productName);
    print('Produk "$productName" berhasil dihapus.');
  }
}

// Subclass CustomerUser 
class CustomerUser  extends User {
  CustomerUser (String name, int age) : super(name, age) {
    role = Role.Customer; // Mengatur role sebagai Customer
  }

  void viewProducts() {
    print('Daftar Produk:');
    for (var product in products) {
      print('- ${product.productName} (Harga: ${product.price}, Tersedia: ${product.inStock})');
    }
  }
}

// Fungsi asinkron untuk mengambil detail produk
Future<Product> fetchProductDetails(String productName) async {
  // Meniru penundaan pengambilan data dari server
  await Future.delayed(Duration(seconds: 2));
  // Mengembalikan produk sebagai contoh
  return Product(productName, 100.0, true);
}

void main() async {
  // Membuat pengguna
  AdminUser  admin = AdminUser ('Admin', 30);
  CustomerUser  customer = CustomerUser ('Customer', 25);

  // Menambahkan produk
  try {
    Product product1 = await fetchProductDetails('Laptop');
    admin.addProduct(product1);

    Product product2 = await fetchProductDetails('Smartphone');
    admin.addProduct(product2);

    // Menambahkan produk yang tidak tersedia dalam stok
    Product product3 = Product('Tablet', 200.0, false);
    admin.addProduct(product3); // Ini akan melempar exception
  } catch (e) {
    print('Error: $e');
  }

  // Melihat produk oleh customer
  customer.products = admin.products; // Customer melihat produk dari admin
  customer.viewProducts();

  // Menghapus produk
  admin.removeProduct('Laptop');
  customer.viewProducts(); // Melihat produk setelah penghapusan
}