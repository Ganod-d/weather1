import 'dart:async';

import 'package:weatherapp/auth_tree.dart';
import 'package:weatherapp/login.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
        Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Auth_tree(),
                    ),
                  );
     });
    return Scaffold(   
      backgroundColor: Color.fromARGB(204, 65, 174, 255),
      body: const Center( 
        child: Image(image: AssetImage('assets/img/weather-app.png')),
        // child: Text(
          //   'Weather App',
          //   style: TextStyle(
          //     color: Colors.white,
          //     fontSize: 80,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
      ),
    );
  }
}