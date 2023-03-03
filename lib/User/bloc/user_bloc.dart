import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app_avanzado/User/model/user_model.dart';
import 'package:platzi_trips_app_avanzado/User/repository/auth_repository.dart';
import 'package:platzi_trips_app_avanzado/User/repository/cloud_firestore_repository.dart';

class UserBloc implements Bloc {
  final _authRepository = AuthRepository();

  // Flujo de datos - Streams
  // Streams - Firebase
  // StreamController
  Stream<User?> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User?> get authStatus => streamFirebase;

  // Casos de uso
  // 1. sig in con google
  Future<User?> signIn() {
    return _authRepository.signInFirebase();
  }

  signOut() {
    _authRepository.signOut();
  }

  // 2. Registrar usuario en base de datos
  final _cloudFirestoreRepository = CloudFirestoreRepository();

  void updateUserDate(UserModel user) =>
      _cloudFirestoreRepository.updateUserDateFirestore(user);

  @override
  void dispose() {}
}
