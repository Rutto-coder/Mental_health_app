import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mental_health_app/Constants/Firebase_constants.dart';
import 'package:mental_health_app/screens/LogInScreen.dart';
import 'package:mental_health_app/screens/homeScreen.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }
}

_setInitialScreen(User? user) {
  if (user != null) {
    Get.offAll(
        const HomeScreen()); // If user is signed in, navigate to the home page
  } else {
    Get.offAll(
        LoginScreen()); // If user is not already logged in, navigate to the login screen
  }
}

void register(String email, String password) {
  try {
    auth.createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    print(e.toString());
  } catch (e) {
    print(e.toString());
  }
}

void Login(String email, String password) {
  try {
    auth.signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    print(e.toString());
  } catch (e) {
    print(e.toString());
  }
}

void signout() {
  try {
    auth.signOut();
  } catch (e) {
    print(e.toString());
  }
}
