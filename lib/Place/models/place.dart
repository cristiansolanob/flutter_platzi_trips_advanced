import 'package:platzi_trips_app_avanzado/User/model/user_model.dart';

class Place {
  String? id;
  String name;
  String description;
  String urlImage;
  int? likes;
  UserModel? userOwner;
  Place(
      {required this.name,
      required this.description,
      required this.urlImage,
      this.likes,
      this.userOwner});
}
