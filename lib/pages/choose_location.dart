import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  late String? userInput;
  void updateTime(String userInput) async {

      WorldTime instance = WorldTime(userInput: userInput);
      await instance.getTime();
      
      Navigator.pop(context, {
        'address' : instance.dataTimeZone,
        'time' : instance.dataTime,
        'date' : instance.dataDate,
        'isDayTime' : instance.isDayTime,
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose a Location"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
          padding: EdgeInsets.fromLTRB(20.0,20.0,20.0,20.0),
        decoration:
        BoxDecoration(
          color: Colors.blueAccent,
          border: Border.all(color: Colors.grey, width: .5),
          borderRadius: BorderRadius.circular(3),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(2, 2),
              blurRadius: 5,
            ),
          ],
        ),
            child: TextField(
              onChanged: (value) {
                  userInput = value;
                  updateTime(userInput!);
                // assign the value entered by the user to userInput variable
              },
              decoration: InputDecoration(
                labelText : 'Enter City here',
              ),
            ),
    ),
      ),
      );
  }
}
