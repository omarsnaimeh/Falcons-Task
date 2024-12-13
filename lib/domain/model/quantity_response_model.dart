class QuantityResponseModel {
  List<SalesManItemsBalance>? salesManItemsBalance;

  QuantityResponseModel({this.salesManItemsBalance});

  QuantityResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['SalesMan_Items_Balance'] != null) {
      salesManItemsBalance = <SalesManItemsBalance>[];
      json['SalesMan_Items_Balance'].forEach((v) {
        salesManItemsBalance!.add(new SalesManItemsBalance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.salesManItemsBalance != null) {
      data['SalesMan_Items_Balance'] =
          this.salesManItemsBalance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SalesManItemsBalance {
  String? cOMAPNYNO;
  String? sTOCKCODE;
  String? itemOCode;
  String? qTY;

  SalesManItemsBalance(
      {this.cOMAPNYNO, this.sTOCKCODE, this.itemOCode, this.qTY});

  SalesManItemsBalance.fromJson(Map<String, dynamic> json) {
    cOMAPNYNO = json['COMAPNYNO'];
    sTOCKCODE = json['STOCK_CODE'];
    itemOCode = json['ItemOCode'];
    qTY = json['QTY'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['COMAPNYNO'] = this.cOMAPNYNO;
    data['STOCK_CODE'] = this.sTOCKCODE;
    data['ItemOCode'] = this.itemOCode;
    data['QTY'] = this.qTY;
    return data;
  }
}