class ItemRequest {
  String? name;
  String? description;

  ItemRequest({
    this.name,
    this.description,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
      };
}
