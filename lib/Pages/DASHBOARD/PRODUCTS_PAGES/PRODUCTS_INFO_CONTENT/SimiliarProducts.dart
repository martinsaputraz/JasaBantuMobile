import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class SimiliarProducts extends StatefulWidget {
  const SimiliarProducts({Key? key}) : super(key: key);

  @override
  State<SimiliarProducts> createState() => _SimiliarProductsState();
}

class _SimiliarProductsState extends State<SimiliarProducts> {
  List<Map<String, dynamic>> similiarCardData = [
    {
      'similiarCardTitle': 'Express Elite',
      'similiarCardLocation': 'Jakarta Barat',
      'similiarCardServiceName': 'Jasa Foto Produk Profesional',
      'similiarCardPrice': '80.000',
      'similiarCardPercentage': '74%',
      'similiaredCardPrice': '355.000',
      'similiarCardRating': '4.8',
      'similiarCardBannerImages':
          'assets/images/CardImages/CardContent_Banner(1).png',
      'similiarCardProfileImages':
          'assets/images/CardImages/CardContent_Profile(1).png',
    },
    {
      'similiarCardTitle': 'Zenith Group Innovation',
      'similiarCardLocation': 'Tangerang Selatan',
      'similiarCardServiceName': 'Konsultasi Desain Rumah',
      'similiarCardPrice': '150.000',
      'similiarCardPercentage': '43%',
      'similiaredCardPrice': '275.000',
      'similiarCardRating': '4.9',
      'similiarCardBannerImages':
          'assets/images/CardImages/CardContent_Banner(2).png',
      'similiarCardProfileImages':
          'assets/images/CardImages/CardContent_Profile(2).png',
    },
    {
      'similiarCardTitle': 'Sonic Flare',
      'similiarCardLocation': 'Bekasi Barat',
      'similiarCardServiceName': 'Perawatan Wajah & Kuku',
      'similiarCardPrice': '2.750.000',
      'similiarCardPercentage': '55%',
      'similiaredCardPrice': '5.200.000',
      'similiarCardRating': '4.7',
      'similiarCardBannerImages':
          'assets/images/CardImages/CardContent_Banner(3).png',
      'similiarCardProfileImages':
          'assets/images/CardImages/CardContent_Profile(3).png',
    },
    // Add more data entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: const Row(
                  children: [
                    Text(
                      'Produk serupa untukmu',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    similiarCardData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(5),
                      child: SimiliarProductsWidget(
                          cardDataSimiliarProducts: similiarCardData[index]),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SimiliarProductsWidget extends StatelessWidget {
  final Map<String, dynamic> cardDataSimiliarProducts;

  SimiliarProductsWidget({Key? key, required this.cardDataSimiliarProducts})
      : super(key: key);

  bool showProfilePictureSimiliarProducts = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        constraints: const BoxConstraints(
          maxHeight: 350,
          maxWidth: 200,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    cardDataSimiliarProducts['similiarCardBannerImages'],
                    height: 100,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 70),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(3, 3, 10, 3),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: Colors.purpleAccent,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(Icons.star, color: Colors.white),
                        SizedBox(width: 5),
                        Text(
                          // Using hardcoded rating for now, you can replace it with cardDataSimiliarProducts['similiarCardRating']
                          '4.8',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, top: 40),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.brown.shade800,
                    backgroundImage: showProfilePictureSimiliarProducts
                        ? AssetImage(cardDataSimiliarProducts[
                            'similiarCardProfileImages'])
                        : null,
                    child: showProfilePictureSimiliarProducts
                        ? null
                        : const Text('EP'),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      cardDataSimiliarProducts['similiarCardTitle'],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    CupertinoIcons.checkmark_seal_fill,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                cardDataSimiliarProducts['similiarCardLocation'],
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                cardDataSimiliarProducts['similiarCardServiceName'],
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: const Text(
                'Mulai dari',
                style: TextStyle(color: Colors.black45, fontSize: 15),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    'Rp${cardDataSimiliarProducts['similiarCardPrice']}',
                    style: const TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    ' /pcs',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.percent_rounded,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    cardDataSimiliarProducts['similiarCardPercentage'],
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Rp${cardDataSimiliarProducts['similiaredCardPrice']}',
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.black45,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
