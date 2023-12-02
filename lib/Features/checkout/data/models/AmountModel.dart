class Order {
  String? total;
  String? currency;
  OrderDetails? details;

  Order({
    this.total,
    this.currency,
    this.details,
  });

  Map<String, dynamic> toJson() {
    return {
      "total": total,
      "currency": currency,
      "details": details?.toJson(),
    };
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

  Map<String, dynamic> toJson() {
    return {
      "subtotal": subtotal,
      "shipping": shipping,
      "shippingDiscount": shippingDiscount,
    };
  }
}
