import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/FORGET_PIN/OTPPagesFP.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class ForgetPIN extends StatefulWidget {
  const ForgetPIN({super.key});

  @override
  State<ForgetPIN> createState() => _ForgetPINState();
}

class _ForgetPINState extends State<ForgetPIN> {
  //
  /// FOR 'NOMOR HANDPHONE'
  final TextEditingController _phoneNumberFP = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: assetsColor.bgLightMode,
      appBar: AppBar(
        backgroundColor: assetsColor.bgLightMode,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: assetsColor.textBlack),
        ),
        title: Text(
          'Lupa PIN',
          style: TextStyle(fontSize: 20, color: assetsColor.textBlack),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TITLE TEXT
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              'Masukkan nomor HP Kamu',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: assetsColor.textBlack),
            ),
          ),

          /// "PHONE" TEXT FIELDS
          Container(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Nomor Handphone',
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  prefixIcon: Icon(Icons.phone, color: assetsColor.hintText),
                ),
                initialCountryCode: 'ID',
                // Set the initial country code to Indonesia
                // Limit selection to Indonesia
                onChanged: (phone) {
                  setState(() {
                    // phoneNumberLogin = phone.completeNumber;
                  });
                },
                inputFormatters: const [],
              ),
            ),
          ),

          Expanded(
            child: Container(),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// BUTTON "LANJUTKAN"
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OTPPagesFP()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: assetsColor.buttonPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Lanjutkan',
                          style: TextStyle(
                              color: assetsColor.textWhite, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
