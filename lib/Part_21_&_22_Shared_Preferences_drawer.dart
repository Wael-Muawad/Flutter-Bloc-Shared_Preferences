import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:third/Part_21_&_22_Shared_Preferences_login.dart';
import 'package:third/Part_21_&_22_Shared_Preferences_page1.dart';
import 'package:third/Part_21_&_22_Shared_Preferences_page2.dart';
import 'package:third/Part_21_&_22_Shared_Preferences_page3.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  Widget activePage = Page1();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Shared'),),

      body: activePage,

      drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                child: CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  child: Icon(Icons.home),
                ),
              ),

              Divider(color: Colors.deepOrange,),

              ListTile(
                leading: Icon(Icons.email),
                title: Text('Page1'),
                onTap: () {
                  setState(() {
                    activePage = Page1();
                    Navigator.pop(context);
                  });
                },
              ),

              Divider(color: Colors.deepOrange,),

              ListTile(
                leading: Icon(Icons.message),
                title: Text('Page2'),
                onTap: () {
                  setState(() {
                    activePage = Page2();
                    Navigator.pop(context);
                  });
                },
              ),

              Divider(color: Colors.deepOrange,),

              ListTile(
                leading: Icon(Icons.people),
                title: Text('Page3'),
                onTap: () {
                  setState(() {
                    activePage = Page3();
                    Navigator.pop(context);
                  });
                },
              ),

              Divider(color: Colors.deepOrange,),

              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () async {
                  final preference = await SharedPreferences.getInstance();
                  preference.remove('user');
                  preference.remove('pass');

                  setState(() {
                   // activePage = LoginPage(); Wrong
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                    //Navigator.pop(context); Wrong
                  });
                },
              ),

              Divider(color: Colors.deepOrange,),


            ],
          )
      ),

    );
  }
}
