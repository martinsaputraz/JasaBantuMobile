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
  //
  /// FOR 'NOMOR HANDPHONE'
/*
  final TextEditingController _phoneNumber = TextEditingController();
*/

  final translator = GoogleTranslator();
  final FlutterLocalization _localization = FlutterLocalization.instance;

  String tombolAppbar = "";
  String teks1 = "";
  String teks2 = "";
  String fieldTeks = "";
  String teks3 = "";
  String teks4 = "";
  String teks5 = "";
  String teks6 = "";
  String teks7 = "";
  String teks8 = "";
  bool bahasatrigger = true;

  String tombolLanjutkan = "";

  Future<void> fetchTranslatedText(String pilihan) async {
    try {
      List<Future<Translation>> translations = [];

      if (pilihan == "id") {
        translations = [
          translator.translate("Signin", from: 'en', to: 'id'),
          translator.translate("Signin with your cellphone number",
              from: 'en', to: 'id'),
          translator.translate("Welcome back!", from: 'en', to: 'id'),
          translator.translate("Mobile phone number", from: 'en', to: 'id'),
          translator.translate("Number is no longer active or lost?",
              from: 'en', to: 'id'),
          translator.translate("reset", from: 'en', to: 'id'),
          translator.translate("By continuing, you agree to the same",
              from: 'en', to: 'id'),
          translator.translate("Terms of Service", from: 'en', to: 'id'),
          translator.translate("and", from: 'en', to: 'id'),
          translator.translate("Privacy Policy", from: 'en', to: 'id'),
          translator.translate("Lanjutkan", from: 'en', to: 'id'),
        ];
      } else if (pilihan == "en") {
        translations = [
          translator.translate("Signin", from: 'id', to: 'en'),
          translator.translate("Signin dengan nomor HP Kamu",
              from: 'id', to: 'en'),
          translator.translate("Selamat datang kembali!", from: 'id', to: 'en'),
          translator.translate("Nomor Handphone", from: 'id', to: 'en'),
          translator.translate("Nomor sudah tidak aktif atau hilang?",
              from: 'id', to: 'en'),
          translator.translate("Atur ulang", from: 'id', to: 'en'),
          translator.translate("Dengan melanjutkan, kamu setuju sama",
              from: 'id', to: 'en'),
          translator.translate("Terms of Service", from: 'id', to: 'en'),
          translator.translate("dan", from: 'id', to: 'en'),
          translator.translate("Kebijakan Privasi", from: 'id', to: 'en'),
          translator.translate("Next", from: 'id', to: 'en'),
        ];
      } else {
        translations = [
          translator.translate("Signin", from: 'id', to: 'en'),
          translator.translate("Signin with your cellphone number",
              from: 'id', to: 'en'),
          translator.translate("Welcome back!", from: 'en', to: 'id'),
          translator.translate("Mobile phone number", from: 'en', to: 'id'),
          translator.translate("Number is no longer active or lost?",
              from: 'en', to: 'id'),
          translator.translate("reset", from: 'en', to: 'id'),
          translator.translate("By continuing, you agree to the same\n",
              from: 'en', to: 'id'),
          translator.translate("Terms of Service", from: 'en', to: 'id'),
          translator.translate("and", from: 'id', to: 'en'),
          translator.translate("Lanjutkan", from: 'en', to: 'id'),
        ];
      }

      List<Translation> translatedTexts = await Future.wait(translations);

      setState(() {
        tombolAppbar = translatedTexts[0].toString();
        teks1 = translatedTexts[1].toString();
        teks2 = translatedTexts[2].toString();
        fieldTeks = translatedTexts[3].toString();
        teks3 = translatedTexts[4].toString();
        teks4 = translatedTexts[5].toString();
        teks5 = translatedTexts[6].toString();
        teks6 = translatedTexts[7].toString();
        teks7 = translatedTexts[8].toString();
        teks8 = translatedTexts[9].toString();

        tombolLanjutkan = translatedTexts[10].toString();
      });
    } catch (e) {
      print("Error during translation: $e");
    }
  }

  @override
  void initState() {
    modelSharePreferences.dataShareprefrences().then((data) {
      String bahasa = data['bahasa'] ?? 'id';

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

      // Memanggil fungsi fetchTranslatedText untuk menerjemahkan teks
      fetchTranslatedText(bahasa);
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
          tombolAppbar,
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
              teks1,
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
              teks2,
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
                  labelText: fieldTeks,
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
                        text: teks3 + "\t",
                        style: TextStyle(
                          color: assetsColor.textBlack,
                        ),
                      ),
                      TextSpan(
                        text: teks4,
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
                          text: teks5 + "\n",
                          style: TextStyle(
                            color: assetsColor.textBlack,
                          ),
                        ),
                        TextSpan(
                          text: teks6,
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
                          text: "\t" + teks7 + "\t",
                          style: TextStyle(
                            color: assetsColor.textBlack,
                          ),
                        ),
                        TextSpan(
                          text: teks8,
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
                      /*  if (phoneNumberLogin == "") {
                      } else {
                        if (phoneNumberLogin.startsWith('+')) {
                          phoneNumber = phoneNumberLogin
                              .substring(1); // Remove the leading '+'
                        }

                        logicApi.LoginApi(context, phoneNumber);
                      }*/
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OTPLogin()),
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
                          tombolLanjutkan,
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
