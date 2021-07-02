import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:third/Part_24_&_25_Bloc_enum_define.dart';
import 'package:third/Part_24_&_25_Bloc_multi_pages.dart';

void main() async {
  return runApp(BlocProvider(
    create: (context) => MyCounter(0),
    child: MaterialApp(
      title: 'BLOC Test',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: BLOC(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}

class BLOC extends StatefulWidget {
  @override
  _BLOCState createState() => _BLOCState();
}

class _BLOCState extends State<BLOC> {
  var txtstyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    MyCounter counter = BlocProvider.of<MyCounter>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('BLOC'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Page2(),
                  ));
            },
          ),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  counter.add(CounterEvent.decrement);
                },
                child: Text(
                  '-',
                  style: txtstyle,
                )),
            BlocBuilder<MyCounter, double>(
              builder: (context, state) {
                return Text(
                  '$state',
                  style: txtstyle,
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  counter.add(CounterEvent.increment);
                },
                child: Text(
                  '+',
                  style: txtstyle,
                )),
          ],
        ),
      ),
    );
  }
}
