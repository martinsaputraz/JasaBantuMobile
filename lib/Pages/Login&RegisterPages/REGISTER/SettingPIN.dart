import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jasa_bantu/Settings/constant.dart';
import 'package:jasa_bantu/Settings/logicapi.dart';
import 'package:jasa_bantu/Settings/rotasi.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

AssetsColor assetsColor = AssetsColor();
LogicApi logicApi = LogicApi();

class SettingPIN extends StatefulWidget {
  const SettingPIN({super.key});

  @override
  State<SettingPIN> createState() => _SettingPINState();
}

class _SettingPINState extends State<SettingPIN> {
  //

  ///FOR 'OTP'
  OtpFieldController setPINController = OtpFieldController();
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  Constant constant = Constant();

  String? ID;

  String setPinSimpan = "";
  String rotatedText = "";
  String textRotate = "";
  String data_nilai = "";

  @override
  void initState() {
    getStorageID();
    super.initState();
  }

  Future<void> getStorageID() async {
    // Retrieve the phone number (noHp) from secure storage
    ID = await secureStorage.read(key: 'ID');
  }

  @override
  void dispose() {
    super.dispose();
  }

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
        title: const Text(
          'Atur PIN',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            /// ICON
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: assetsColor.primaryColor,
              ),
              child: Icon(
                Icons.password,
                size: 50,
                color: assetsColor.textWhite,
              ),
            ),

            /// TITLE TEXT
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Text(
                'Biar lebih aman buat PIN',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: assetsColor.textBlack),
              ),
            ),

            /// SUB TITLE TEXT
            Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
              child: Text(
                'PIN akan digunakan untuk hal penting seperti\n'
                'masuk ke akun, bertransaksi, dll',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: assetsColor.textBlack),
              ),
            ),

            /// OTP FIELD
            Container(
              margin: const EdgeInsets.fromLTRB(60, 0, 60, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  OTPTextField(
                    controller: setPINController,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 40,
                    fieldStyle: FieldStyle.box,
                    outlineBorderRadius: 5,
                    style: const TextStyle(fontSize: 15),
                    onChanged: (pin) {
                      if (pin.length == 6) {
                        setState(() {
                          setPinSimpan = pin;
                        });
                      } else {
                        print("heloworld");
                      }
                    },
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(),
            ),

            /// "SIMPAN PIN" BUTTON
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (setPinSimpan == "") {
                    } else {
                      setState(() {
                        textRotate = ID! +
                            constant.delimeterRegistration +
                            setPinSimpan!;

                        rotatedText =
                            Rotasi.rotateText(textRotate, constant.ROT_NUM);
                        data_nilai = constant.PREFIX_KEY +
                            constant.ROT_NUM.toString() +
                            constant.backprefix +
                            base64Encode(utf8.encode(rotatedText));
                      });

                      logicApi.setPIN(context, data_nilai);
                    }
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
                        'Simpan PIN'
                        // '& Selesai'
                        ,
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
      ),
    );
  }
}
