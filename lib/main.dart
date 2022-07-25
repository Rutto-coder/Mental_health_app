import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental_health_app/Constants/Firebase_constants.dart';
import 'package:mental_health_app/Controllers/auth_Controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Injecting the Auth controller
  firebaseInitialization.then((Value) {
    Get.put(AuthController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
