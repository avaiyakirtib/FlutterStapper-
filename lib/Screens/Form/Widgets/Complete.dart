import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../Commons/GetSize.dart';
import '../../../Commons/common_widgets.dart';
import '../../../Commons/images.dart';



class CompleteScreen extends StatefulWidget {
  const CompleteScreen({Key? key}) : super(key: key);

  @override
  State<CompleteScreen> createState() => _CompleteScreenState();
}

class _CompleteScreenState extends State<CompleteScreen> {
  var SSpace = SizedBox(height: h.h2,);
  var MSpace = SizedBox(height: h.h5,);
  var HSpace = SizedBox(height: h.h10,);

  TextEditingController addresscontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController postalcodepasscontroller = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();
  TextEditingController provincecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(

        child: Stack(
          children: [
           Image.asset(success),
            Lottie.asset(succesanimations,height: h.h40,width: w.w100,repeat: false),
            SSpace,
          ],
        ),
    );
  }
}
