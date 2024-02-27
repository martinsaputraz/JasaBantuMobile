import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/ONBOARDING/OnboardingPages.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/REGISTER/OTPpages.dart';
import 'package:jasa_bantu/Settings/logicapi.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class RegisterPages extends StatefulWidget {
  final String message; // Deklarasi variabel message

  const RegisterPages({Key? key, required this.message}) : super(key: key);

  @override
  State<RegisterPages> createState() => _RegisterPagesState();
}

LogicApi logicApi = LogicApi();

class _RegisterPagesState extends State<RegisterPages> {
  //
  /// FOR 'NOMOR HANDPHONE'
  // TextEditingController _phoneNumber = TextEditingController();
  String phoneNumberRegis = "";
  String phoneNumber = "";

  String messagecheck = "";

  @override
  void initState() {
    // TODO: implement initState

    setState(() {
      messagecheck = widget.message;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: assetsColor.bgLightMode,
      appBar: AppBar(
        backgroundColor: assetsColor.bgLightMode,
        title: Text(
          'Daftar',
          style: TextStyle(fontSize: 20, color: assetsColor.textBlack),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// LOGO JASA BANTU BG WHITE
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
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
              'Daftar dengan nomor HP Kamu',
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
              'Masukkan nomor handphone kamu dan pastikan nomor kamu benar dan aktif',
              style: TextStyle(
                fontSize: 15,
                color: assetsColor.textBlack,
              ),
            ),
          ),

          /// "PHONE" TEXT FIELDS
          /*Container(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: Center(
              child: TextField(
                controller: _phoneNumber,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    labelText: 'Nomor Handphone',
                    prefixIcon:
                        Icon(Icons.phone, color: assetsColor.textBlack),
                    prefixText: '+62 '),
              ),
            ),
          ),*/

          Container(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Center(
              child: IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Nomor Handphone',
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
                    phoneNumberRegis = phone.completeNumber;
                  });
                  print(phone.completeNumber);
                },
              ),
            ),
          ),

          if (messagecheck != null)
            Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Text(
                messagecheck!,
                style: const TextStyle(
                  color: Colors.red, // Warna teks merah
                ),
              ),
            ),

          Expanded(
            child: Container(),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// AREA CONTENT BUTTON "Masuk dengan Google"
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Text(
                      'Atau lebih mudah dengan Google',
                      style:
                          TextStyle(fontSize: 15, color: assetsColor.textBlack),
                    ),
                  ),

                  /// BUTTON "Masuk dengan Google"
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: assetsColor.buttonWhite,
                              side: BorderSide(color: assetsColor.borderBlack),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 20.0),
                                      child: Image.asset(
                                        'assets/icon/Icon_Google.png',
                                        // color: assetsColor.textLoginwithGoogle,
                                        height: 20,
                                        width: 20,
                                      ),
                                    ),
                                    Text(
                                      'Masuk dengan Google',
                                      style: TextStyle(
                                        color: assetsColor.textBlack,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: assetsColor.textBlack,
                                  size: 20,
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

              /// TEXT SPAN "KETENTUAN LAYANAN" & "KEBIJAKAN PRIVASI"
              Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Dengan melanjutkan, kamu setuju sama\n',
                          style: TextStyle(
                            color: assetsColor.textBlack,
                          ),
                        ),
                        TextSpan(
                          text: 'Ketentuan Layanan',
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
                          text: ' dan ',
                          style: TextStyle(
                            color: assetsColor.textBlack,
                          ),
                        ),
                        TextSpan(
                          text: 'Kebijakan Privasi',
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
                    onPressed: () {
                      if (phoneNumberRegis == "") {
                      } else {
                        if (phoneNumberRegis.startsWith('+')) {
                          phoneNumber = phoneNumberRegis
                              .substring(1); // Remove the leading '+'
                        }
                        logicApi.sendOTPDefault(context, phoneNumber);
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OTPPages()));
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
