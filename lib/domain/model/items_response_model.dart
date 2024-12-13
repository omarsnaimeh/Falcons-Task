class ItemsResponseModel {
  final String itemNo;
  final String name;
  final String barcode;
  String qty;

  ItemsResponseModel({
    required this.itemNo,
    required this.name,
    required this.barcode,
    this.qty = "0",
  });

  factory ItemsResponseModel.fromJson(Map<String, dynamic> json) {
    return ItemsResponseModel(
      itemNo: json['ITEMNO'] ?? "",
      name: json['NAME'] ?? "",
      barcode: json['BARCODE'] ?? "",
      qty: json['QTY']?.toString() ?? "0",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'itemNo': itemNo,
      'name': name,
      'barcode': barcode,
      'qty': qty,
    };
  }

  static ItemsResponseModel fromMap(Map<String, dynamic> map) {
    return ItemsResponseModel(
      itemNo: map['itemNo'] ?? "",
      name: map['name'] ?? "",
      barcode: map['barcode'] ?? "",
      qty: map['qty'] ?? "0",
    );
  }

  int get parsedQty {
    try {
      return double.parse(qty).toInt();
    } catch (_) {
      return 0;
    }
  }
}
