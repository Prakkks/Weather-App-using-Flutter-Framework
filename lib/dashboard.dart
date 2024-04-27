import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/model/constant.dart';
import 'package:weather/model/notes.dart';

import 'package:weather/weather_dashboard.dart';

class dashboard extends StatefulWidget {
  final String cityname;

  dashboard({
    super.key,
    required this.cityname,
  }) {}

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  Future<notes> fetchnote() async {
    // final Map<String, dynamic> param = {
    //   // "key": "1bc0383d81444b58b1432929200711",
    //   "q": widget.cityname,
    // };

    try {
      final _dio = Dio();

      final _res = await _dio.get(constant.url, queryParameters: {
        "key": "1bc0383d81444b58b1432929200711",
        "q": widget.cityname,
      });
      final _temp = Map<String, dynamic>.from(_res.data);
      final _formattedData = notes.fromJson(_temp);
      return _formattedData;
    } on DioError catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    } finally {
     
    }
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 241, 238, 225),
        child: FutureBuilder<notes>(
          future: fetchnote(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.none) {
              return Center(child: CupertinoActivityIndicator());
            } else if (snapshot.connectionState == ConnectionState.active ||
                snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData && snapshot.data != null) {
                return weatherDashboard(
                  tempC: snapshot.data!.tempC.toString(),
                  localtime: snapshot.data!.localtime,
                  humidity: snapshot.data!.humidity.toString(),
                  uv: snapshot.data!.uv.toString(),
                  wind: snapshot.data!.windKMH.toString(),
                  condition: snapshot.data!.condition,
                  weathericon: snapshot.data!.weatherimg,
                  place: snapshot.data!.name,
                  country: snapshot.data!.country,
                );
              } else {
                return Center(
                  child: Text(
                    "Error occured! ",
                    style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade900,
                    ),
                  ),
                );
              }
            } else {
              return Text("error encountered!");
            }
          }),
        ),
      ),
    );
  }
}
