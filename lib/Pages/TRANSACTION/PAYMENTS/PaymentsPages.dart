import 'package:flutter/material.dart';
import 'package:jasa_bantu/Pages/TRANSACTION/PAYMENTS/PaymentDetails.dart';
import 'package:jasa_bantu/Pages/TRANSACTION/PAYMENTS/PaymentsMethod.dart';
import 'package:jasa_bantu/Pages/TRANSACTION/VIRTUAL_ACCOUNT/VirtualAccountPages.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class PaymentsPages extends StatefulWidget {
  const PaymentsPages({super.key});

  @override
  State<PaymentsPages> createState() => _PaymentsPagesState();
}

class _PaymentsPagesState extends State<PaymentsPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: assetsColor.bgGrey200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: assetsColor.bgLightMode,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: assetsColor.textBlack),
          ),
          title: Text(
            'Pembayaran',
            style: TextStyle(color: assetsColor.textBlack),
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        addAutomaticKeepAlives: false,
        cacheExtent: 100.0,
        children: const [
          //
          /// PAYMENTS DETAILS
          PaymentsDetails(),
          SizedBox(height: 10),

          /// PAYMENTS METHOD
          PaymentsMethod(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: assetsColor.bgLightMode,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Total Tagihan',
                  style: TextStyle(color: assetsColor.hintText, fontSize: 15),
                ),
                Text(
                  'Rp 16.433.310',
                  style: TextStyle(
                    color: assetsColor.textBlack,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: 150,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VirtualAccountPages()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: assetsColor.buttonPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                icon: Icon(
                  Icons.verified_user_outlined,
                  color: assetsColor.textWhite,
                ),
                label: Text(
                  'Bayar',
                  style: TextStyle(color: assetsColor.textWhite),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
