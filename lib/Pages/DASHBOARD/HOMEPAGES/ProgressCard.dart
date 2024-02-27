import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class ProgressCard extends StatefulWidget {
  const ProgressCard({super.key});

  @override
  State<ProgressCard> createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  //

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(
              maxHeight: 200,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: assetsColor.bgLightMode,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// "STATUS" PROGRESS CARD
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                  child: const Row(
                    children: [
                      Icon(
                        CupertinoIcons.rays,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Diproses',
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 15),
                      )
                    ],
                  ),
                ),

                /// "TITLE" PROGRESS CARD
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Text(
                    'Konsultasi dan Jasa Interior Rumah, Kantor, dan Taman',
                    style: TextStyle(
                        color: assetsColor.textBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),

                /// "SUB TEXT MITRA ACCOUNT" PROGRESS CARD
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    children: [
                      Text(
                        'Kibana Home',
                        style: TextStyle(
                            color: assetsColor.textBlack, fontSize: 15),
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        CupertinoIcons.checkmark_seal_fill,
                        color: assetsColor.verifiedIcon,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                Expanded(
                  child: Container(),
                ),

                /// "TIMES TRANSACTION" PROGRESS CARD
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                    color: Colors.lightBlue[50],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Kemarin, 20.50 WIB',
                          style: TextStyle(
                              color: assetsColor.textBlue, fontSize: 15),
                        ),
                      ),
                      Text(
                        '1H + 23:37:45',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: assetsColor.textBlue,
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// "LIHAT SEMUA PESANAN" BUTTON PROGRESS CARD
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(top: 5),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Lihat semua pesanan',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.black54,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
