import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
class WorldTime{
  String? choseLocation;       // to choose location
  String? time = '';                // to display time
  String? selectedLocation;    // to display time according selected location
  String? countryFlag;         // country flags probably image urls
  bool? isDay;
  // constructor
  WorldTime({this.choseLocation,this.selectedLocation,this.countryFlag});

  Future<void> getTime() async{
    try{
      // make the request
      Response response = await get(Uri.parse('https://timeapi.io/api/time/current/zone?timeZone=$selectedLocation'));
      //Asia%2FKolkata
      print(response.statusCode);

      // converting the received response in dart object
      Map data = jsonDecode(response.body);


      // accessing information
      String dateTime = data['dateTime'];

      // converting the dateTime string value into DateTime object
      DateTime now = DateTime.parse(dateTime);

      isDay = (now.hour > 6 && now.hour < 20) ? true : false;
      // initializing the time member variable
      time = DateFormat.jm().format(now);
    }catch (e){
      print('error occurs: $e');
      time = 'Fail to get Time';
    }
  }
}