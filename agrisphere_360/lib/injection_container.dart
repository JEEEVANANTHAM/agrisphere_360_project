import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! External
  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
  sl.registerLazySingleton(() => FirebaseStorage.instance);

  //! Features - Authentication
  // sl.registerLazySingleton(() => AuthRepository(auth: sl()));
  
  //! Features - Farm
  // sl.registerLazySingleton(() => FarmRepository(firestore: sl()));

  //! Core
  // sl.registerLazySingleton(() => NetworkInfo());
}
