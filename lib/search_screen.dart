import 'package:flutter/material.dart';

import 'package:weather/custom_wiget/custom_textformfield.dart';
import 'package:weather/dashboard.dart';

class searchScreen extends StatelessWidget {
  const searchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchcontroller = TextEditingController();

    final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            child: Form(
              key: _formkey,
              child: customTextFormField(
                  controller: _searchcontroller,
                  label: "Enter City Name",
                  validator: (value) {
                    if (value == null) {
                      return '  Fill this section first to search';
                    } else if (value.isEmpty) {
                      return '  Fill this section first to search';
                    } else {
                      return null;
                    }
                  }),
            ),
          ),
          MaterialButton(
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) =>
                      dashboard(cityname: '${_searchcontroller.text} ')),
                ));
              }
            },
            color: Colors.brown.shade200,
            child: const Text(" Search "),
          )
        ],
      )),
    );
  }
}
