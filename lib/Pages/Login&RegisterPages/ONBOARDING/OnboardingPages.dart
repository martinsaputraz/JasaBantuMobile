import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/DashboardPages.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/LOGIN/LoginPages.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/ONBOARDING/OnboardingContent.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/REGISTER/RegisterPages.dart';
import 'package:jasa_bantu/Settings/logicapi.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';
import 'package:jasa_bantu/assets/AssetsIcon.dart';
import 'package:jasa_bantu/assets/AssetsImage.dart';
import 'package:jasa_bantu/assets/AssetsLogo.dart';

AssetsColor assetsColor = AssetsColor();
AssetsLogo assetsLogo = AssetsLogo();
AssetsIcon assetsIcon = AssetsIcon();
AssetsImages assetsImages = AssetsImages();

class OnboardingPages extends StatefulWidget {
  const OnboardingPages({super.key});

  @override
  State<OnboardingPages> createState() => _OnboardingPagesState();
}

LogicApi logicApi = LogicApi();

class _OnboardingPagesState extends State<OnboardingPages> {
  //

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  void _handleGoogleSignIn() async {
    try {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      UserCredential userCredential =
          await _auth.signInWithProvider(googleAuthProvider);
      User? user = userCredential.user;

      if (user != null) {
        setState(() {
          _user = user;

          logicApi.LoginApi(context, _user!.email!);
        });
      } else {
        print("User is null");
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: assetsColor.primaryColor,
      body: Column(
        children: [
          /// LOGO COMPANY & BUTTON "BAHASA"
          Container(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// IMAGE LOGO
                Image.asset(
                  assetsLogo.jbLogoWhite,
                  width: 135,
                  height: 25,
                ),

                /// BUTTON "BAHASA"
                ElevatedButton.icon(
                  onPressed: () {
                    //
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: assetsColor.transparentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: BorderSide(color: assetsColor.borderWhite),
                    ),
                  ),
                  icon: Icon(Icons.translate,
                      color: assetsColor.textWhite, size: 20),
                  label: Text(
                    'Bahasa',
                    style: TextStyle(color: assetsColor.textWhite),
                  ),
                ),
              ],
            ),
          ),

          /// SLIDE SHOW
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: const OnboardingContent(),
          ),

          Expanded(
            child: Container(),
          ),

          /// BUTTON "Masuk dengan Google"
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () async {
                      _handleGoogleSignIn();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashboardPages()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: assetsColor.buttonWhite,
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
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Image.asset(
                                assetsIcon.coloredGoogle,
                                // color: assetsColor.textBlack,
                                height: 20,
                                width: 20,
                              ),
                            ),
                            Text(
                              'Masuk dengan Google',
                              style: TextStyle(color: assetsColor.textBlack),
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

          const Divider(
            height: 30,
            thickness: 1,
            color: Colors.white12,
          ),

          /// KOMPONEN BUTTON "MASUK & DAFTAR"
          Container(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              'Atau gunakan nomor handphone kamu',
              textAlign: TextAlign.center,
              style: TextStyle(color: assetsColor.textWhite),
            ),
          ),

          /// BUTTON "MASUK & DAFTAR"
          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// BUTTTON "MASUK"
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPages()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: BorderSide(color: assetsColor.borderWhite),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    child: Text(
                      'Masuk',
                      style:
                          TextStyle(color: assetsColor.textWhite, fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                /// BUTTON DAFTAR
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPages(
                                  message: '',
                                )),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: assetsColor.buttonWhite,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    child: Text(
                      'Daftar',
                      style:
                          TextStyle(color: assetsColor.textBlack, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
