import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.wifi_off_rounded,
                size: isPortrait ? size.width * 0.3 : size.height * 0.3,
                color: Colors.black,
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                'Network Issues',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isPortrait ? size.width * 0.07 : size.height * 0.07,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                'Either offline or low internet speed.\nPlease check your network settings.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isPortrait ? size.width * 0.045 : size.height * 0.045,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
