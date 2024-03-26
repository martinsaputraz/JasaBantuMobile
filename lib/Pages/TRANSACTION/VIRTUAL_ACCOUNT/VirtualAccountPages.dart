import 'package:flutter/material.dart';
import 'package:jasa_bantu/Pages/TRANSACTION/PAYMENTS/PaymentSuccessPages.dart';
import 'package:jasa_bantu/Pages/TRANSACTION/VIRTUAL_ACCOUNT/VAPages_RecommendProducts.dart';
import 'package:jasa_bantu/Pages/TRANSACTION/VIRTUAL_ACCOUNT/VA_DueDate.dart';
import 'package:jasa_bantu/Pages/TRANSACTION/VIRTUAL_ACCOUNT/VA_Number.dart';
import 'package:jasa_bantu/Pages/TRANSACTION/VIRTUAL_ACCOUNT/VA_PaymentMethod.dart';
import 'package:jasa_bantu/Pages/TRANSACTION/VIRTUAL_ACCOUNT/VA_TotalPayments.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class VirtualAccountPages extends StatefulWidget {
  const VirtualAccountPages({super.key});

  @override
  State<VirtualAccountPages> createState() => _VirtualAccountPagesState();
}

class _VirtualAccountPagesState extends State<VirtualAccountPages> {
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
          /// VIRTUAL ACCOUNT DUE DATE
          VADueDate(),
          SizedBox(height: 10),

          /// TOTAL PAYMENTS DESCRIPTION
          VA_TotalPayments(),
          SizedBox(height: 10),

          /// VIRTUAL ACCOUNT NUMBER
          VA_Number(),

          /// VA PAYMENT METHOD
          VA_PaymentsMethod(),
          SizedBox(height: 10),

          /// ADS SERVICES
          VARecommendProducts(),
        ],
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
                      builder: (context) => const PaymentSuccess()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: assetsColor.buttonPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              icon: Icon(
                Icons.task_alt_outlined,
                color: assetsColor.textWhite,
              ),
              label: Text(
                'Cek Status Pembayaran',
                style: TextStyle(color: assetsColor.textWhite),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
