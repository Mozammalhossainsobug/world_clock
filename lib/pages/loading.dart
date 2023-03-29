import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "time_from_variable";
  String date = "hello_date";

  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(userInput: 'Dhaka');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',
      arguments: {
      'address' : instance.dataTimeZone,
        'time' : instance.dataTime,
        'date' : instance.dataDate,
        'isDayTime' : instance.isDayTime,
      }
    );
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
        body: Center(
          child: SpinKitCircle(
            color: Colors.white,
            size: 80.0,
          ),
        )
    );
  }
}
