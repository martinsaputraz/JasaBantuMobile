import 'package:flutter/material.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/DashboardPages.dart';
import 'package:jasa_bantu/Pages/Login&RegisterPages/ONBOARDING/OnboardingPages.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class PaymentSuccess extends StatefulWidget {
  const PaymentSuccess({super.key});

  @override
  State<PaymentSuccess> createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DashboardPages()),
              );
            },
            icon: Icon(Icons.arrow_back, color: assetsColor.textBlack),
          ),
          title: Text(
            'Pembayaran',
            style: TextStyle(color: assetsColor.textBlack),
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              assetsImages.stickersMakasih,
              height: 200,
            ),
            const SizedBox(height: 10),
            Text('Pembayaran Berhasil',
                style: TextStyle(
                  color: assetsColor.textBlack,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ))
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: assetsColor.bgLightMode,
        child: Center(
          child: SizedBox(
            width: 300,
            child: ElevatedButton.icon(
              onPressed: () {
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
              icon: Icon(
                Icons.home_outlined,
                color: assetsColor.textWhite,
              ),
              label: Text(
                'Kembali ke Home',
                style: TextStyle(color: assetsColor.textWhite),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
