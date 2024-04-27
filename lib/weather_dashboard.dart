import 'package:flutter/material.dart';

import 'custom_data_wiget/custom_bottom_oval.dart';

class weatherDashboard extends StatelessWidget {
  final String tempC, country, place;
  final String localtime, condition;
  final String humidity;
  final String uv, wind, weathericon;
  const weatherDashboard({
    super.key,
    required this.place,
    required this.country,
    required this.tempC,
    required this.localtime,
    required this.humidity,
    required this.uv,
    required this.wind,
    required this.condition,
    required this.weathericon,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = [
      {
        "icon": Icons.wind_power_outlined,
        "title": "Wind",
        "value": '$wind km/h',
      },
      {
        "icon": Icons.sunny,
        "title": "Index UV",
        "value": '$uv ',
      },
      {
        "icon": Icons.thermostat,
        "title": "Temperature",
        "value": '$tempC\u00B0C',
      },
      {
        "icon": Icons.water_drop_outlined,
        "title": "Humidity",
        "value": '$humidity%',
      },
    ];

    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.menu,
        //   ),
        //   onPressed: () {},
        // ),
        title: Text("$place,$country"),
        centerTitle: true,
        elevation: 0,
        foregroundColor: Colors.black87,
        backgroundColor: Color.fromARGB(255, 241, 238, 225),

        actions: [
          IconButton(
            onPressed: (() {}),
            icon: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
      body: Container(
        color: Color.fromARGB(255, 241, 238, 225),
        child: Column(
          children: [
            Text(
              " $localtime",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                // fontSize: 16,
                color: Colors.black87,
              ),
            ),
            Container(
              // height: _height * 0.35,
              width: _width,
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),

              child: Column(
                children: [
                  Image.network(
                    "https:$weathericon",
                    height: 110,
                    semanticLabel: "Weather icon",
                  ),
                  Container(
                      child: Text(
                    '$tempC\u00B0',
                    // "25",
                    style: TextStyle(
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )),
                  Text(
                    "$condition",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     customBottonOval(
            //         icon: Icons.thermostat, wind: "24", title: "Latitude"),
            //     customBottonOval(
            //         icon: Icons.thermostat, wind: "35", title: "Temperature F")
            //   ],
            // ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2,
                ),
                itemBuilder: ((context, index) {
                  return customBottonOval(
                      icon: data[index]["icon"],
                      wind: data[index]["value"],
                      title: data[index]["title"]);
                }),
                itemCount: data.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
