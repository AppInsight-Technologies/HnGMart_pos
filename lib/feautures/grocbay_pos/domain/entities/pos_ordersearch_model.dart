
class PosOrderSearch {
  String? oId;
  String? uName;
  String? oDate;
  double? payAmount;
  String? oStatus;

  PosOrderSearch(
      {this.oId, this.uName, this.oDate, this.payAmount, this.oStatus});

  PosOrderSearch.fromJson(Map<String, dynamic> json) {
    oId = json['o_id'];
    uName = json['u_name'];
    oDate = json['o_date'];
    payAmount = (json['pay_amount'] as num).toDouble();
    oStatus = json['o_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['o_id'] = this.oId;
    data['u_name'] = this.uName;
    data['o_date'] = this.oDate;
    data['pay_amount'] = this.payAmount;
    data['o_status'] = this.oStatus;
    return data;
  }

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
