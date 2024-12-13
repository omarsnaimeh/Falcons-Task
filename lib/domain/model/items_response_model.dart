class ItemsResponseModel {
  List<ItemsMaster>? itemsMaster;

  ItemsResponseModel({this.itemsMaster});

  ItemsResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['Items_Master'] != null) {
      itemsMaster = <ItemsMaster>[];
      json['Items_Master'].forEach((v) {
        itemsMaster!.add(new ItemsMaster.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.itemsMaster != null) {
      data['Items_Master'] = this.itemsMaster!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemsMaster {
  String? cOMAPNYNO;
  String? iTEMNO;
  String? nAME;
  String? cATEOGRYID;
  String? itemK;
  String? bARCODE;
  String? mINPRICE;
  String? iTEML;
  String? iSSUSPENDED;
  String? fD;
  String? iTEMHASSERIAL;
  String? iTEMPICSPATH;
  String? tAXPERC;
  String? iSAPIPIC;
  String? lSPRICE;

  ItemsMaster(
      {this.cOMAPNYNO,
        this.iTEMNO,
        this.nAME,
        this.cATEOGRYID,
        this.itemK,
        this.bARCODE,
        this.mINPRICE,
        this.iTEML,
        this.iSSUSPENDED,
        this.fD,
        this.iTEMHASSERIAL,
        this.iTEMPICSPATH,
        this.tAXPERC,
        this.iSAPIPIC,
        this.lSPRICE});

  ItemsMaster.fromJson(Map<String, dynamic> json) {
    cOMAPNYNO = json['COMAPNYNO'];
    iTEMNO = json['ITEMNO'];
    nAME = json['NAME'];
    cATEOGRYID = json['CATEOGRYID'];
    itemK = json['ItemK'];
    bARCODE = json['BARCODE'];
    mINPRICE = json['MINPRICE'];
    iTEML = json['ITEML'];
    iSSUSPENDED = json['ISSUSPENDED'];
    fD = json['F_D'];
    iTEMHASSERIAL = json['ITEMHASSERIAL'];
    iTEMPICSPATH = json['ITEMPICSPATH'];
    tAXPERC = json['TAXPERC'];
    iSAPIPIC = json['ISAPIPIC'];
    lSPRICE = json['LSPRICE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['COMAPNYNO'] = this.cOMAPNYNO;
    data['ITEMNO'] = this.iTEMNO;
    data['NAME'] = this.nAME;
    data['CATEOGRYID'] = this.cATEOGRYID;
    data['ItemK'] = this.itemK;
    data['BARCODE'] = this.bARCODE;
    data['MINPRICE'] = this.mINPRICE;
    data['ITEML'] = this.iTEML;
    data['ISSUSPENDED'] = this.iSSUSPENDED;
    data['F_D'] = this.fD;
    data['ITEMHASSERIAL'] = this.iTEMHASSERIAL;
    data['ITEMPICSPATH'] = this.iTEMPICSPATH;
    data['TAXPERC'] = this.tAXPERC;
    data['ISAPIPIC'] = this.iSAPIPIC;
    data['LSPRICE'] = this.lSPRICE;
    return data;
  }
}