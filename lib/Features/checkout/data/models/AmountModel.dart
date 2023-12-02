class Order {
  String? total;
  String? currency;
  OrderDetails? details;

  Order({
    required this.total,
    required this.currency,
    required this.details,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      total: json['total'].toString(),
      currency: json['currency'].toString(),
      details: OrderDetails.fromJson(json['details']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "total": total,
      "currency": currency,
      "details": details!.toJson(),
    };
  }
}

class OrderDetails {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  OrderDetails({
    required this.subtotal,
    required this.shipping,
    required this.shippingDiscount,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) {
    return OrderDetails(
      subtotal: json['subtotal'].toString(),
      shipping: json['shipping'].toString(),
      shippingDiscount: json['shipping_discount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "subtotal": subtotal,
      "shipping": shipping,
      "shipping_discount": shippingDiscount,
    };
  }
}
