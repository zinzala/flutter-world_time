import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    // print(data);
    String isday = (data['isDay'])
        ? 'bright_day(2).jpeg'
        : 'dark_night.jpeg';
    return Scaffold(
      backgroundColor: data['isDay'] ? Colors.blue.shade800 : Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/$isday'),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.26),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenWidth * 0.30,
                      width: screenWidth * 0.50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(screenWidth * 0.028),
                        child: Image.asset(
                          'assets/images/${data['flag']}',
                          // height: 100, // 100
                          // width: 140,  // 140
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data['selectedLocation'],
                          style: TextStyle(
                              fontFamily: 'WorldTimeFont',
                              fontSize: 25.0,
                              color: data['isDay'] ? Colors.black : Colors.white),
                        ),
                        SizedBox(
                          width: screenWidth * 0.02,
                        ),
                        Container(
                          height: screenWidth * 0.15,
                          width: screenWidth * 0.009,
                          color: data['isDay'] ? Colors.black26 : Colors.white38,
                        ),
                        SizedBox(
                          width: screenWidth * 0.02,
                        ),
                        Text(
                          data['time'],
                          style: TextStyle(
                              fontFamily: 'WorldTimeFont',
                              fontSize: screenWidth * 0.12,
                              color: data['isDay'] ? Colors.black : Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 1),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: screenWidth * 0.2),
                child: GestureDetector(
                  onTap: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'selectedLocation': result['selectedLocation'],
                        'flag': result['flag'],
                        'time': result['time'],
                        'isDay': result['isDay'],
                      };
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                          // data['isDay'] ? Colors.green.shade200 : Colors.white,
                      shape: BoxShape.circle,
                    ),
                    height: screenWidth * 0.20,
                    width: screenWidth * 0.20,
                    child: Center(
                      child: Icon(
                        Icons.location_on,
                        size: screenWidth * 0.08,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
