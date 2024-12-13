class QuantityResponseModel {
   String itemOCode;
   String qty;

  QuantityResponseModel({
    required this.itemOCode,
    required this.qty,
  });

  factory QuantityResponseModel.fromJson(Map<String, dynamic> json) {
    return QuantityResponseModel(
      itemOCode: json['ItemOCode'],
      qty: json['QTY'],
    );
  }
}