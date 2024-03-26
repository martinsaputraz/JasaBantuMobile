import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class ProductsMitraProfile extends StatefulWidget {
  const ProductsMitraProfile({Key? key}) : super(key: key);

  @override
  State<ProductsMitraProfile> createState() => _ProductsMitraProfileState();
}

class _ProductsMitraProfileState extends State<ProductsMitraProfile> {
//

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: assetsColor.bgLightMode,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///
            Row(
              children: [
                CircleAvatar(
                  radius: 35,
                ),
                const SizedBox(width: 10),

                /// MITRA'S NAME
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Kibana Home',
                          style: TextStyle(
                            color: assetsColor.textBlack,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          CupertinoIcons.checkmark_seal_fill,
                          color: Colors.green,
                          size: 20,
                        )
                      ],
                    ),

                    /// MITRA'S MEMBER SINCE & LOCATION
                    Text(
                      'Bergabung Nov 2022, Jakarta Barat',
                      style: TextStyle(
                        color: assetsColor.hintText,
                        fontSize: 15,
                      ),
                    ),

                    /// STATUS ONLINE
                    Text(
                      'Sedang Aktif',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),

            //
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star_outline,
                        color: assetsColor.textBlack,
                        size: 20,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '4.9',
                        style: TextStyle(
                          color: assetsColor.textBlack,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '(2.4K+)',
                        style: TextStyle(
                          color: assetsColor.hintText,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.thumb_up_outlined,
                        color: assetsColor.textBlack,
                        size: 20,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '96%',
                        style: TextStyle(
                          color: assetsColor.textBlack,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Jasa Selesai',
                        style: TextStyle(
                          color: assetsColor.hintText,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
