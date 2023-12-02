class Order {
  String? total;
  String? currency;
  OrderDetails? details;

  Order({
    this.total,
    this.currency,
    this.details,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      total: json['total']?.toString(),
      currency: json['currency'],
      details: json['details'] != null ? OrderDetails.fromJson(json['details']) : null,
    );
  }
}

class OrderDetails {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  OrderDetails({
    this.subtotal,
    this.shipping,
    this.shippingDiscount,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) {
    return OrderDetails(
      subtotal: json['subtotal']?.toString(),
      shipping: json['shipping']?.toString(),
      shippingDiscount: json['shipping_discount'] as int?,
    );
  }
}
