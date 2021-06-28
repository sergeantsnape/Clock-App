import 'package:basics/service/world_time.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class LocCard extends StatefulWidget {
  @override
  _LocCardState createState() => _LocCardState();
}

class _LocCardState extends State<LocCard> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi'),
    WorldTime(url: 'America/Chicago', location: 'Chicago'),
    WorldTime(url: 'America/New_York', location: 'New York'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: 450,
      height: 600,
      borderRadius: 20,
      blur: 20,
      border: .5,
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFffffff).withOpacity(0.5),
          Color((0xFFFFFFFF)).withOpacity(0.5),
        ],
      ),
      linearGradient: null,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(96, 64, 96, 36),
          child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.transparent,
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Center(
                    child: Text(
                      locations[index].location,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
