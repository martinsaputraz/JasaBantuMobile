import 'package:flutter/material.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';
import 'package:jasa_bantu/assets/AssetsLogo.dart';

AssetsColor assetsColor = AssetsColor();
AssetsLogo assetsLogo = AssetsLogo();

class VA_PaymentsMethod extends StatefulWidget {
  const VA_PaymentsMethod({Key? key}) : super(key: key);

  @override
  State<VA_PaymentsMethod> createState() => _VA_PaymentsMethodState();
}

class _VA_PaymentsMethodState extends State<VA_PaymentsMethod> {
  List<String> tataCaraVAMobilePermata = [
    'Masukan "User ID" dan "Password" kemudian pilih "Login"',
    'Pilih "Pembayaran Tagihan"',
    'Pilih katergori "Virtual Account"',
    'Pilih rekening yang akan digunakan',
    'Masukan digit nomor Virtual Account Bank Permata dan nominal jumlah pembayaran',
    'Pilih "Benar"',
    'Pilih rekening yang akan digunakan untuk pembayaran',
  ];

  List<String> tataCaraVAATMPermata = [
    'Pilih "Transaksi Lainya"',
    'Pilih "Transaksi Pembayaran"',
    'Pilih “Lain - Lain”',
    'Pilih "Pembayaran Virtual Account"',
    'Masukan 16 digit nomor Virtual Account Bank Permata',
    'Pilih "Benar"',
    'Pilih rekening yang akan digunakan untuk pembayaran',
  ];

  /// VIA MOBILE BANKING
  List<Widget> _ExpansionTileTataCaraVAPermata() {
    List<Widget> children = [];
    for (int i = 0; i < tataCaraVAMobilePermata.length; i++) {
      children.add(
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          subtitle: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: assetsColor.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      (i + 1).toString(),
                      style:
                          TextStyle(color: assetsColor.textWhite, fontSize: 15),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      tataCaraVAMobilePermata[i],
                      maxLines: 5,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: assetsColor.textBlack,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
    return children;
  }

  /// VIA ATM MACHINE
  List<Widget> _ExpansionTileTataCaraVAPermataAtm() {
    List<Widget> children = [];
    for (int i = 0; i < tataCaraVAATMPermata.length; i++) {
      children.add(
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          subtitle: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: assetsColor.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      (i + 1).toString(),
                      style: TextStyle(
                        color: assetsColor.textWhite,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      tataCaraVAATMPermata[i],
                      maxLines: 3,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        color: assetsColor.textBlack,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: assetsColor.bgLightMode,
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          /// TITLE
          Container(
            padding: const EdgeInsets.fromLTRB(15, 10, 20, 10),
            child: Row(
              children: [
                Icon(
                  Icons.receipt_outlined,
                  color: assetsColor.textPrimary,
                ),
                const SizedBox(width: 5),
                Text(
                  'Cara Pembayaran',
                  style: TextStyle(
                    color: assetsColor.textBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),

          /// EXPANSION TILE
          /// VIRTUAL ACCOUNT
          /// By MOBILE BANKING
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
            ),
            child: ExpansionTile(
              title: Text(
                'Virtual Account via Mobile Banking',
                style: TextStyle(
                  color: assetsColor.textBlack,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: _ExpansionTileTataCaraVAPermata(),
            ),
          ),
          const SizedBox(height: 20),

          /// By ATM MACHINE
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
            ),
            child: ExpansionTile(
              title: Text(
                'Virtual Account via ATM',
                style: TextStyle(
                  color: assetsColor.textBlack,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: _ExpansionTileTataCaraVAPermataAtm(),
            ),
          ),
        ],
      ),
    );
  }
}
