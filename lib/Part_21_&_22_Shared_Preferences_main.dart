import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:third/Part_21_&_22_Shared_Preferences_drawer.dart';
import 'package:third/Part_21_&_22_Shared_Preferences_login.dart';

void main() async {
  return runApp(MaterialApp(
    title: 'Shared Preferences',
    theme: ThemeData(primarySwatch: Colors.deepOrange),
    home: (await checkCredential()) ? DrawerPage() : LoginPage() ,
    debugShowCheckedModeBanner: false,
  ));
}

Future<bool> checkCredential() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preference = await SharedPreferences.getInstance();
  if (preference.containsKey('user')){
    return true;
  }
  else {
    return false;
  }
}