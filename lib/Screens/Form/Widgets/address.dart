import 'package:flutter/material.dart';


import '../../../Commons/GetSize.dart';
import '../../../Commons/common_widgets.dart';
import '../../../Commons/fieldvalidator.dart';




class AddressScreen extends StatefulWidget {
  GlobalKey? formkey;
   AddressScreen(this.formkey,{Key? key}) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
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
        child: Form(
          key: widget.formkey,
          child: Column(
            children: [
              appField( 'Address',
                addresscontroller,
                TextInputType.text,
              validator: validateAddress,
              ),
              appField( 'City',
                citycontroller,
                TextInputType.text,
              validator: validateCity
              ),
              appField( 'Postal code',

                postalcodepasscontroller,
                TextInputType.number,
              maxlength: 6,
              validator: validatePostal
              ),
              appField( 'Country',
                countrycontroller,
                TextInputType.text,
              validator: validateCountry
              ),
              appField( 'Province',
                provincecontroller,
                TextInputType.text,
              validator: validateProvince
              ),
            ],
          ),
        ),
    );
  }
}
