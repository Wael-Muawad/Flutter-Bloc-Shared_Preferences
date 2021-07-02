import 'package:flutter/material.dart';
import 'package:third/final_2.dart';
import 'package:third/final_3.dart';


void main() => runApp(MaterialApp(
  title: 'FINAL EXAM',
  home: HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> data = [];
  DBHelper helper;
  Future<void> insertCource() async {
    //helper.initioalaizedataBace();

    for (int i = 0; i < courses.length; i++) {
      Course c = courses[i];
      await helper.insertDate(c);
      setState(() {});
    }
  }

  getNewData() async {
    data = await helper.getAllDatta();
    setState(() {});
  }

  double sliderValue = 0;
  Course c = Course();
  List<Course> courses = [
    Course(id: 1, model: "Math", color: Colors.red, mark: 60),
    Course(id: 2, model: "software", color: Colors.green, mark: 40),
    Course(id: 3, model: "java", color: Colors.green, mark: 30),
  ];


  @override
  Widget build(BuildContext context) {
    getNewData();
    return ListView.builder(itemBuilder: (context, index) {
      if (data.length > 0) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '${data[index]['id']}',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${data[index]['model']}',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                width: 40,
                height: 10,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: data[index]['color']),
                ),
              ),
              Slider(
                divisions: 1,
                value: double.parse(courses[index].mark.toString()),
                label: sliderValue.toString(),
                min: 0,
                max: 100,
                onChanged: (value) {
                  setState(() {
                    sliderValue = value;
                  });
                },
              )
            ],
          ),
        );
      } else
        return null;
    });
  }
}