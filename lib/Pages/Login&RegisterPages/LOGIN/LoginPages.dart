import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/LOGIN/OTPLogin.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/ONBOARDING/OnboardingPages.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/RESET_PHONE/resetPhone.dart';
import 'package:jasa_bantu/Settings/Languange.dart';
import 'package:jasa_bantu/Settings/logicapi.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';
import 'package:translator/translator.dart';

AssetsColor assetsColor = AssetsColor();
LogicApi logicApi = LogicApi();

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  final translator = GoogleTranslator();
  final FlutterLocalization _localization = FlutterLocalization.instance;

  bool bahasatrigger = true;
  String? bahasa;

  @override
  void initState() {
    modelSharePreferences.dataShareprefrences().then((data) {
      setState(() {
        // Ambil nilai dari SharePreferences
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

    super.initState();
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  String phoneNumber = "";
  String phoneNumberLogin = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: assetsColor.bgLightMode,
      appBar: AppBar(
        backgroundColor: assetsColor.bgLightMode,
        title: Text(
          bahasatrigger ? Bahasa.ID['APPBARLOGIN'] : Bahasa.EN['APPBARLOGIN'],
          style: TextStyle(fontSize: 20, color: assetsColor.textBlack),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// LOGO JASA BANTU BG WHITE
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Image.asset(
              assetsLogo.jbLogoBlack,
              width: 115,
              height: 25,
            ),
          ),

          /// TITLE TEXT
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              bahasatrigger
                  ? Bahasa.ID['TEKS1LOGINPAGE']
                  : Bahasa.EN['TEKS1LOGINPAGE'],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: assetsColor.textBlack),
            ),
          ),

          /// SUB TITLE TEXT
          Container(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
            child: Text(
              bahasatrigger
                  ? Bahasa.ID['TEKS2LOGINPAGE']
                  : Bahasa.EN['TEKS2LOGINPAGE'],
              style: TextStyle(
                fontSize: 15,
                color: assetsColor.textBlack,
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Center(
              child: IntlPhoneField(
                decoration: InputDecoration(
                  labelText: bahasatrigger
                      ? Bahasa.ID['FIELDTEXTLOGINPAGE']
                      : Bahasa.EN['FIELDTEXTLOGINPAGE'],
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
                    phoneNumberLogin = phone.completeNumber;
                  });
                },
                inputFormatters: const [],
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              children: [
                const Icon(Icons.info_outline),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: bahasatrigger
                            ? Bahasa.ID['TEKS3LOGINPAGE']
                            : Bahasa.EN['TEKS3LOGINPAGE'],
                        style: TextStyle(
                          color: assetsColor.textBlack,
                        ),
                      ),
                      TextSpan(
                        text: bahasatrigger
                            ? Bahasa.ID['TEKS4LOGINPAGE']
                            : Bahasa.EN['TEKS4LOGINPAGE'],
                        style: TextStyle(
                          color: assetsColor.textBlack,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ResetPhone()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// TEXT SPAN "KETENTUAN LAYANAN" & "KEBIJAKAN PRIVASI"
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: bahasatrigger
                              ? Bahasa.ID['TEKS5LOGINPAGE']
                              : Bahasa.EN['TEKS5LOGINPAGE'],
                          style: TextStyle(
                            color: assetsColor.textBlack,
                          ),
                        ),
                        TextSpan(
                          text: bahasatrigger
                              ? Bahasa.ID['TEKS6LOGINPAGE']
                              : Bahasa.EN['TEKS6LOGINPAGE'],
                          style: TextStyle(
                            color: assetsColor.textBlack,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const RegisterApps()),
                              // );
                            },
                        ),
                        TextSpan(
                          text: bahasatrigger
                              ? Bahasa.ID['TEKS7LOGINPAGE']
                              : Bahasa.EN['TEKS7LOGINPAGE'],
                          style: TextStyle(
                            color: assetsColor.textBlack,
                          ),
                        ),
                        TextSpan(
                          text: bahasatrigger
                              ? Bahasa.ID['TEKS8LOGINPAGE']
                              : Bahasa.EN['TEKS8LOGINPAGE'],
                          style: TextStyle(
                            color: assetsColor.textBlack,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const RegisterApps()),
                              // );
                            },
                        ),
                        TextSpan(
                          text: ' Jasa Bantu',
                          style: TextStyle(
                            color: assetsColor.textBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /// BUTTON "LANJUTKAN"
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (phoneNumberLogin == "") {
                      } else {
                        if (phoneNumberLogin.startsWith('+')) {
                          phoneNumber = phoneNumberLogin
                              .substring(1); // Remove the leading '+'
                        }

                        logicApi.LoginApi(context, phoneNumber);
                      }
                      /*    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OTPLogin()),
                      );*/
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
                          bahasatrigger
                              ? Bahasa.ID['TOMBOLLANJUTKANLOGIN']
                              : Bahasa.EN['TOMBOLLANJUTKANLOGIN'],
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
      // ),
    );
  }
}
