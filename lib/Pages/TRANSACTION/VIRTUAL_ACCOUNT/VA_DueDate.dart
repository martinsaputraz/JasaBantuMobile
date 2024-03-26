import 'package:flutter/material.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class VADueDate extends StatefulWidget {
  const VADueDate({super.key});

  @override
  State<VADueDate> createState() => _VADueDateState();
}

class _VADueDateState extends State<VADueDate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: assetsColor.bgLightMode,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          /// JATUH TEMPO PEMBAYARAN
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jatuh Tempo Pembayaran',
                style: TextStyle(
                  color: assetsColor.hintText,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Kamis, 25 Jan 2024 , 16.25 WIB',
                style: TextStyle(
                  color: assetsColor.textBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const Spacer(),

          /// TIMER "JATUH TEMPO PEMBAYARAN"
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.deepOrange[50],
            ),
            child: const Text(
              '22 : 37 : 45',
              style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
