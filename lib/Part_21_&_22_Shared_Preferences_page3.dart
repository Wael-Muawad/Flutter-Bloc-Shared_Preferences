import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  int counter;

  Future<void> getCounterValue() async {
    final preference = await SharedPreferences.getInstance();
    setState(() {
      counter = preference.getInt('counter') ?? 0;
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
    return Center(
      child: Text('$counter',style: TextStyle(fontSize: 200,color: Colors.deepOrange),),
    );
  }
}
