import 'dart:convert';

class ItemList {
  List<Item>? items;

  ItemList({
    this.items,
  });

  factory ItemList.fromJson(Map<String, dynamic> json) {
    return ItemList(
      items: json['items'] != null ? List<Item>.from((json['items'] as List).map((item) => Item.fromJson(item))) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "items": jsonEncode(this.items),
    };
  }
}

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

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "quantity": quantity,
      "price": price,
      "currency": currency,
    };
  }
}
