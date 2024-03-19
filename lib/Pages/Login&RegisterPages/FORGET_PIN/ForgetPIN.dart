import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/FORGET_PIN/OTPPagesFP.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/ONBOARDING/ModalBottomLanguange.dart';
import 'package:jasa_bantu/Settings/Languange.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: assetsColor.bgLightMode,
      appBar: AppBar(
        backgroundColor: assetsColor.bgLightMode,
        title: Text(
          bahasatrigger ? Bahasa.ID['APPBARFORGET'] : Bahasa.EN['APPBARFORGET'],
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
              bahasatrigger
                  ? Bahasa.ID['TEKS1FORGETPAGE']
                  : Bahasa.EN['TEKS1FORGETPAGE'],
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
                  labelText: bahasatrigger
                      ? Bahasa.ID['FIELDTEXTFORGETPAGE']
                      : Bahasa.EN['FIELDTEXTFORGETPAGE'],
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
                          bahasatrigger
                              ? Bahasa.ID['TOMBOLLANJUTFORGET']
                              : Bahasa.EN['TOMBOLLANJUTFORGET'],
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
