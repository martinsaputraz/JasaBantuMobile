import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/REGISTER/SettingPIN.dart';
import 'package:jasa_bantu/Settings/constant.dart';
import 'package:jasa_bantu/Settings/rotasi.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class InputName extends StatefulWidget {
  const InputName({super.key});

  @override
  State<InputName> createState() => _InputNameState();
}

class _InputNameState extends State<InputName> {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
  Constant constant = Constant();

  //
  /// FOR 'NAMA'
  final TextEditingController _inputName = TextEditingController();
  String? ID;

  String? storedNoHp;
  String rotatedText = "";
  String textRotate = "";
  String data_nilai = "";

  @override
  void initState() {
    // TODO: implement initState
    getStorageID();
    super.initState();
  }

  Future<void> getStorageID() async {
    // Retrieve the phone number (noHp) from secure storage
    ID = await secureStorage.read(key: 'ID');
    storedNoHp = await secureStorage.read(key: 'nomorHp');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          'Daftar',
          style: TextStyle(fontSize: 20, color: assetsColor.textBlack),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // /// LOGO JASA BANTU BG WHITE
          // Container(
          //   padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          //   child: Image.asset(
          //     'assets/logo/logo_jasabantu_bgwhite.jpg',
          //     width: 115,
          //     height: 25,
          //   ),
          // ),

          /// TITLE TEXT
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              'Masukkan Nama Lengkap Kamu Yuk',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: assetsColor.textBlack),
            ),
          ),

          // /// SUB TITLE TEXT
          // Container(
          //   padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
          //   child: Text(
          //     'Masukkan nomor handphone kamu dan pastikan nomor kamu benar dan aktif',
          //     style: TextStyle(
          //       fontSize: 15,
          //       color: assetsColor.textBlack,
          //     ),
          //   ),
          // ),

          /// "PHONE" TEXT FIELDS
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Center(
              child: TextField(
                controller: _inputName,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  labelText: 'Masukkan Nama Kamu',
                  prefixIcon: Icon(Icons.account_circle_outlined,
                      color: assetsColor.hintText),
                ),
              ),
            ),
          ),

          Expanded(
            child: Container(),
          ),

          /// BUTTON "LANJUTKAN"
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_inputName.text == "") {
                    print("HELO WORLD");
                  } else {
                    textRotate =
                        ID! + constant.delimeterRegistration + storedNoHp!;

                    rotatedText =
                        Rotasi.rotateText(textRotate, constant.ROT_NUM);
                    data_nilai = constant.PREFIX_KEY +
                        constant.ROT_NUM.toString() +
                        constant.backprefix +
                        base64Encode(utf8.encode(rotatedText));

                    // logicApi.setName(context, _inputName.text, data_nilai);
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingPIN()));
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
                      style:
                          TextStyle(color: assetsColor.textWhite, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
