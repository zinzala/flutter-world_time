import 'package:flutter/material.dart';
import 'package:world_time/pages/error.dart';
import 'package:world_time/services/world_time.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        choseLocation: 'Kolkata',
        countryFlag: 'flag(india).png',
        selectedLocation: 'Asia%2FKolkata');
    await instance.getTime();
    if(instance.isDay == null){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ErrorPage(),));
    }else{
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'selectedLocation': instance.choseLocation,
        'flag': instance.countryFlag,
        'time': instance.time,
        'isDay' : instance.isDay,
      });
    }

  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Center(
        child: CircularProgressIndicator(color: Colors.white,),
        // child: SpinKitRing(
        //   color: Colors.white,
        //   size: 50.0,
        // ),
      ),
    );
  }
}
