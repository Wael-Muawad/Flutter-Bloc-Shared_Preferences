import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:third/Part_21_&_22_Shared_Preferences_drawer.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var txtstyle = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String userName = 'wael@gmail.com';
  String password = '123456';
  String txterror = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            circularAvatar(radius: 70),

            SizedBox(height: 50,),

            txtField(
              txt: 'User Name',
              controller: userController,
              obscureText: false,
              width: 10
            ),

            SizedBox(height: 30,),

            txtField(
              txt: 'Password',
              controller: passController,
              obscureText: true,
              width: 20
            ),

            SizedBox(height: 30,),

            loginButton(
              txt: 'Login',
              size: size,
              press: () async {
                if(userController.text == userName){

                  if(passController.text == password){

                  final preference = await SharedPreferences.getInstance();
                  preference.setString('user', userController.text);
                  preference.setString('pass', passController.text);

                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DrawerPage(),));
                  }

                  else{
                    setState(() {
                      txterror = 'Wrong password!';
                    });
                  }

                }

                else {
                  setState(() {
                    txterror = 'You don\'t have an account';
                  });
                }

              },
            ),

            SizedBox(height: 30,),

            
            Text(txterror,style: txtstyle,),

          ],
        ),
      ))
    );
  }

  Widget txtField(
      {String txt, bool obscureText, TextEditingController controller, double width}) {
    return Row(
      children: [
        Text(txt, style: txtstyle),
        SizedBox(
          width: width,
        ),
        Expanded(
            child: TextField(
          keyboardType: TextInputType.name,
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(90)),
            labelText: txt,
          ),
        ))
      ],
    );
  }

  Widget circularAvatar({double radius}) {
    return CircleAvatar(
      backgroundColor: Colors.orange,
      radius: radius,
    );
  }

  Widget loginButton({String txt, Function press, Size size}) {
    return Container(
      width: size.width * 0.5,
      height: 60,
      child: ElevatedButton(
        onPressed: press,
        child: Text(
          txt,
          style: txtstyle,
        ),
      ),
    );
  }
}
