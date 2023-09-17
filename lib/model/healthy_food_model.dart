class HealthyFoodModel {
  int? id;
  String? title;
  double? calories;
  int? status;
  String? imageUrl;
  List<HealthyFoodContent>? content;

  HealthyFoodModel();

  HealthyFoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    calories = json['calories'];
    status = json['status'];
    imageUrl = json['image_url'];
    if (json['content'] != null) {
      content = <HealthyFoodContent>[];
      json['content'].forEach((v) {
        content!.add( HealthyFoodContent.fromJson(v));
      });
    }
  }

}

class HealthyFoodContent {
  int? id;
  String? title;
  int? status;
  int? foodId;

  HealthyFoodContent();

  HealthyFoodContent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    foodId = json['food_id'];
  }

}