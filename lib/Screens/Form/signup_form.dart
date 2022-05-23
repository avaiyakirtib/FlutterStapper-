import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertest/Commons/GetSize.dart';
import 'package:fluttertest/Commons/colors.dart';
import 'package:fluttertest/Commons/common_widgets.dart';
import 'package:fluttertest/Commons/images.dart';
import 'package:fluttertest/Screens/Form/Widgets/Complete.dart';
import 'package:fluttertest/Screens/Form/Widgets/address.dart';
import 'package:fluttertest/Screens/Form/Widgets/basicInfo.dart';
import 'package:fluttertest/steepper/src/first_stepper/icon_stepper.dart';
import 'package:fluttertest/steepper/src/first_stepper/number_stepper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:toast/toast.dart';


class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

List<GlobalKey<FormState>> formKeys = [
  GlobalKey<FormState>(),
  GlobalKey<FormState>(),
];

class _SignupFormState extends State<SignupForm> {
  int activeStep = 0;
  bool isLoad=false;

  var sSpace = SizedBox(height: h.h1 + 5,);
  var mSpace = SizedBox(height: h.h2+5,);
  var hSpace = SizedBox(height: h.h10,);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Column(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(w.w16,h.h2,w.w16,h.h1,),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      child: Text("Sign Up",style:GoogleFonts.poppins(
                        textStyle: TextStyle(color: black,
                            fontSize: sp.sp16,
                            fontWeight: FontWeight.bold
                        ),),)),
                )),
            NumberStepper(
              numbers: [
                1, 2, 3
              ],
              activeStep: activeStep,
              unactiveStepBorderColor: grey,
              stepColor: white,
              activeStepBorderColor: appcolor,
              activeStepColor: white,
              activeStepBorderWidth: 1.5,
              lineColor: grey,
              onStepReached: (index) {
                setState(() {
                  activeStep = index;
                });
              },
            ),

            Expanded(
                child:
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.all(h.h4),
                    child: Column(
                      children: [
                        activeStep == 0 ?
                        BasicInfoScreen(formKeys[0]) : activeStep == 1
                            ? AddressScreen(formKeys[1])
                            : const CompleteScreen(),
                        authButton(),
                        activeStep == 0 ?
                        Column(children: [
                          sSpace,
                          or(),
                          sSpace,
                          socialButton(context, deepgooglecolor, googlecolor,
                              "Continue with Google", google, () {}),
                          socialButton(context, deepfbcolor, fbcolor,
                              "Continue with Facebook", fb, () {}),
                          mSpace,
                          authfooter()
                        ],) : const SizedBox.shrink()
                      ],
                    ),
                  ),
                )
            ),
          ],
        )
      ),
    );
  }


  Widget authButton() {
    return SizedBox(
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: ElevatedButton(
        onPressed: () {
          if (formKeys[activeStep]
              .currentState!
              .validate()) {
              if(activeStep<2){
                setState(() {
                  activeStep++;
                });
              }
          }
        },
        style: ElevatedButton.styleFrom(
          primary: appcolor,
          padding: EdgeInsets.symmetric(vertical: h.h1 + 3.5),
          textStyle: GoogleFonts.poppins(
            textStyle: TextStyle(color: appcolor,
                fontSize: sp.sp12,
                fontWeight: FontWeight.w600),
          ),),
        child:Text( activeStep == 2 ?"Verify Email":"Next" )
      ),
    );
  }

  Row or() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            width: w.w35,
            child: Divider(color: grey,)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("or", style: GoogleFonts.poppins(
            textStyle: TextStyle(color: grey,
              fontSize: sp.sp12,
            ),
          )),
        ),
        SizedBox(
            width: w.w35,
            child: const Divider(color: Colors.grey)),
      ],
    );
  }

  // Bottom footer common method
  Text authfooter() {
    return const Text.rich(
      TextSpan(
        children: [
          TextSpan(text: "Already have an account? ",
            style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),),
          TextSpan(
            text: 'Sign In',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: appcolor, letterSpacing: 1),
          ),
        ],
      ),
    );
  }
}
