import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/DashboardPages.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/ONBOARDING/ModalBottomLanguange.dart';
import 'package:jasa_bantu/Settings/Languange.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

AssetsColor assetsColor = AssetsColor();

class NewPIN extends StatefulWidget {
  const NewPIN({super.key});

  @override
  State<NewPIN> createState() => _NewPINState();
}

class _NewPINState extends State<NewPIN> {
  //

  ///FOR 'OTP'
  OtpFieldController setPINController = OtpFieldController();
  String? bahasa;
  bool bahasatrigger = true;
  final FlutterLocalization _localization = FlutterLocalization.instance;

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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: assetsColor.bgLightMode,
      appBar: AppBar(
        backgroundColor: assetsColor.bgLightMode,
        title: Text(
          bahasatrigger ? Bahasa.ID['APPBARNEWPIN'] : Bahasa.EN['APPBARNEWPIN'],
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
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.indigo,
              ),
              child: const Icon(
                Icons.password,
                size: 50,
                color: Colors.white,
              ),
            ),

            /// TITLE TEXT
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Text(
                bahasatrigger
                    ? Bahasa.ID['TEKS1NEWPIN']
                    : Bahasa.EN['TEKS1NEWPIN'],
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
                bahasatrigger
                    ? Bahasa.ID['TEKS2NEWPIN']
                    : Bahasa.EN['TEKS2NEWPIN'] +
                        (bahasatrigger
                            ? Bahasa.ID['TEKS3NEWPIN']
                            : Bahasa.EN['TEKS3NEWPIN']),
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
                      if (kDebugMode) {
                        print("Changed: $pin");
                      }
                      // if (pin.isEmpty) {
                      //   FocusScope.of(context).previousFocus();
                      // }
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

            Expanded(
              child: Container(),
            ),

            /// "SIMPAN PIN" BUTTON
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DashboardPages(dataIndex: 0)),
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
                            ? Bahasa.ID['TombolSimpanPin']
                            : Bahasa.EN['TombolSimpanPin'],
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
