import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jasa_bantu/Settings/constant.dart';
import 'package:jasa_bantu/Settings/logicapi.dart';
import 'package:jasa_bantu/Settings/rotasi.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';
import 'package:otp_text_field/otp_field.dart';

AssetsColor assetsColor = AssetsColor();
LogicApi logicApi = LogicApi();

class InfoEmailUnregistered extends StatefulWidget {
  const InfoEmailUnregistered({super.key});

  @override
  State<InfoEmailUnregistered> createState() => _InfoEmailUnregisteredState();
}

class _InfoEmailUnregisteredState extends State<InfoEmailUnregistered> {
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
        title: const Text(
          'Atur Ulang',
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

            /// NUMBER TEXT
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                '+62 818*****673',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: assetsColor.textPrimary),
              ),
            ),

            /// TITLE TEXT
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Text(
                'Tidak ada email yang\n'
                'terdaftar di nomor HP kamu',
                textAlign: TextAlign.center,
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
                'Hubungi Layanan Konsumen dan kami\n'
                'siap membantu kamu',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: assetsColor.textBlack),
              ),
            ),

            Divider(
              thickness: 5,
              color: assetsColor.bgGrey200,
            ),

            /// INFORMATION
            Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  /// "INFORMATION" TITLE TEXT
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Text(
                      'Alur perubahan nomor HP',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: assetsColor.textBlack),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        /// 1
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: assetsColor.primaryColor,
                              ),
                              child: Text(
                                '1',
                                style: TextStyle(color: assetsColor.textWhite),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Kami akan memverifikasi data diri kamu',
                              style: TextStyle(color: assetsColor.hintText),
                            ),
                          ],
                        ),

                        /// 2
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: assetsColor.primaryColor,
                              ),
                              child: Text(
                                '2',
                                style: TextStyle(color: assetsColor.textWhite),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Mengisi form perubahan nomor handphone',
                              style: TextStyle(color: assetsColor.hintText),
                            ),
                          ],
                        ),

                        /// 3
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: assetsColor.primaryColor,
                              ),
                              child: Text(
                                '3',
                                style: TextStyle(color: assetsColor.textWhite),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Mengirimkan foto KTP kamu',
                              style: TextStyle(color: assetsColor.hintText),
                            ),
                          ],
                        ),

                        /// 4
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: assetsColor.primaryColor,
                              ),
                              child: Text(
                                '4',
                                style: TextStyle(color: assetsColor.textWhite),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Menunggu hasil maksimal 2x24 jam setelah\ndokumen diterima oleh tim kami',
                              maxLines: 2,
                              style: TextStyle(color: assetsColor.hintText),
                            ),
                          ],
                        ),
                        //
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(),
            ),

            /// "HUBUNGI LAYANAN KONSUMEN" BUTTON
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

                        rotatedText = Rotasi.rotateText(textRotate, 15);
                        data_nilai = base64Encode(utf8.encode(rotatedText));
                        print(data_nilai);
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
                        'Hubungi Layanan Konsumen',
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
