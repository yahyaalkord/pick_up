class HomeModel {
  int? id;
  Subscription? subscription;

  HomeModel();

  HomeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subscription = json['subscription'] != null
        ?  Subscription.fromJson(json['subscription'])
        : null;
  }

}

class Subscription {
  int? id;
  String? name;
  int? noOfMonths;
  double? price;
  int? status;
  int? gymId;
  String? endDate;
  String? gymName;

  Subscription();

  Subscription.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    noOfMonths = json['no_of_months'];
    price = json['price'];
    status = json['status'];
    gymId = json['gym_id'];
    endDate = json['end_date'];
    gymName = json['gym_name'];
  }

}