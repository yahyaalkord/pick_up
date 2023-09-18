class ExercisesModel {
  int? id;
  String? title;
  String? type;
  String? shortDescription;
  String? longDescription;
  String? minutes;
  int? workout;
  String? imageUrl;

  ExercisesModel();

  ExercisesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    shortDescription = json['short_description'];
    longDescription = json['long_description'];
    minutes = json['minutes'];
    workout = json['workout'];
    imageUrl = json['image_url'];
  }

}