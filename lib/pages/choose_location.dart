import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
   String? userInput;

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
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
              padding: EdgeInsets.fromLTRB(20.0,20.0,20.0,20.0),
              decoration:
              BoxDecoration(
                color: Colors.grey,
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
              child:
              TextField(
                onChanged: (value) {
                  userInput = value;
                  // assign the value entered by the user to userInput variable
                },
                decoration: InputDecoration(
                  labelText : 'Enter City here',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
              padding: EdgeInsets.fromLTRB(40.0,10.0,40.0,10.0),
              decoration:
              BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.grey, width: .5),
                borderRadius: BorderRadius.circular(9),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2, 2),
                    blurRadius: 5,
                  ),
                ],
              ),
              child:
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white, disabledForegroundColor: Colors.white,
                ),
                onPressed: (){
                  updateTime(userInput!);
                },
                child: Text('Show'),
              )
            ),

          ],
        ),
    );
  }
}