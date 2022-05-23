import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'GetSize.dart';
import 'colors.dart';




Widget appField(
    String hint,
    TextEditingController controller,
    TextInputType type,

    {
      bool enabled = true,
      bool obscureText = false,
      Widget? last,
      IconData? icon,
      IconData? surfix,
      Function()? surfixTap,
      Function()? boxTap,
      double? width,
      String? Function(String?)? validator
    }) {
  return Column(
    children: [
      TextFormField(

        cursorColor:appcolor,
        obscureText: obscureText,
        enabled: enabled,

        style:  GoogleFonts.poppins(
          textStyle: const TextStyle(color:black,fontWeight: FontWeight.w600),
        ),

        decoration: InputDecoration(


          contentPadding:  EdgeInsets.only(left: w.w8),
          errorStyle:  TextStyle(
            fontSize:sp.sp10,
          ),
          suffixIcon: InkWell(onTap: surfixTap, child: Icon(surfix)),
          border:  const OutlineInputBorder(
            borderSide: BorderSide(

            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),

            borderSide:  BorderSide(
                color: appcolor,
                width: h.h1-6.5
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide:  BorderSide(
              color: grey.withOpacity(0.2),

            ),
          ),
          hintText: hint,

          hintStyle:  GoogleFonts.poppins(
            textStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),
          ),
        ),
        controller: controller,
        keyboardType: type,
        validator: validator,
      ),
      SizedBox(
        height: h.h2+5,
      )
    ],

  );
}




Widget socialButton (BuildContext context,Color iconcolor,Color color,String Lable,String Icon,Function? OnPress){
  return Column(
    children: [
      InkWell(
        onTap: (){
          OnPress;
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: h.h6,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5)


          ),
          child: Row (
            children: [
              Container(

                  decoration: BoxDecoration(
                    color: iconcolor,
                    borderRadius: BorderRadius.circular(5),

                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(h.h1+5),
                    child: Image.asset(Icon),
                  )),

              Expanded(child: Container(child: Center(child: Text(Lable,style:GoogleFonts.poppins(
                textStyle: TextStyle(color: white,
                    fontSize: sp.sp10,

                    fontWeight: FontWeight.w600),
              )
              ))))

            ],
          )
        ),
      ),
      SizedBox(
        height: h.h2+5,
      )
    ],
  );
}