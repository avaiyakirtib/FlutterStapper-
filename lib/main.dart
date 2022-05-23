import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Screens/Form/signup_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          )

      ),
      home:    SignupForm(),
    );
  }
}
