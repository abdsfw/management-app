class ProductModel {
  int? id;
  int? categoryId;
  String? name;
  double? priceOfBuy;
  double? priceOfSell;
  int? quantity;
  int? oldQuantity;

  ProductModel({
    this.id,
    this.categoryId,
    this.name,
    this.priceOfBuy,
    this.priceOfSell,
    this.quantity,
    this.oldQuantity,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as int?,
        categoryId: json['categoryId'] as int?,
        name: json['name'] as String?,
        priceOfBuy: (json['priceOfBuy'] as num?)?.toDouble(),
        priceOfSell: (json['priceOfSell'] as num?)?.toDouble(),
        quantity: json['quantity'] as int?,
        oldQuantity: json['oldQuantity'] as int?,
      );

  Map<String, dynamic> toJson() => {
        // 'id': id,
        'categoryId': categoryId,
        'name': name,
        'priceOfBuy': priceOfBuy,
        'priceOfSell': priceOfSell,
        'quantity': quantity,
        'oldQuantity': oldQuantity,
      };
}
