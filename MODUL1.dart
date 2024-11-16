import 'dart:async';
enum Role { Admin, Customer }

class Product {
  String productName;
  double price;
  bool inStock;

  Product(this.productName, this.price, this.inStock);
}
class User {
  String name;
  int age;
  late List<Product> products; 
  Role? role;

  User(this.name, this.age) {
    products = [];
  }
}
class AdminUser  extends User {
  AdminUser (String name, int age) : super(name, age) {
    role = Role.Admin;
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
class CustomerUser  extends User {
  CustomerUser (String name, int age) : super(name, age) {
    role = Role.Customer; 
  }

  void viewProducts() {
    print('Daftar Produk:');
    for (var product in products) {
      print('- ${product.productName} (Harga: ${product.price}, Tersedia: ${product.inStock})');
    }
  }
}
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

  try {
    Product product1 = await fetchProductDetails('Laptop');
    admin.addProduct(product1);

    Product product2 = await fetchProductDetails('Smartphone');
    admin.addProduct(product2);

    Product product3 = Product('Tablet', 200.0, false);
    admin.addProduct(product3);
  } catch (e) {
    print('Error: $e');
  }

  customer.products = admin.products;
  customer.viewProducts();

  // Menghapus produk
  admin.removeProduct('Laptop');
  customer.viewProducts();
}
