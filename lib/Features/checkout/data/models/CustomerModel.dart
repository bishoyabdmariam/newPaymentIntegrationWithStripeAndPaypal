class EphemeralKey {
  String? id;
  String? object;
  List<AssociatedObject>? associatedObjects;
  int? created;
  int? expires;
  bool? livemode;
  String? secret;

  EphemeralKey({
    this.id,
    this.object,
    this.associatedObjects,
    this.created,
    this.expires,
    this.livemode,
    this.secret,
  });

  factory EphemeralKey.fromJson(Map<String, dynamic> json) {
    return EphemeralKey(
      id: json['id'],
      object: json['object'],
      associatedObjects: json['associated_objects'] != null
          ? List<AssociatedObject>.from(json['associated_objects'].map((x) => AssociatedObject.fromJson(x)))
          : null,
      created: json['created'],
      expires: json['expires'],
      livemode: json['livemode'],
      secret: json['secret'],
    );
  }
}

class AssociatedObject {
  String? id;
  String? type;

  AssociatedObject({
    this.id,
    this.type,
  });

  factory AssociatedObject.fromJson(Map<String, dynamic> json) {
    return AssociatedObject(
      id: json['id'],
      type: json['type'],
    );
  }
}
