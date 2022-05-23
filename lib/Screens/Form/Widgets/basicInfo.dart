import 'package:flutter/material.dart';
import 'package:fluttertest/Commons/colors.dart';
import 'package:fluttertest/Commons/images.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Commons/GetSize.dart';
import '../../../Commons/common_widgets.dart';
import '../../../Commons/fieldvalidator.dart';




class BasicInfoScreen extends StatefulWidget {
  GlobalKey? formkey;
   BasicInfoScreen(this.formkey,{Key? key}) : super(key: key);

  @override
  State<BasicInfoScreen> createState() => _BasicInfoScreenState();
}

class _BasicInfoScreenState extends State<BasicInfoScreen> {
  var SSpace = SizedBox(height: h.h2,);
  var MSpace = SizedBox(height: h.h5,);
  var HSpace = SizedBox(height: h.h10,);

  TextEditingController Emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController repeatpasscontroller = TextEditingController();
  TextEditingController nickcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
     Padding(
        padding:  EdgeInsets.symmetric(horizontal:w.w2),
        child:  SingleChildScrollView(
          child: Form(
            key: widget.formkey,
            child: Column(
              children: [

                appField( 'Email Address',
                    Emailcontroller,
                    TextInputType.text,

                    validator: validateEmail
                ),

                appField( 'Password',
                    passcontroller,
                    TextInputType.text,
                    obscureText: true,
                    validator: validatePassword,
                ),
                appField( 'Repeat Password',
                    repeatpasscontroller,

                    TextInputType.text,
                    obscureText: true,
                    validator: validatePassword,
                ),
                appField( 'Nick',
                    nickcontroller,
                    TextInputType.text,
                    validator: validNickName,),
                SSpace,




              ],
            ),
          ),
        ),

    );
  }



}
