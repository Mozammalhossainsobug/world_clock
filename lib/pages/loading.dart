import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime(){
    WorldTime instance = WorldTime(location: 'Dhaka');
    instance.getTime();
}

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Text("from loading activity"),),
    );
  }
}
