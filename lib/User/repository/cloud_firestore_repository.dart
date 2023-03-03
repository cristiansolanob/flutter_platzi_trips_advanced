import 'package:platzi_trips_app_avanzado/User/model/user_model.dart';
import 'package:platzi_trips_app_avanzado/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDateFirestore(UserModel user) =>
      _cloudFirestoreAPI.updateUserDate(user);
}
