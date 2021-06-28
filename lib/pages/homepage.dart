import 'package:flutter/material.dart';
import 'package:flutter_particles/particles.dart';
import 'package:glassmorphism/glassmorphism.dart';

class WHome extends StatefulWidget {
  @override
  _WHomeState createState() => _WHomeState();
}

class _WHomeState extends State<WHome> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    return Scaffold(
        backgroundColor: data['isDaytime'] ? Colors.white38 : Colors.grey[850],
        body: Stack(children: [
          Particles(100, data['isDaytime'] ? Colors.blue[100] : Colors.grey),
          Center(
              child: GlassmorphicContainer(
            width: 450,
            height: 600,
            borderRadius: 20,
            blur: data['isDaytime'] ? 60 : 10,
            border: .5,
            borderGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                data['isDaytime']
                    ? Colors.grey[400]
                    : Color(0xFFffffff).withOpacity(0.5),
                data['isDaytime']
                    ? Colors.grey[200]
                    : Color(0xFFFFFFFF).withOpacity(0.5)
              ],
            ),
            linearGradient: null,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(96, 64, 96, 36),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/loc');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime']
                        };
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.edit_location),
                        Text(
                          'EDIT LOCATION',
                          style: TextStyle(letterSpacing: 5),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(fontSize: 30, letterSpacing: 3.5),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(data['time'], style: TextStyle(fontSize: 50)),
                  SizedBox(
                    height: 20,
                  ),
                  Icon(
                    data['isDaytime'] ? Icons.wb_sunny : Icons.nights_stay,
                    color: Colors.amber[400],
                    size: 36,
                  ),

                  //IconButton(
                  //    alignment: Alignment.center,
                  //    icon: Icon(
                  //      Icons.arrow_back_ios_rounded,
                  //      size: 48,
                  //    ),
                  //    onPressed: () {})
                ],
              ),
            ),
          ))
        ]));
  }
}
