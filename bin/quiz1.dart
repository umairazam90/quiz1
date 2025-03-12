import 'dart:io';

class Product {
  String name;
  double price;

  Product(this.name, this.price);
}
class ShoppingCart {
  List<Product> items = [];

  void addItem(Product product) {
    items.add(product);
    print('${product.name} added to your cart!');
  }

  void showItems() {
    if (items.isEmpty) {
      print('Your cart is empty');
      return;
    }

    print('\nItems in your cart:');
    for (var item in items) {
      print('${item.name} - \$${item.price}');
    }
  }

  double calculateTotal() {
    double total = 0;
    for (var item in items) {
      total += item.price;
    }
    return total;
  }

  void clearCart() {
    items.clear();
  }
}

void main() {
  final products = [
    Product('School Bag', 2000),
    Product('Water Bottle', 1000),
    Product('Notebook', 500),
    Product('Pen', 100),
  ];

  final cart = ShoppingCart();
  bool isRunning = true;

  print('Welcome to School Supplies Store!\n');

  while (isRunning) {
    print('Choose an option:');
    print('1. Book - \$${products[0].price}');
    print('2. Bag - \$${products[1].price}');
    print('3. Water Bottle - \$${products[2].price}');
    print('4. Notebook - \$${products[3].price}');
    print('5. View my cart');
    print('6. Checkout');
    print('7. Exit store');

    stdout.write('\nEnter your choice (1-7): ');
    var choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        cart.addItem(products[0]);
        break;
      case '2':
        cart.addItem(products[1]);
        break;
      case '3':
        cart.addItem(products[2]);
        break;
      case '4':
        cart.addItem(products[3]);
        break;
      case '5':
        cart.showItems();
        break;
      case '6':
        print('\nYour total is \$${cart.calculateTotal().toStringAsFixed(2)}');
        print('Thank you for shopping with us!');
        cart.clearCart();
        isRunning = false;
        break;
      case '7':
        print('Goodbye!');
        isRunning = false;
        break;
      default:
        print('Invalid choice. Please try again.');
    }
    print('\n' + '-' * 30 + '\n');
  }
}