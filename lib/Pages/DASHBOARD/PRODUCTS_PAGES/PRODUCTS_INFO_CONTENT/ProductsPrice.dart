import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class ProductsPrice extends StatefulWidget {
  const ProductsPrice({Key? key}) : super(key: key);

  @override
  State<ProductsPrice> createState() => _ProductsPriceState();
}

class _ProductsPriceState extends State<ProductsPrice> {
//

  @override
  Widget build(BuildContext context) {
    return Container(
      color: assetsColor.bgLightMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Mulai dari',
              style: TextStyle(
                color: assetsColor.hintText,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 5),

          /// PRICE
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// PRIMARY PRICE
                        Row(
                          children: [
                            Text(
                              'Rp1.198.242',
                              style: TextStyle(
                                color: assetsColor.textBlack,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ' /m2',
                              style: TextStyle(
                                color: assetsColor.hintText,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),

                        /// DISCOUNTED PRICE
                        Row(
                          children: [
                            const Icon(
                              CupertinoIcons.percent,
                              color: Colors.red,
                            ),
                            const Text(
                              '43%',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'Rp1.713.486',
                              style: TextStyle(
                                color: assetsColor.hintText,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                          ),
                          child: const Text(
                            'Voucher Rp15rb',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              border: Border.all(
                                color: Colors.green,
                              )),
                          child: const Text(
                            '14+',
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// PAYLATER INFORMATION ADS
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    'PayLater & Cicilan 0%',
                    style: TextStyle(
                      color: assetsColor.textBlack,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Mulai dari Rp2.466.000',
                    style: TextStyle(
                      color: assetsColor.hintText,
                      fontSize: 15,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: assetsColor.hintText,
                    size: 15,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          /// INFORMATION PAYMENTS SECURITY
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.green[50],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.local_atm,
                    color: Colors.green[50],
                  ),
                ),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jaminan 100% uang kembali',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Jika jasa tidak sesuai. S&K berlaku baca disini',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
