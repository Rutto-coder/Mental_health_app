import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mental_health_app/Controllers/auth_Controller.dart';
import 'package:mental_health_app/Helpers/showProgressBar.dart';
import 'package:mental_health_app/screens/signUpScreen.dart';
import 'package:email_validator/email_validator.dart';
import '../Controllers/auth_Controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

//final emailController = TextEditingController();
//final passwordController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

//Dispose the contorllers for better memory management
  @override
  dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              const Text(
                'Welcome Back',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff567b99)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Mary Immaculate Hospital",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Log in',
                style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff01b2ee),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: EmailEditor(),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Password_Editor(),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.dialog(const Expanded(
                      child: AlertDialog(
                        backgroundColor: Colors.transparent,
                        content: Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ));
                    Login(emailController.text.trim(),
                        passwordController.text.trim());
                  },
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Forgot password?',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff567b99)),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    const Text("Don't have an account yet?",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff01b2ee),
                          fontWeight: FontWeight.w400,
                        )),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      child: const Text("Sign Up",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          )),
                      onTap: () {
                        Get.to(signUpScreen());
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget EmailEditor() {
    return Form(
      key: GlobalKey<FormState>(),
      child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: 'example@gmai.com',
              //errorText: 'Enter a Valid Email',
              prefixIcon: Icon(Icons.email),
              contentPadding: EdgeInsets.all(12),
              labelText: 'Email',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          controller: emailController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (email) {
            return email != null && !EmailValidator.validate(email)
                ? 'Enter a valid email'
                : null;
          }),
    );
  }

  Widget Password_Editor() {
    return Form(
      key: GlobalKey<FormState>(),
      child: TextFormField(
          decoration: InputDecoration(
              hintText: 'Enter your password',
              //errorText: 'Enter a Valid Email',
              prefixIcon: Icon(Icons.vpn_key_sharp),
              contentPadding: EdgeInsets.all(12),
              labelText: 'Password',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          controller: passwordController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => value != null && value.length < 6
              ? 'Password should be more than 6 characters'
              : null),
    );
  }

  Widget User_name_Editor() {
    return TextField(
      decoration: InputDecoration(
          hintText: 'Username',
          //errorText: 'Enter a Valid Email',
          prefixIcon: Icon(Icons.person),
          filled: false,
          fillColor: Colors.blue.shade200,
          contentPadding: const EdgeInsets.all(12),
          label: const Text('Username'),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
