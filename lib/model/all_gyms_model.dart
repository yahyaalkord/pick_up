class AllGymsModel {
  int? id;
  String? name;
  String? description;
  int? status;
  int? age;
  String? imageUrl;

  AllGymsModel();

  AllGymsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    status = json['status'];
    age = json['age'];
    imageUrl = json['image_url'];
  }

}