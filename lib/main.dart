import 'package:flutter/material.dart';
import 'package:patterns_getx/pages/Update_page.dart';
import 'package:patterns_getx/pages/create_page.dart';
import 'package:patterns_getx/pages/home_page.dart';
import 'package:patterns_getx/services/di_service.dart';

void main() async{
   await DIService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomePage(),
      routes: {
        HomePage.id : (context) => HomePage(),
        UpdatePage.id : (context) => UpdatePage(),
        CreatePage.id : (context) => CreatePage(),
      },
    );
  }
}

