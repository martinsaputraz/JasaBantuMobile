import 'package:flutter/material.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class VA_TotalPayments extends StatefulWidget {
  const VA_TotalPayments({super.key});

  @override
  State<VA_TotalPayments> createState() => _VA_TotalPaymentsState();
}

class _VA_TotalPaymentsState extends State<VA_TotalPayments> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: assetsColor.bgLightMode,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Total Pembayaran',
            style: TextStyle(
              color: assetsColor.hintText,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Rp 16.433.310',
            style: TextStyle(
              color: assetsColor.textBlack,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
