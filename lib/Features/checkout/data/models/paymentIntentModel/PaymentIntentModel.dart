class PaymentIntentModel {
  late String id;
  late String object;
  late int amount;
  late int amountCapturable;
  late AmountDetails amountDetails;
  late int amountReceived;
  dynamic application;
  dynamic applicationFeeAmount;
  dynamic automaticPaymentMethods;
  dynamic canceledAt;
  dynamic cancellationReason;
  late String captureMethod;
  late String clientSecret;
  late String confirmationMethod;
  late int created;
  late String currency;
  dynamic customer;
  dynamic description;
  dynamic invoice;
  dynamic lastPaymentError;
  dynamic latestCharge;
  late bool livemode;
  late Map<String, dynamic> metadata;
  dynamic nextAction;
  dynamic onBehalfOf;
  dynamic paymentMethod;
  dynamic paymentMethodConfigurationDetails;
  late Map<String, dynamic> paymentMethodOptions;
  late List<String> paymentMethodTypes;
  dynamic processing;
  dynamic receiptEmail;
  dynamic review;
  dynamic setupFutureUsage;
  dynamic shipping;
  dynamic statementDescriptor;
  dynamic statementDescriptorSuffix;
  late String status;
  dynamic transferData;
  dynamic transferGroup;

  PaymentIntentModel({
    required this.id,
    required this.object,
    required this.amount,
    required this.amountCapturable,
    required this.amountDetails,
    required this.amountReceived,
    this.application,
    this.applicationFeeAmount,
    this.automaticPaymentMethods,
    this.canceledAt,
    this.cancellationReason,
    required this.captureMethod,
    required this.clientSecret,
    required this.confirmationMethod,
    required this.created,
    required this.currency,
    this.customer,
    this.description,
    this.invoice,
    this.lastPaymentError,
    this.latestCharge,
    required this.livemode,
    required this.metadata,
    this.nextAction,
    this.onBehalfOf,
    this.paymentMethod,
    this.paymentMethodConfigurationDetails,
    required this.paymentMethodOptions,
    required this.paymentMethodTypes,
    this.processing,
    this.receiptEmail,
    this.review,
    this.setupFutureUsage,
    this.shipping,
    this.statementDescriptor,
    this.statementDescriptorSuffix,
    required this.status,
    this.transferData,
    this.transferGroup,
  });

  factory PaymentIntentModel.fromJson(Map<String, dynamic> json) {
    return PaymentIntentModel(
      id: json['id'] as String,
      object: json['object'] as String,
      amount: json['amount'] as int,
      amountCapturable: json['amount_capturable'] as int,
      amountDetails: AmountDetails.fromJson(json['amount_details'] as Map<String, dynamic>),
      amountReceived: json['amount_received'] as int,
      application: json['application'],
      applicationFeeAmount: json['application_fee_amount'],
      automaticPaymentMethods: json['automatic_payment_methods'],
      canceledAt: json['canceled_at'],
      cancellationReason: json['cancellation_reason'],
      captureMethod: json['capture_method'] as String,
      clientSecret: json['client_secret'] as String,
      confirmationMethod: json['confirmation_method'] as String,
      created: json['created'] as int,
      currency: json['currency'] as String,
      customer: json['customer'],
      description: json['description'],
      invoice: json['invoice'],
      lastPaymentError: json['last_payment_error'],
      latestCharge: json['latest_charge'],
      livemode: json['livemode'] as bool,
      metadata: json['metadata'] as Map<String, dynamic>,
      nextAction: json['next_action'],
      onBehalfOf: json['on_behalf_of'],
      paymentMethod: json['payment_method'],
      paymentMethodConfigurationDetails: json['payment_method_configuration_details'],
      paymentMethodOptions: json['payment_method_options'] as Map<String, dynamic>,
      paymentMethodTypes: List<String>.from(json['payment_method_types'] as List<dynamic>),
      processing: json['processing'],
      receiptEmail: json['receipt_email'],
      review: json['review'],
      setupFutureUsage: json['setup_future_usage'],
      shipping: json['shipping'],
      statementDescriptor: json['statement_descriptor'],
      statementDescriptorSuffix: json['statement_descriptor_suffix'],
      status: json['status'] as String,
      transferData: json['transfer_data'],
      transferGroup: json['transfer_group'],
    );
  }
}

class AmountDetails {
  late Map<String, dynamic> tip;

  AmountDetails({required this.tip});

  factory AmountDetails.fromJson(Map<String, dynamic> json) {
    return AmountDetails(
      tip: json['tip'] as Map<String, dynamic>,
    );
  }
}
