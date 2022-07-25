import 'package:flutter/material.dart';

// ignore: camel_case_types
class showProgressBar extends StatefulWidget {
  const showProgressBar({Key? key}) : super(key: key);

  @override
  State<showProgressBar> createState() => _showProgressBarState();
}

class _showProgressBarState extends State<showProgressBar> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: Colors.blue),
      ),
    );
  }
}
