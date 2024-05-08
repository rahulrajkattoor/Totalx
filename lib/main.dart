import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:totalx/MACHINE%20TEST/TOTAL%20X/login%20page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey:  "AIzaSyCbVrHtUFMJ4qzgeOWhyVWxyklj3NSaz2Q",
          appId: "1:243447360191:android:2f1d402008e8d8f2efb40a",
          messagingSenderId: "",
          projectId: "com.example.untitled",
          storageBucket: "mockstore-a975a.appspot.com"
          ));

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Login());
  }
}
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

void uploadData(String name, String phoneNumber, File file) async {
  // Reference to your Firebase Storage instance
  FirebaseStorage storage = FirebaseStorage.instance;

  // Reference to the file in Firebase Storage
  Reference storageRef = storage.ref().child('users/$name');

  try {
    // Upload the file along with the name and phone number
    await storageRef.putFile(file);

    // Get the download URL of the uploaded file
    String downloadURL = await storageRef.getDownloadURL();

    // Now, you can save the download URL along with name and phone number
    // to Firebase Database or Firestore for future reference
    // For example:
    // firestoreInstance.collection('users').doc(name).set({
    //   'name': name,
    //   'phoneNumber': phoneNumber,
    //   'downloadURL': downloadURL,
    // });

    print('File uploaded successfully!');
  } catch (e) {
    print('Error uploading file: $e');
  }
}
