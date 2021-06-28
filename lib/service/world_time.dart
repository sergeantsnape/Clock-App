import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  //

  String location; //loc name
  String time; //time in loc

  String url;
  bool isDaytime;

  WorldTime({this.location, this.url});

  Future<void> getTime() async {
    try {
      String url_final = "http://worldtimeapi.org/api/timezone/$url";
      Response response = await get(Uri.parse(url_final));
      Map data = jsonDecode(response.body);

      //get properties
      String datetime = data['datetime'];
      String offset = data['utc_offset'];

      //create DateTime object
      DateTime now = DateTime.parse(datetime);

      if (offset[0] == '+') {
        now = now.add(Duration(
            hours: int.parse(offset.substring(1, 3)),
            minutes: int.parse(offset.substring(4, 6))));
      } else {
        now.subtract(Duration(
            hours: int.parse(offset.substring(1, 3)),
            minutes: int.parse(offset.substring(4, 6))));
      }

      isDaytime = now.hour > 6 && now.hour < 19 ? true : false;

      time = DateFormat.jm().format(now);
    } catch (e) {
      time = 'Server Error';
    }
  }
}
