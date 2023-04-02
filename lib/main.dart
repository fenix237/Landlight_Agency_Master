import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:landflight_agency_dashboard/utils/theme.dart';
import 'package:landflight_agency_dashboard/views/abonnes.dart';
import 'package:landflight_agency_dashboard/views/agences.dart';
import 'package:landflight_agency_dashboard/views/dashboard.dart';
import 'package:landflight_agency_dashboard/views/gestion_post.dart';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
//import 'package:firebase/firebase.dart' as fb;

Future<void> main() async {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //         apiKey: "AIzaSyAymUaSQ0KOtzPVQk3pVUxfq76fBcCnCCs",
  //         appId: "1:892579144714:web:c05fd249fc689a9ec9ebf3",
  //         messagingSenderId: "892579144714",
  //         projectId: "landflight-agency",
  //         authDomain: "landflight-agency.firebaseapp.com",
  //         databaseURL: "https://landflight-agency-default-rtdb.firebaseio.com",
  //         storageBucket: "landflight-agency.appspot.com",
  //         measurementId: "G-Z3MSPEBPY2"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Landflight',
      home: const Dashboard(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.light,
      theme: lightTheme(),
    );
  }
}
