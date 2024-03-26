import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class VARecommendProducts extends StatefulWidget {
  const VARecommendProducts({Key? key}) : super(key: key);

  @override
  State<VARecommendProducts> createState() => _VARecommendProductsState();
}

class _VARecommendProductsState extends State<VARecommendProducts> {
  List<Map<String, dynamic>> recommendCardData = [
    {
      'recommendCardTitle': 'Express Elite',
      'recommendCardLocation': 'Jakarta Barat',
      'recommendCardServiceName': 'Jasa Foto Produk Profesional',
      'recommendCardPrice': '80.000',
      'recommendCardPercentage': '74%',
      'recommendedCardPrice': '355.000',
      'recommendCardRating': '4.8',
      'recommendCardBannerImages':
          'assets/images/CardImages/CardContent_Banner(1).png',
      'recommendCardProfileImages':
          'assets/images/CardImages/CardContent_Profile(1).png',
    },
    {
      'recommendCardTitle': 'Zenith Group Innovation',
      'recommendCardLocation': 'Tangerang Selatan',
      'recommendCardServiceName': 'Konsultasi Desain Rumah',
      'recommendCardPrice': '150.000',
      'recommendCardPercentage': '43%',
      'recommendedCardPrice': '275.000',
      'recommendCardRating': '4.9',
      'recommendCardBannerImages':
          'assets/images/CardImages/CardContent_Banner(2).png',
      'recommendCardProfileImages':
          'assets/images/CardImages/CardContent_Profile(2).png',
    },
    {
      'recommendCardTitle': 'Sonic Flare',
      'recommendCardLocation': 'Bekasi Barat',
      'recommendCardServiceName': 'Perawatan Wajah & Kuku',
      'recommendCardPrice': '2.750.000',
      'recommendCardPercentage': '55%',
      'recommendedCardPrice': '5.200.000',
      'recommendCardRating': '4.7',
      'recommendCardBannerImages':
          'assets/images/CardImages/CardContent_Banner(3).png',
      'recommendCardProfileImages':
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
                      'Bisa bermanfaat untukmu 🪴',
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
                    recommendCardData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(5),
                      child: VARecommendProductsWidget(
                          cardDataDiscount: recommendCardData[index]),
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

class VARecommendProductsWidget extends StatelessWidget {
  final Map<String, dynamic> cardDataDiscount;

  VARecommendProductsWidget({Key? key, required this.cardDataDiscount})
      : super(key: key);

  bool showProfilePictureVARecommendProducts = true;

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
                    cardDataDiscount['recommendCardBannerImages'],
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
                          // Using hardcoded rating for now, you can replace it with cardDataDiscount['recommendCardRating']
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
                    backgroundImage: showProfilePictureVARecommendProducts
                        ? AssetImage(
                            cardDataDiscount['recommendCardProfileImages'])
                        : null,
                    child: showProfilePictureVARecommendProducts
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
                      cardDataDiscount['recommendCardTitle'],
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
                cardDataDiscount['recommendCardLocation'],
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
                cardDataDiscount['recommendCardServiceName'],
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
                    'Rp${cardDataDiscount['recommendCardPrice']}',
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
                    cardDataDiscount['recommendCardPercentage'],
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Rp${cardDataDiscount['recommendedCardPrice']}',
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
