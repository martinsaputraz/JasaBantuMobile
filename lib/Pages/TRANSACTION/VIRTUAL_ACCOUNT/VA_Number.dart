import 'package:flutter/material.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';
import 'package:jasa_bantu/assets/AssetsLogo.dart';

AssetsColor assetsColor = AssetsColor();
AssetsLogo assetsLogo = AssetsLogo();

class VA_Number extends StatefulWidget {
  const VA_Number({super.key});

  @override
  State<VA_Number> createState() => _VA_NumberState();
}

class _VA_NumberState extends State<VA_Number> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: assetsColor.bgLightMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Transfer Virtual Account',
              style: TextStyle(
                color: assetsColor.textBlack,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 5),

          /// ANNOUNCEMENT
          Container(
            decoration: BoxDecoration(
              color: Colors.green[50],
            ),
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            width: double.infinity,
            child: const Row(
              children: [
                Icon(
                  Icons.verified_user_outlined,
                  color: Colors.green,
                  size: 20,
                ),
                SizedBox(width: 5),
                Text(
                  'Pembayaran dijamin keamanannya',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Image.asset(
                  assetsLogo.logoBankPermata,
                  height: 30,
                ),
                const SizedBox(width: 10),
                Text(
                  'Bank Permata',
                  style: TextStyle(
                      color: assetsColor.textBlack,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          /// VIRTUAL ACCOUNT NUMBER TITLE
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Nomor Virtual Account',
              style: TextStyle(
                color: assetsColor.hintText,
                fontSize: 15,
              ),
            ),
          ),

          /// VIRTUAL ACCOUNT NUMBER
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              children: [
                Text(
                  '05587081327931942',
                  style: TextStyle(
                    color: assetsColor.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: () {},
                  label: Text(
                    'Salin',
                    style: TextStyle(
                      color: assetsColor.textPrimary,
                    ),
                  ),
                  icon: Icon(
                    Icons.copy,
                    color: assetsColor.textPrimary,
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
