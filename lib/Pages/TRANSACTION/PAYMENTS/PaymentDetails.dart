import 'package:flutter/material.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class PaymentsDetails extends StatefulWidget {
  const PaymentsDetails({super.key});

  @override
  State<PaymentsDetails> createState() => _PaymentsDetailsState();
}

class _PaymentsDetailsState extends State<PaymentsDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: assetsColor.bgLightMode,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          /// TITLE
          Row(
            children: [
              Icon(
                Icons.receipt_outlined,
                color: assetsColor.textPrimary,
              ),
              const SizedBox(width: 5),
              Text(
                'Rincian Pembayaran',
                style: TextStyle(
                  color: assetsColor.textBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          /// TOTAL BIAYA PESANAN
          Row(
            children: [
              Text(
                'Total Biaya Pesanan',
                style: TextStyle(
                  color: assetsColor.hintText,
                  fontSize: 15,
                ),
              ),
              const Spacer(),
              Text(
                'Rp 16.432.310',
                style: TextStyle(
                  color: assetsColor.textBlack,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),

          /// BIAYA PEMBAYARAN
          Row(
            children: [
              Text(
                'Biaya Pembayaran',
                style: TextStyle(
                  color: assetsColor.hintText,
                  fontSize: 15,
                ),
              ),
              const SizedBox(width: 5),
              Icon(
                Icons.info_outline,
                color: assetsColor.hintText,
                size: 20,
              ),
              const Spacer(),
              Text(
                'Rp 2.000',
                style: TextStyle(
                  color: assetsColor.hintText,
                  fontSize: 15,
                  decoration: TextDecoration.lineThrough,
                  decorationThickness: 2.0,
                ),
              ),
              const SizedBox(width: 5),
              const Text(
                'Rp 1.000',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          /// TOTAL BIAYA PEMBAYARAN
          Row(
            children: [
              Text(
                'Total Biaya Pesanan',
                style: TextStyle(
                  color: assetsColor.hintText,
                  fontSize: 15,
                ),
              ),
              const Spacer(),
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
        ],
      ),
    );
  }
}
