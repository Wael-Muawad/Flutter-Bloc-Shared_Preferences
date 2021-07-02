import 'dart:html';

import 'package:flutter/material.dart';

class DrawePage extends StatefulWidget {
  @override
  _DrawePageState createState() => _DrawePageState();
}

class _DrawePageState extends State<DrawePage> {
   Widget ActivePage;// =  Page1();
   var txtstyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DrawerApp'),
      ),
      body: ActivePage,
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/image4.jpg'),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi Guest',
                            style: txtstyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                AssetImage('assets/images/image6.jpg'),
                                radius: 12,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text('Jordan'),
                            ],
                          ),
                        ],
                      ),
                      Icon(
                        Icons.settings_outlined,
                        size: 30,
                      ),
                    ],
                  )
                ],
              ),
            ),

            Divider(height: 10,color: Colors.blueGrey,),

            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text('Home'),
              onTap: () {
                setState(() {
                 // ActivePage = Page1();
                  Navigator.pop(context);
                });
              },
            ),

            ListTile(
              leading: Icon(Icons.list_alt_outlined),
              title: Text('Your Order'),
              onTap: () {
                setState(() {
                 // ActivePage = Page2();
                  Navigator.pop(context);
                });
              },
            ),

            ListTile(
              leading: Icon(Icons.local_offer_outlined),
              title: Text('Offers'),
              onTap: () {
                setState(() {
                 // ActivePage = Page3();
                  Navigator.pop(context);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerHeader(){
    return DrawerHeader(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/image4.jpg'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi Guest',
                    style: txtstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                        AssetImage('assets/images/image6.jpg'),
                        radius: 12,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text('Jordan'),
                    ],
                  ),
                ],
              ),
              Icon(
                Icons.settings_outlined,
                size: 30,
              ),
            ],
          )
        ],
      ),
    );
  }
}
