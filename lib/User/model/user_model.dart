import 'package:platzi_trips_app_avanzado/Place/models/place.dart';

class UserModel {
  final String? uid;
  final String? name;
  final String? email;
  final String? photoURL;
  final List<Place>? myPlaces;
  final List<Place>? myFavoritePlaces;
  UserModel(
      {this.uid,
      required this.name,
      required this.email,
      required this.photoURL,
      this.myPlaces,
      this.myFavoritePlaces});
}
