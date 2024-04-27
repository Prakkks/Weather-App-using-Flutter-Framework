import 'package:flutter/material.dart';

class customBottonOval extends StatelessWidget {
  final IconData icon;
  final String wind;
  final String title;
  const customBottonOval(
      {super.key, required this.icon, required this.wind, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1, vertical: 20),
      // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color.fromARGB(255, 209, 183, 111),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.w300),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '$wind ',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }
}
