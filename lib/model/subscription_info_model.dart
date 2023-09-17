class SubscriptionInfoModel {
  String? gym;
  double? price;
  int? month;

  SubscriptionInfoModel();

  SubscriptionInfoModel.fromJson(Map<String, dynamic> json) {
    gym = json['gym'];
    price = json['price'];
    month = json['month'];
  }


}