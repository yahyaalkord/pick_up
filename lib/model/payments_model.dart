class PaymentsModel {
  int? id;
  String? name;
  int? status;
  String? imageUrl;

  PaymentsModel();

  PaymentsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    imageUrl = json['image_url'];
  }

}