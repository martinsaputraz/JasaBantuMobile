import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dynamic_icon/flutter_dynamic_icon.dart';
import 'package:jasa_bantu/Pages/StarterPages/SplashScreen.dart';
import 'package:jasa_bantu/Settings/constant.dart';
import 'package:jasa_bantu/Settings/firebase_options.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PackageInfo packageInfo = await PackageInfo.fromPlatform();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp(packageInfo: packageInfo));
}

Constant constant = Constant();
AssetsColor assetsColor = AssetsColor();

class MyApp extends StatefulWidget {
  final PackageInfo packageInfo;

  const MyApp({Key? key, required this.packageInfo}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState(packageInfo: packageInfo);
}

class _MyAppState extends State<MyApp> {
  final List<String> iconName = ['logolebaran', 'logodasar'];

  String event = "Lebaran";
  bool _isIconChanged = false;
  int iconIndex = 0;

  @override
  void initState() {
    _changeAppIcon();
    super.initState();
  }

  void _changeAppIcon() async {
    print(iconName[iconIndex]);
    await FlutterDynamicIcon.setAlternateIconName(iconName[iconIndex]);
  }

  final PackageInfo packageInfo;

  _MyAppState({required this.packageInfo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jasa Bantu',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87),
        useMaterial3: true,
        indicatorColor: assetsColor.primaryColor,
        inputDecorationTheme: const InputDecorationTheme(),
      ),
      home: SplashScreen(packageInfo: packageInfo),
    );
  }
}
