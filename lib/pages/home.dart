import 'package:flutter/material.dart';
import 'package:flutter_trials2/main.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      home: Scaffold(
        body: Center(
          child: Text('WELCOME BRO',style: TextStyle(fontSize: 15),),
        ),),
    );
  }
}
