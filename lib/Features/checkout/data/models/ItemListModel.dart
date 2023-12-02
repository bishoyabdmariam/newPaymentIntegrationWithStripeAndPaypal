class Item {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  Item({
    this.name,
    this.quantity,
    this.price,
    this.currency,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      quantity: json['quantity'] as int?,
      price: json['price']?.toString(),
      currency: json['currency'],
    );
  }
}
