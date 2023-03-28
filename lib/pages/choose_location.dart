import 'package:flutter/material.dart';

class Choose_location extends StatefulWidget {
  const Choose_location({Key? key}) : super(key: key);

  @override
  State<Choose_location> createState() => _Choose_locationState();
}

class _Choose_locationState extends State<Choose_location> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose a Location"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(child: Text("From choose location activity"),),
    );
  }
}
