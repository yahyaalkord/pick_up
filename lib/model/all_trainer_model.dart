class AllTrainersModel {
  int? id;
  String? name;
  String? description;
  int? status;
  int? gymId;
  String? imageUrl;

  AllTrainersModel();

  AllTrainersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    status = json['status'];
    gymId = json['gym_id'];
    imageUrl = json['image_url'];
  }

}