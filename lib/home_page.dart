// ignore_for_file: avoid_unnecessary_containers, unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/auth.dart';
import 'package:weatherapp/getlocation.dart';
import 'package:weatherapp/weatherData.dart';

var dayInfo = DateTime.now();
var dateFormat = DateFormat("EEEE, MMM d , yyyy").format(dayInfo);

class MyHomPage extends StatelessWidget {
  var client = WeatherData();
  var data;

  info() async {
    //var position =await GetPosition();
    data = await client.getData('21.00', '105.68');
    return data;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: FutureBuilder(
      future: info(),
      builder: ((context, snapshot) {
        return Container(
          child: Column(
            children: [
              IconButton(
                  color: Colors.red,
                  onPressed: () {
                    Auth().signOut();
                  },
                  icon: Icon(Icons.logout)),
              Container(
                height: size.height * 0.75,
                width: size.width,
                padding: EdgeInsets.only(top: 30),
                margin: EdgeInsets.only(right: 10, left: 10),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(40),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff955cd1),
                        Color(0xff3fa2fa),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.2, 0.8],
                    )),
                child: Column(
                  children: [
                    Text(
                      '${data?.cityName}',
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 35,
                          fontFamily: 'MavenPro'),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Text(
                      dateFormat,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 15,
                          fontFamily: 'MavenPro'),
                    ),
                    // Image.asset(
                    // 'C:\Apps\Flutter\weatherapp\assets\img\storm.png',
                    // width: size.width * 0.4,
                    // ),
                    Image.network(
                      'http:${data?.icon}',
                      width: size.width * 0.3,
                      fit: BoxFit.fill,
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${data?.condition}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Hubballi'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${data?.temp}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 75,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Hubballi'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/img/wind.png',
                                width: size.width * 0.15,
                              ),
                              Text(
                                '${data?.wind} km/h',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Hubballi',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Wind',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontFamily: 'MavenPro',
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/img/water.png',
                                width: size.width * 0.15,
                              ),
                              Text(
                                '${data?.humidity} %',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Hubballi',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Humidity',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontFamily: 'MavenPro',
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/img/humidity.png',
                                width: size.width * 0.2,
                              ),
                              Text(
                                '${data?.wind_dir}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Hubballi',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Wind Direction',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.6),
                                  fontFamily: 'MavenPro',
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        'Gust',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: 'MavenPro',
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${data?.gust} km/h',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: 'Hubballi',
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Pressure',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: 'MavenPro',
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${data?.pressure} hpa',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: 'Hubballi',
                          fontSize: 25,
                        ),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        'UV',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: 'MavenPro',
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${data?.uv}',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: 'Hubballi',
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Precipitation',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: 'MavenPro',
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${data?.pricipe} mm',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: 'Hubballi',
                          fontSize: 25,
                        ),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        'Wind',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: 'MavenPro',
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${data?.wind} km/h',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Hubballi',
                          fontSize: 25,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Last Update',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontFamily: 'MavenPro',
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${data?.last_update}',
                        style: TextStyle(
                          color: Colors.green,
                          fontFamily: 'Hubballi',
                          fontSize: 17,
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ],
          ),
        );
      }),
    ));
  }
}
