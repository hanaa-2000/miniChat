import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth  auth = FirebaseAuth.instance;
FirebaseStorage storage = FirebaseStorage.instance;

User ? currentUser = auth.currentUser;

  // collections

const  userCollection = "users";