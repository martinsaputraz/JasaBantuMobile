import 'package:flutter/material.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';
import 'package:jasa_bantu/assets/AssetsLogo.dart';

AssetsColor assetsColor = AssetsColor();
AssetsLogo assetsLogo = AssetsLogo();

class PaymentsMethod extends StatefulWidget {
  const PaymentsMethod({Key? key}) : super(key: key);

  @override
  State<PaymentsMethod> createState() => _PaymentsMethodState();
}

class _PaymentsMethodState extends State<PaymentsMethod> {
  String _selectedPaymentMethod = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: assetsColor.bgLightMode,
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          /// TITLE
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              children: [
                Icon(
                  Icons.account_balance_outlined,
                  color: assetsColor.textPrimary,
                ),
                const SizedBox(width: 5),
                Text(
                  'Metode Pembayaran',
                  style: TextStyle(
                    color: assetsColor.textBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

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

          /// EXPANSION TILE
          /// VIRTUAL ACCOUNT
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
            ),
            child: ExpansionTile(
              title: Text(
                'Transfer Virtual Account',
                style: TextStyle(
                  color: assetsColor.textBlack,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pembayaran cepat dan auto verifikasi',
                    style: TextStyle(
                      color: assetsColor.hintText,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Image.asset(
                        assetsLogo.logoBankPermata,
                        height: 30,
                      )
                    ],
                  )
                ],
              ),
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedPaymentMethod = 'Virtual Account';
                    });
                  },
                  child: ListTile(
                    leading: Image.asset(assetsLogo.logoBankPermata),
                    title: const Text(
                      'Bank Permata',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      'Virtual Account',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Radio(
                      value: 'Virtual Account',
                      groupValue: _selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentMethod = value as String;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 5,
            color: assetsColor.bgGrey200,
          ),

          /// E-WALLET
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
            ),
            child: ExpansionTile(
              title: Text(
                'E-Wallet',
                style: TextStyle(
                  color: assetsColor.textBlack,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pembayaran cepat dan auto verifikasi',
                    style: TextStyle(
                      color: assetsColor.hintText,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Image.asset(
                        assetsLogo.logoGoPay,
                        height: 30,
                      )
                    ],
                  )
                ],
              ),
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedPaymentMethod = 'GoPay';
                    });
                  },
                  child: ListTile(
                    leading: Image.asset(assetsLogo.logoGoPay),
                    title: const Text(
                      'GoPay',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Radio(
                      value: 'GoPay',
                      groupValue: _selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentMethod = value as String;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 5,
            color: assetsColor.bgGrey200,
          ),

          /// COD PAYMENTS
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedPaymentMethod = 'Cash on Delivery';
              });
            },
            child: ListTile(
              title: const Row(
                children: [
                  Text(
                    'Bayar dengan tunai',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.local_atm_outlined,
                    color: Colors.green,
                  )
                ],
              ),
              subtitle: const Text(
                'Pembayaran langsung saat bertemu',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              trailing: Radio(
                value: 'Cash on Delivery',
                groupValue: _selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    _selectedPaymentMethod = value as String;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
