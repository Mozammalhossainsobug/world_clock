import 'package:http/http.dart';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';

class WorldTime {
   late String location;
   late String dataDate;
   late String dataTime;
   late double latitude, longitude;

    WorldTime({required this.location});



  void getTime() async {

    final Geolocator geolocator = Geolocator();
    List<Placemark> placemarks = await geolocator.placemarkFromAddress(location);
    Placemark placemark = placemarks.first;
    latitude = placemark.position.latitude;
    longitude = placemark.position.longitude;

    Response response = await get(Uri.parse("https://timeapi.io/api/Time/current/coordinate?latitude=$latitude&longitude=$longitude"));
    Map data = jsonDecode(response.body);

    String dataTime = data['time'];
    String dataDate = data['date'];
    String DataTimeZone = data['timeZone'];

    print(DataTimeZone);
    print(dataTime);
    print(dataDate);
  }

}