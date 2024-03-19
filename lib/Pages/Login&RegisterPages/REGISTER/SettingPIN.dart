import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/DashboardPages.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/ONBOARDING/ModalBottomLanguange.dart';
import 'package:jasa_bantu/Settings/Languange.dart';
import 'package:jasa_bantu/Settings/constant.dart';
import 'package:jasa_bantu/Settings/logicapi.dart';
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
  final FlutterLocalization _localization = FlutterLocalization.instance;

  Constant constant = Constant();

  String? ID;

  String setPinSimpan = "";
  String rotatedText = "";
  String textRotate = "";
  String data_nilai = "";

  String? bahasa;
  bool bahasatrigger = true;

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

    getStorageID();
    super.initState();
  }

  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
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
        title: Text(
          bahasatrigger ? Bahasa.ID['APPATURPIN'] : Bahasa.EN['APPATURPIN'],
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
                bahasatrigger
                    ? Bahasa.ID['Teks1ATURPIN']
                    : Bahasa.EN['Teks1ATURPIN'],
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
                    ? Bahasa.ID['Teks2ATURPIN']
                    : Bahasa.EN['Teks2ATURPIN'] +
                        (bahasatrigger
                            ? Bahasa.ID['Teks3ATURPIN']
                            : Bahasa.EN['Teks3ATURPIN']),
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
                    /*   if (setPinSimpan == "") {
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
                    }*/
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardPages()),
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
                            ? Bahasa.ID['TombolAturPin']
                            : Bahasa.EN['TombolAturPin'],
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
