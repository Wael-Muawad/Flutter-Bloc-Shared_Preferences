import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  double slider = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Text('Slider'),

            Slider(
                min:0,
                max: 100,
                divisions: 100-0,
                value: slider,
                onChanged: (value) {
                  slider = value;
                  setState(() {

                  });
                },
            ),
          ],
        ),
      ),
    );
  }
}
