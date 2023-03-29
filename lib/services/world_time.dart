import 'package:http/http.dart';
import 'dart:convert';
import 'package:geocoding/geocoding.dart';

class WorldTime {
  late String userInput;
  late String dataDate;
  late String dataTime;
  late String dataTimeZone;
  late double latitude, longitude;
  late bool isDayTime;

  WorldTime({required this.userInput});

  Future<void> getTime() async {
    try{
      List<Location> locations = await locationFromAddress(userInput);
      Location location = locations.first;

      Response response = await get(Uri.parse(
          "https://timeapi.io/api/Time/current/coordinate?latitude=${location.latitude}&longitude=${location.longitude}"));
      Map data = jsonDecode(response.body);



      dataTime = data['time'];
      dataDate = data['date'];
      dataTimeZone = data['timeZone'];

      int hour = int.parse(dataTime[0]) * 10 + int.parse(dataTime[1]);

      isDayTime = hour > 6 && hour < 20 ? true : false;
    }
    catch(e) {
      dataTime = "Couldn't Get the time data";
      dataDate = "Check your internet connection or enter a valid city";
    }

  }
}
