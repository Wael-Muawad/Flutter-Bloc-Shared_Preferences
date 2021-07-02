import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  int counter = 0;

  Future<void> getCounterValue() async {
    final preference = await SharedPreferences.getInstance();
    counter = preference.getInt('counter') ?? 0;
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCounterValue();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(100),
        color: (counter > 10)? Colors.pinkAccent: Colors.blueAccent,
      ),
    );
  }
}
