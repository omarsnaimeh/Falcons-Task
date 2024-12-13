class ItemsResponseModel {
  final String itemNo;
  final String name;
  final String barcode;
  final String qty;

  ItemsResponseModel({
    required this.itemNo,
    required this.name,
    required this.barcode,
    required this.qty,
  });

  factory ItemsResponseModel.fromJson(Map<String, dynamic> json) {
    return ItemsResponseModel(
      itemNo: json['ITEMNO'],
      name: json['NAME'],
      barcode: json['BARCODE'],
      qty: '0',
    );
  }
}
