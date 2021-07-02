import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
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
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            final preference = await SharedPreferences.getInstance();
            setState(() {
              counter++;
              preference.setInt('counter', counter);
            });
          },

          label: Icon(Icons.add),
      ) ,


      body: Center(
        child: Text('counter = $counter',style: TextStyle(fontSize: 100),),
      ),
    );
  }
}
