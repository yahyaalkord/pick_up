class AllSubscriptionModel {
  int? id;
  String? name;
  int? noOfMonths;
  double? price;
  int? status;
  int? gymId;
  String? endDate;
  String? gymName;

  AllSubscriptionModel();

  AllSubscriptionModel.fromJson(Map<String, dynamic> json) {
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