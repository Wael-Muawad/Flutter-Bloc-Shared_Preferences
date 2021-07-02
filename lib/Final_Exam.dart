import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
    title: 'Dehello',
    theme: ThemeData(primarySwatch: Colors.deepPurple),
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ////////////////////////////////////
  var txtstyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  ////////////////////////////////////
  TextEditingController controller = TextEditingController();
  ////////////////////////////////////
  int radioIndex = 0;
  var radioList = ['Male', 'Female'];
  ////////////////////////////////////
  double slider = 0;
  ////////////////////////////////////
  var dropDownList = ['Twjihi', 'Bachelor', 'Master', 'PhD'];
  String dropDownChoice = 'Bachelor';
  ////////////////////////////////////
  //Navigator.push(
  // context,
  // MaterialPageRoute(builder: (context) => SecondScreen(),));
  ////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            child: Text(''),
            onPressed: () {
              DisplayMyDialog(
                  MyTitle: Text('Are You Sure About That'),
                  MyContent: Text('Do You Want To Save The Game'),
                  Pos: 'Yes',
                  Nig: 'NO',
                  context: context);
            },
          )
        ],
      ),);
  }

  Widget circleAvatar() {
    return CircleAvatar(
      backgroundImage: AssetImage('assets/images/image2.jpg',),
      maxRadius: 45,
    );
  }

  Widget txtField({String label, TextEditingController controller}) {
    return Row(
      children: [
        Text('Weight', style: txtstyle,),
        SizedBox(width: 20,),
        Expanded(
            child:
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(90)),
                  labelText: label
              ),
              onChanged: (value) {
                setState(() {
                  //weight = double.parse(value);
                });
              },
            )
        )
      ],
    );
  }

  Widget sliderFunction() {
    return Row(
      children: [
        Text('age',style: txtstyle,),
        Slider(
          value: slider,
          label: slider.toString(),
          min: 0,
          max: 100,
          divisions: 100-0,
          activeColor: Colors.blue,

          onChanged: (value) {
            setState(() {
              slider = value;
            });
          },
        ),

        Text(slider.toString()),
      ],
    );
  }


  Widget radioLisRow() {
    return Row(
      children: [
        Text('Gender', style: txtstyle,),
        Expanded(child: radioListTile(0),),
        Expanded(child: radioListTile(1),),
      ],
    );
  }
  Widget radioListTile(int value) {
    return
      RadioListTile(
        value: value,
        title: Text('${radioList[value]}',),
        activeColor: Colors.lightBlue,
        groupValue: radioIndex,
        onChanged: (value) {
          setState(() {
            radioIndex = value;
          });
        },
      );
  }

  Widget dropDownlist() {
    return Row(
      children: [
        Text('Fit',style: txtstyle,),
        SizedBox(width: 100,),
        DropdownButton(
          items: dropDownList.map((str) {
            return DropdownMenuItem(
              child: Text(str,style: txtstyle,),
              value: str,
            );
          }
          ).toList(),

          value: dropDownChoice,
          icon: Icon(Icons.arrow_drop_down_circle,
            color: Colors.blueAccent,),
          iconSize: 30,
          dropdownColor: Colors.blueGrey,
          underline: Container(height: 2,color: Colors.green,),
          onChanged: (value) {
            setState(() {
              dropDownChoice = value;
            });
          },
        )
      ],
    );
  }

  Widget ships(String img, Color color, String label, double radius) {
    return Chip(
        avatar: CircleAvatar(
          backgroundImage: AssetImage(img),
          radius: radius,

        ),
        backgroundColor: color,


        label: Text(label,style: txtstyle,));

  }




















  void DisplayMyDialog({BuildContext context,
    Widget MyTitle,
    Widget MyContent,
    String Pos,
    String Nig}) {
    var dialog = AlertDialog(
      title: MyTitle,
      content: MyContent,
      actions: [
        ElevatedButton(
          child: Text(Pos),
          onPressed: () {
            print('The $Pos has been done');
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: Text(Nig),
          onPressed: () {
            print('');
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }


}


class Post {
  Icon icon;
  String name, date, msg;

  Post({this.icon, this.name, this.date, this.msg});
}