class CartItem {
  final String image;
  final String name;
  final String price;

  CartItem({required this.image, required this.name, required this.price});
}

class CartModel {
  static final CartModel _instance = CartModel._internal();
  factory CartModel() => _instance;
  CartModel._internal();

  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void add(CartItem item) {
    _items.add(item);
  }

  void remove(CartItem item) {
    _items.remove(item);
  }

  void clear() {
    _items.clear();
  }

  double get total {
    return _items.fold(0, (sum, item) => sum + double.parse(item.price.replaceAll('₹', '')));
  }
}