import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:mental_health_app/Controllers/auth_Controller.dart';
import 'LogInScreen.dart';

class signUpScreen extends StatefulWidget {
  signUpScreen({Key? key}) : super(key: key);

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  //Dispose the contorllers for better memory management
  @override
  dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                'Sign Up',
                style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: _EmailEditor(),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: _Password_Editor(),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: _User_name_Editor(),
              ),
              SizedBox(
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
                    register(_emailController.text.trim(),
                        _passwordController.text.trim());
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    const Text("Already have an account?",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: const Text("Log in",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          )),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
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

  Widget _EmailEditor() {
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
          controller: _emailController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (email) {
            return email != null && !EmailValidator.validate(email)
                ? 'Enter a valid email'
                : null;
          }),
    );
  }

  Widget _Password_Editor() {
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
          controller: _passwordController,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => value != null && value.length < 6
              ? 'Password should be more than 6 characters'
              : null),
    );
  }

  Widget _User_name_Editor() {
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
