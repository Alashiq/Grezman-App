class CartItem {
  String name;
  String img;
  int count;
  double price;

  CartItem(
      {required this.name,
      required this.img,
      required this.count,
      required this.price});
}

class CartListModel {
  List<CartItem> cartItems = [];

  void addItem(String name, String img, int count, double price) {
    var newItem = CartItem(name: name, img: img, count: count, price: price);
    cartItems.add(newItem);
  }
}
