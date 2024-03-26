import 'package:flutter/material.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';
import 'package:jasa_bantu/assets/AssetsLogo.dart';

AssetsColor assetsColor = AssetsColor();
AssetsLogo assetsLogo = AssetsLogo();

class GoPayAccounts {
  final String phoneNumber;
  final String saldo;

  GoPayAccounts({required this.phoneNumber, required this.saldo});
}

class ModalBottomGoPayAcc extends StatefulWidget {
  final Function(GoPayAccounts?) updateSelection;
  final GoPayAccounts? selectedAccount;

  const ModalBottomGoPayAcc({
    Key? key,
    required this.updateSelection,
    required this.selectedAccount,
  }) : super(key: key);

  @override
  _ModalBottomGoPayAccState createState() => _ModalBottomGoPayAccState();
}

class _ModalBottomGoPayAccState extends State<ModalBottomGoPayAcc> {
  GoPayAccounts? selectedAccount;

  List<GoPayAccounts> goPayAccounts = [
    GoPayAccounts(phoneNumber: '+62 81327931942', saldo: 'Rp 375.000'),
    GoPayAccounts(phoneNumber: '+62 85155156977', saldo: 'Rp 0'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: const Text('Metode pengiriman OTP'),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: goPayAccounts.length,
            itemBuilder: (context, index) {
              GoPayAccounts accountsGoPay = goPayAccounts[index];
              return Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // Jika tombol yang ditekan saat ini adalah yang sudah terpilih, maka kosongkan pilihan
                      // Jika tidak, atur akun yang dipilih ke akun yang baru dipilih
                      selectedAccount = selectedAccount == accountsGoPay
                          ? null
                          : accountsGoPay;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(
                        color: selectedAccount == accountsGoPay
                            ? assetsColor.primaryColor
                            : Colors.grey),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              assetsLogo.logoGoPay,
                              height: 35,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'No. Handphone',
                                  style: TextStyle(
                                    color: assetsColor.hintText,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  accountsGoPay.phoneNumber,
                                  style: TextStyle(
                                    color: assetsColor.textBlack,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Jumlah Saldo',
                                  style: TextStyle(
                                    color: assetsColor.hintText,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  accountsGoPay.saldo,
                                  style: TextStyle(
                                    color: assetsColor.textBlack,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Icon(
                          selectedAccount == accountsGoPay
                              ? Icons.radio_button_checked
                              : Icons.radio_button_unchecked_outlined,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              goPayAccounts.remove(accountsGoPay);
                            });
                          },
                          icon: const Icon(
                            Icons.delete_forever_outlined,
                            color: Colors.deepOrange,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          /// BUTTON "Kirim kode OTP"
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            width: double.infinity,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle action here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: assetsColor.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Tambah Akun GoPay',
                      style: TextStyle(color: Colors.white, fontSize: 18),
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
