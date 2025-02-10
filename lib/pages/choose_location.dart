import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

import 'error.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        selectedLocation: 'Australia%2FSydney',
        choseLocation: 'Sydney',
        countryFlag: 'Flag(Australia).jpg'),
    WorldTime(
        selectedLocation: 'Africa%2FLubumbashi',
        choseLocation: 'Lubumbashi',
        countryFlag: 'flag(drc).png.png'),
    WorldTime(
        selectedLocation: 'America%2FLos_Angeles',
        choseLocation: 'Los Angeles',
        countryFlag: 'flag(usa).jpg'),
    WorldTime(
        selectedLocation: 'Asia%2FKolkata',
        choseLocation: 'Kolkata',
        countryFlag: 'flag(india).png'),
    WorldTime(
        selectedLocation: 'Atlantic%2FBermuda',
        choseLocation: 'Bermuda',
        countryFlag: 'Flag(Bermuda).jpg'),
    WorldTime(
        selectedLocation: 'Europe%2FAmsterdam',
        choseLocation: 'Amsterdam',
        countryFlag: 'flag(Netherland).jpg'),
    WorldTime(
        selectedLocation: 'Japan',
        choseLocation: 'Japan',
        countryFlag: 'flag(Japan).png'),
    WorldTime(
        selectedLocation: 'Singapore',
        choseLocation: 'Singapore',
        countryFlag: 'flag(Singapore).png'),
    ////////////////
    WorldTime(
      selectedLocation: 'America%2FPhoenix',
      choseLocation: 'Phoenix',
      countryFlag: 'Flag(Arizona).png',
    ),
    WorldTime(
      selectedLocation: 'America%2FToronto',
      choseLocation: 'Toronto',
      countryFlag: 'Flag(Canada).png',
    ),
    WorldTime(
      selectedLocation: 'Asia%2FBangkok',
      choseLocation: 'Bangkok',
      countryFlag: 'Flag(Thailand).png',
    ),
    WorldTime(
      selectedLocation: 'Asia%2FChita',
      choseLocation: 'Chita',
      countryFlag: 'Flag(Russia).png',
    ),
  ];

  void wantTime(index) async {
    // store the specific WorldTime object
    WorldTime instance = locations[index];
    await instance.getTime();
    if(instance.isDay == null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ErrorPage(),));
    }else{
      Navigator.pop(
        context,
        {
          'selectedLocation': instance.choseLocation,
          'flag': instance.countryFlag,
          'time': instance.time,
          'isDay' : instance.isDay,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Location',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
              child: SizedBox(
                height: 62,
                child: ListTile(
                  onTap: () {
                    // print(locations[index].choseLocation);
                    wantTime(index);
                  },
                  title: Text('${locations[index].choseLocation}',style: TextStyle(fontFamily: 'WorldTimeFont'),),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: Image.asset(
                      'assets/images/${locations[index].countryFlag}',
                      height: 75,
                      width: 75,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
