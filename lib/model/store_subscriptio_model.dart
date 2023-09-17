class StoreSubscriptionModel {
  int? orderId;
  String? name;
  String? phone;

  StoreSubscriptionModel();

  StoreSubscriptionModel.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    name = json['name'];
    phone = json['phone'];
  }

}