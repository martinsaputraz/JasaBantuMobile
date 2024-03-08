import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/ONBOARDING/OnboardingPages.dart';
import 'package:jasa_bantu/Settings/Languange.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';
import 'package:jasa_bantu/local_database/model_share_prefrences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:translator/translator.dart';

AssetsColor assetsColor = AssetsColor();
Bahasa bahasa = Bahasa();

class ModalBottomLanguange extends StatefulWidget {
  final Function(bool, bool) updateSelection;

  const ModalBottomLanguange({Key? key, required this.updateSelection})
      : super(key: key);

  @override
  _ModalBottomLanguangeState createState() => _ModalBottomLanguangeState();
}

ModelSharePreferences modelSharePreferences = ModelSharePreferences();
final translator = GoogleTranslator();

class _ModalBottomLanguangeState extends State<ModalBottomLanguange> {
  String tombolBahasaIndonesia = "";
  String tombolBahasaEnglish = "";
  final FlutterLocalization _localization = FlutterLocalization.instance;
  var translation = "";
  bool ID = true;
  bool EN = false;

  @override
  void initState() {
    modelSharePreferences.dataShareprefrences().then((data) {
      setState(() {
        // Ambil nilai dari SharePreferences
        tombolBahasaIndonesia = data['tombolBahasaIndo']!;
        tombolBahasaEnglish = data['tombolBahasaEnglish']!;

        // Konversi string ke boolean
        ID = tombolBahasaIndonesia ==
            'true'; // Jika 'true' maka ID akan true, jika 'false' maka ID akan false
        EN = tombolBahasaEnglish ==
            'true'; // Jika 'true' maka EN akan true, jika 'false' maka EN akan false
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
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: Text(ID ? Bahasa.ID['NamaModal'] : Bahasa.EN['NamaModal']),
          ),

          /// SEND OTP SMS
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  ID = true;
                  EN = false;
                  widget.updateSelection(true, false);
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: assetsColor.buttonWhite,
                side: BorderSide(
                    color: ID
                        ? assetsColor.borderBlack
                        : assetsColor.borderDefault),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: FaIcon(
                          FontAwesomeIcons.language,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                      Text(
                        'Bahasa Indonesia',
                        style: TextStyle(color: assetsColor.textBlack),
                      ),
                    ],
                  ),
                  Icon(
                    ID
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked_outlined,
                    color: assetsColor.textBlack,
                  ),
                ],
              ),
            ),
          ),

          /// SEND OTP WHATSAPP
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  ID = false;
                  EN = true;
                  widget.updateSelection(false, true);
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: assetsColor.buttonWhite,
                side: BorderSide(
                    color: EN
                        ? assetsColor.borderBlack
                        : assetsColor.borderDefault),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: FaIcon(
                          FontAwesomeIcons.language,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                      Text(
                        'English',
                        style: TextStyle(color: assetsColor.textBlack),
                      ),
                    ],
                  ),
                  Icon(
                    EN
                        ? Icons.radio_button_checked
                        : Icons.radio_button_unchecked_outlined,
                    color: assetsColor.textBlack,
                  ),
                ],
              ),
            ),
          ),

          /// BUTTON "Kirim kode OTP"
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  if (ID == true) {
                    _localization.translate('id');
                    await prefs.setString("tombolBahasaIndo", "true");
                    await prefs.setString("bahasa", "id");
                    await modelSharePreferences.deleteTombolEnglish(context);
                  } else if (EN == true) {
                    _localization.translate('en');
                    await prefs.setString("tombolBahasaEnglish", "true");
                    await prefs.setString("bahasa", "en");
                    await modelSharePreferences.deleteTombolIndonesia(context);
                  }
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnboardingPages(),
                    ),
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
                      ID ? Bahasa.ID['NamaModal'] : Bahasa.EN['NamaModal'],
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
