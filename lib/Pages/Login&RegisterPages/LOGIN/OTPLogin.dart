import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/LOGIN/PINLogin.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/REGISTER/ModalBottomOTPContent.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/ResendOTPButtonFunction.dart';
import 'package:jasa_bantu/Settings/Languange.dart';
import 'package:jasa_bantu/Settings/constant.dart';
import 'package:jasa_bantu/Settings/logicapi.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';
import 'package:jasa_bantu/local_database/model_share_prefrences.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

AssetsColor assetsColor = AssetsColor();

class OTPLogin extends StatefulWidget {
  const OTPLogin({super.key});

  @override
  State<OTPLogin> createState() => _OTPLoginState();
}

Constant constant = Constant();
LogicApi logicApi = LogicApi();
ModelSharePreferences modelSharePreferences = ModelSharePreferences();

class _OTPLoginState extends State<OTPLogin> {
  //

  String? storedNoHp;
  String rotatedText = "";
  String textRotate = "";
  String data_nilai = "";
  String process = "";

  ///FOR 'OTP'
  OtpFieldController otpLoginController = OtpFieldController();
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
  final FlutterLocalization _localization = FlutterLocalization.instance;

  /// FOR BUTTON "RESEND OTP"
  bool isResendOTPPressed = false;

  /// TIMER "RESEND OTP"
  late DateTime endTime;
  late Timer timer;

  /// FOR SELECTED METHOD "RESEND OTP SMS / WA"
  String selectedMethod = '';
  bool selectedRadioMethod = false;

  /// FOR BUTTON PILIHAN "METODE PENGIRIMAN OTP"
  bool sendOTPViaSMS = false;
  bool sendOTPViaWhatsApp = false;

  String? bahasa;
  bool bahasatrigger = true;

  String tombolWa = "";
  String tombolSMS = "";

  @override
  void initState() {
    modelSharePreferences.dataShareprefrences().then((data) {
      setState(() {
        // Ambil nilai dari SharePreferences

        String tombolWa = data['tombolWhatsapp'] ?? 'false';
        String tombolSMS = data['tombolSMS'] ?? 'false';

        // Periksa dan atur variabel sendOTPViaSMS dan sendOTPViaWhatsApp
        sendOTPViaSMS = tombolSMS == 'true';
        sendOTPViaWhatsApp = tombolWa ==
            'true'; // Jika 'true' maka EN akan true, jika 'false' maka EN akan false

        bahasa = data['bahasa'] ?? 'id';

        if (bahasa == "id") {
          _localization.translate('id');
          bahasatrigger = true;
        } else if (bahasa == "en") {
          _localization.translate('en');
          bahasatrigger = false;
        } else {
          _localization.translate('id');
          bahasatrigger = true;
        }
      });
    });

    _localization.init(
      mapLocales: [
        const MapLocale(
          'id',
          Bahasa.ID,
        ),
        const MapLocale(
          'en',
          Bahasa.EN,
        ),
      ],
      initLanguageCode: 'id',
    );
    _localization.onTranslatedLanguage = _onTranslatedLanguage;

    getStoredNoHp();

    modelSharePreferences.dataShareprefrences().then((data) {
      setState(() {
        process = data['process_steps']!;
      });
    });

    // Set waktu akhir, contoh 1 menit dari waktu sekarang
    endTime = DateTime.now().add(const Duration(minutes: 1));

    // Mulai timer mundur
    timer = Timer.periodic(const Duration(seconds: 0), (Timer t) {
      setState(() {});
    });
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  Future<void> getStoredNoHp() async {
    // Retrieve the phone number (noHp) from secure storage
    String? noHp = await secureStorage.read(key: 'nomorHp');

    setState(() {
      storedNoHp = noHp;
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void dispose() {
    // Hentikan timer saat widget di-dispose
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Duration remainingTime = endTime.difference(DateTime.now());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: assetsColor.bgLightMode,
      appBar: AppBar(
        backgroundColor: assetsColor.bgLightMode,
        title: Text(
          bahasatrigger
              ? Bahasa.ID['APPVERIFIKASI']
              : Bahasa.EN['APPVERIFIKASI'],
          style: TextStyle(fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const PINLogin()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: assetsColor.buttonWhite,
                side: BorderSide(color: assetsColor.borderDefault),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              icon:
                  Icon(Icons.live_help_outlined, color: assetsColor.textBlack),
              label: Text(
                bahasatrigger
                    ? Bahasa.ID['TOMBOLBANTUAN']
                    : Bahasa.EN['TOMBOLBANTUAN'],
                style: TextStyle(color: assetsColor.textBlack),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            /// TITLE TEXT
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Text(
                bahasatrigger
                    ? Bahasa.ID['TeksVerifikasi1']
                    : Bahasa.EN['TeksVerifikasi1'],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: assetsColor.textBlack),
              ),
            ),

            /// SUB TITLE TEXT
            Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Text(
                bahasatrigger
                    ? Bahasa.ID['TeksVerifikasi2']
                    : Bahasa.EN['TeksVerifikasi2'] +
                        (bahasatrigger
                            ? Bahasa.ID['TeksVerifikasi3']
                            : Bahasa.EN['TeksVerifikasi3']),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: assetsColor.textBlack),
              ),
            ),

            /// PHONE TEXT
            Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
              child: Text(
                '+62 818*****673',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: assetsColor.textPrimary),
              ),
            ),

            /// OTP FIELD
            Container(
              margin: const EdgeInsets.fromLTRB(60, 5, 60, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  OTPTextField(
                    controller: otpLoginController,
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
                      /* setState(() {
                        textRotate =
                            storedNoHp! + constant.delimeterRegistration + pin;

                        rotatedText =
                            Rotasi.rotateText(textRotate, constant.ROT_NUM);

                        data_nilai = constant.PREFIX_KEY +
                            constant.ROT_NUM.toString() +
                            constant.backprefix +
                            base64Encode(utf8.encode(rotatedText));
                      });

                      if (pin.length == 6) {
                        print(data_nilai);
                        logicApi.verifyLogin(context, data_nilai, process);
                      }*/

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PINLogin()),
                      );
                    },
                    onCompleted: (pin) {
                      if (kDebugMode) {
                        print("Completed: $pin");
                      }
                    },
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
              child: OtpTimerButtonFunction(
                height: 40,
                onPressed: () {},
                text: Text(
                  bahasatrigger
                      ? Bahasa.ID['TombolKirimUlang']
                      : Bahasa.EN['TombolKirimUlang'],
                  style: TextStyle(color: assetsColor.textWhite, fontSize: 15),
                ),
                backgroundColor: assetsColor.buttonPrimary,
                duration: 120,
                radius: 5,
              ),
            ),

            Expanded(
              child: Container(),
            ),

            /// AREA CONTENT BUTTON "Masuk dengan Google"
            Container(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                    child: Text(
                      bahasatrigger
                          ? Bahasa.ID['TeksVerifikasi4']
                          : Bahasa.EN['TeksVerifikasi4'],
                      style:
                          TextStyle(fontSize: 15, color: assetsColor.textBlack),
                    ),
                  ),

                  /// AREA BUTTON "Metode pengiriman OTP"
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
                          child: ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                context: context,
                                builder: (BuildContext context) {
                                  return ModalBottomOTPContent(
                                    updateSelection:
                                        (bool viaSMS, bool viaWhatsApp) {
                                      setState(() {
                                        sendOTPViaSMS = viaSMS;
                                        sendOTPViaWhatsApp = viaWhatsApp;
                                      });
                                    },
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: assetsColor.buttonWhite,
                              side:
                                  BorderSide(color: assetsColor.borderDefault),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 20.0),
                                      child: Icon(
                                        sendOTPViaWhatsApp
                                            ? FontAwesomeIcons.whatsapp
                                            : Icons.message_outlined,
                                        color: sendOTPViaWhatsApp
                                            ? Colors.lightGreen
                                            : assetsColor.textBlack,
                                        size: 20,
                                      ),
                                    ),
                                    Text(
                                      bahasatrigger
                                          ? (sendOTPViaWhatsApp
                                              ? Bahasa.ID['TeksVerifikasi5']
                                              : Bahasa.ID['TeksVerifikasi6'])
                                          : (sendOTPViaWhatsApp
                                              ? Bahasa.EN['TeksVerifikasi5']
                                              : Bahasa.EN['TeksVerifikasi6']),
                                      style: TextStyle(
                                          color: assetsColor.textBlack),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.expand_more,
                                  color: assetsColor.textBlack,
                                ),
                              ],
                            ),
                          ),
                        ),
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
    );
  }
}
