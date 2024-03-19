import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/ONBOARDING/ModalBottomLanguange.dart';
import 'package:jasa_bantu/Settings/Languange.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';
import 'package:shared_preferences/shared_preferences.dart';

AssetsColor assetsColor = AssetsColor();

class ModalBottomOTPContent extends StatefulWidget {
  final Function(bool, bool) updateSelection;

  const ModalBottomOTPContent({Key? key, required this.updateSelection})
      : super(key: key);

  @override
  _ModalBottomOTPContentState createState() => _ModalBottomOTPContentState();
}

class _ModalBottomOTPContentState extends State<ModalBottomOTPContent> {
  bool _sendOTPViaSMS = true;
  bool _sendOTPViaWhatsApp = false;
  final FlutterLocalization _localization = FlutterLocalization.instance;

  String? bahasa;
  bool bahasatrigger = true;

  String tombolWa = "";
  String tombolSMS = "";

  @override
  void initState() {
    modelSharePreferences.dataShareprefrences().then((data) {
      setState(() {
        // Ambil nilai dari SharePreferences
        tombolWa = data['tombolWhatsapp']!;
        tombolSMS = data['tombolSMS']!;

        _sendOTPViaWhatsApp = tombolWa ==
            'true'; // Jika 'true' maka ID akan true, jika 'false' maka ID akan false
        _sendOTPViaSMS = tombolSMS ==
            'true'; // Jika 'true' maka EN akan true, jika 'false' maka EN akan false

        if (tombolWa == '' && tombolSMS == '') {
          _sendOTPViaSMS = true;
        }

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
            child: Text(
              bahasatrigger
                  ? Bahasa.ID['Teks1ModalOTP']
                  : Bahasa.EN['Teks1ModalOTP'],
            ),
          ),

          /// SEND OTP SMS
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _sendOTPViaSMS = true;
                  _sendOTPViaWhatsApp = false;
                  widget.updateSelection(true, false);
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: assetsColor.buttonWhite,
                side: BorderSide(
                    color: _sendOTPViaSMS
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
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Icon(
                          Icons.message_outlined,
                          color: assetsColor.textBlack,
                          size: 20,
                        ),
                      ),
                      Text(
                        bahasatrigger
                            ? Bahasa.ID['OTPSMSMODAL']
                            : Bahasa.EN['OTPSMSMODAL'],
                        style: TextStyle(color: assetsColor.textBlack),
                      ),
                    ],
                  ),
                  Icon(
                    _sendOTPViaSMS
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
                  _sendOTPViaSMS = false;
                  _sendOTPViaWhatsApp = true;
                  widget.updateSelection(false, true);
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: assetsColor.buttonWhite,
                side: BorderSide(
                    color: _sendOTPViaWhatsApp
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
                          FontAwesomeIcons.whatsapp,
                          color: Colors.lightGreen,
                          size: 20,
                        ),
                      ),
                      Text(
                        bahasatrigger
                            ? Bahasa.ID['OTPWAMODAL']
                            : Bahasa.EN['OTPWAMODAL'],
                        style: TextStyle(color: assetsColor.textBlack),
                      ),
                    ],
                  ),
                  Icon(
                    _sendOTPViaWhatsApp
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

                  if (_sendOTPViaSMS == true) {
                    await prefs.setString("tombolSMS", "true");
                    await modelSharePreferences.deleteTombolWA(context);

                    setState(() {
                      _sendOTPViaSMS = true;
                    });
                  } else if (_sendOTPViaWhatsApp == true) {
                    await prefs.setString("tombolWhatsapp", "true");
                    await modelSharePreferences.deleteTombolSMS(context);
                    setState(() {
                      _sendOTPViaWhatsApp = true;
                    });
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
                      bahasatrigger
                          ? Bahasa.ID['TombolKirimKodeOTP']
                          : Bahasa.EN['TombolKirimKodeOTP'],
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
