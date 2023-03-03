import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:platzi_trips_app_avanzado/User/model/user_model.dart';

class CloudFirestoreAPI {
  final String users = "users";
  final String place = "places";

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void updateUserDate(UserModel user) async {
    DocumentReference ref = _db.collection(users).doc(user.uid);
    return ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myPlaces,
      'myFavoritePlaces': user.myFavoritePlaces,
      'lastSignIn': DateTime.now()
    }, SetOptions(merge: true));
  }
}
