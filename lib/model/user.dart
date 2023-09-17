class User {
  int? id;
  String? name;
  String? email;
  String? date;
  String? phone;
  String? token;
  bool? userComplete;

  User();

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    date = json['date'];
    phone = json['phone'];
    token = json['token'];
    userComplete = json['user_complete'];
  }

}