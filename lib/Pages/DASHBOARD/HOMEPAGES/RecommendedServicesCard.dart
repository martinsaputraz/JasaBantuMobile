import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class RecommendedServices extends StatefulWidget {
  const RecommendedServices({Key? key}) : super(key: key);

  @override
  State<RecommendedServices> createState() => _RecommendedServicesState();
}

class _RecommendedServicesState extends State<RecommendedServices> {
  List<Map<String, dynamic>> recommendedServicesData = [
    {
      'recommendCardTitle': 'Story Bots',
      'recommendCardLocation': 'Tangerang Selatan',
      'recommendCardPromoType': 'Promo Gajian',
      'recommendCardPromoBoxColor': Colors.deepOrange,
      'recommendCardServiceName': 'Konsultasi Desain Interior Rumah, Kantor',
      'recommendCardTimesServicesUsed': '25',
      'recommendCardPrice': '150.000',
      'recommendCardDiscountPercentage': '40%',
      'recommendCardDiscountedPrice': '275.000',
      'recommendCardRating': '4.9',
      'recommendCardBannerImages':
          'assets/images/CardImages/CardContent_Banner(1).png',
      'recommendCardProfileImages':
          'assets/images/CardImages/CardContent_Profile(1).png',
    },
    {
      'recommendCardTitle': 'Again Faster',
      'recommendCardLocation': 'Jakarta Utara',
      'recommendCardPromoType': 'Promo Gajian',
      'recommendCardPromoBoxColor': Colors.deepOrange,
      'recommendCardServiceName': 'Konsultasi Desain Interior Rumah, Kantor',
      'recommendCardTimesServicesUsed': '39',
      'recommendCardPrice': '150.000',
      'recommendCardDiscountPercentage': '40%',
      'recommendCardDiscountedPrice': '275.000',
      'recommendCardRating': '5.0',
      'recommendCardBannerImages':
          'assets/images/CardImages/CardContent_Banner(4).png',
      'recommendCardProfileImages':
          'assets/images/CardImages/CardContent_Profile(4).png',
    },
    {
      'recommendCardTitle': 'Anika Lifestyle Service',
      'recommendCardLocation': 'Jakarta Barat',
      'recommendCardPromoType': 'Promo Gajian',
      'recommendCardPromoBoxColor': Colors.purple,
      'recommendCardServiceName': 'Konsultasi Desain Interior Rumah, Kantor',
      'recommendCardTimesServicesUsed': '548',
      'recommendCardPrice': '150.000',
      'recommendCardDiscountPercentage': '40%',
      'recommendCardDiscountedPrice': '275.000',
      'recommendCardRating': '4.5',
      'recommendCardBannerImages':
          'assets/images/CardImages/CardContent_Banner(5).png',
      'recommendCardProfileImages':
          'assets/images/CardImages/CardContent_Profile(5).png',
    },
    {
      'recommendCardTitle': 'Story Bots',
      'recommendCardLocation': 'Tangerang Selatan',
      'recommendCardPromoType': 'Promo Gajian',
      'recommendCardPromoBoxColor': Colors.purple,
      'recommendCardServiceName': 'Konsultasi Desain Interior Rumah, Kantor',
      'recommendCardTimesServicesUsed': '120',
      'recommendCardPrice': '150.000',
      'recommendCardDiscountPercentage': '40%',
      'recommendCardDiscountedPrice': '275.000',
      'recommendCardRating': '4.4',
      'recommendCardBannerImages':
          'assets/images/CardImages/CardContent_Banner(6).png',
      'recommendCardProfileImages':
          'assets/images/CardImages/CardContent_Profile(6).png',
    },
    // Add more data entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(maxHeight: 950),
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star_border,
                    color: assetsColor.textPrimary,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Rekomendasi',
                    style: TextStyle(
                      fontSize: 18,
                      color: assetsColor.textPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                'Jasa yang mungkin kamu butuh',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: assetsColor.textBlack),
              ),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 0.45,
                ),
                itemCount: recommendedServicesData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: SurroundingServicesWidget(
                      cardSurroundingServices: recommendedServicesData[index],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SurroundingServicesWidget extends StatelessWidget {
  final Map<String, dynamic> cardSurroundingServices;

  SurroundingServicesWidget({Key? key, required this.cardSurroundingServices})
      : super(key: key);

  bool showImage = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: assetsColor.bgLightMode,
        ),
        constraints: const BoxConstraints(
          maxWidth: 180,
          maxHeight: 500,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// PROFILE IMAGE & BANNER AREA
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    cardSurroundingServices['recommendCardBannerImages'],
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(Icons.star, color: Colors.amber),
                        const SizedBox(width: 5),
                        Text(cardSurroundingServices['recommendCardRating'],
                            style: TextStyle(color: assetsColor.textWhite)),
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
                    backgroundImage: showImage
                        ? AssetImage(cardSurroundingServices[
                            'recommendCardProfileImages'])
                        : null,
                    child: showImage ? null : const Text('EP'),
                  ),
                ),
              ],
            ),

            /// MITRA'S NAME & MITRA'S LOCATION
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      cardSurroundingServices['recommendCardTitle'],
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
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
              child: Text(
                cardSurroundingServices['recommendCardLocation'],
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: assetsColor.hintText,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ),

            /// SERVICE AREA
            /// SERVICE'S PROMO TYPE
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Container(
                constraints: const BoxConstraints(
                  maxHeight: 50,
                  maxWidth: 150,
                ),
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color:
                        cardSurroundingServices['recommendCardPromoBoxColor'],
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.confirmation_num_outlined,
                      color:
                          cardSurroundingServices['recommendCardPromoBoxColor'],
                    ),
                    const SizedBox(width: 5),
                    Text(
                      cardSurroundingServices['recommendCardPromoType'],
                      style: TextStyle(
                          color: cardSurroundingServices[
                              'recommendCardPromoBoxColor']),
                    ),
                  ],
                ),
              ),
            ),

            /// SERVICE'S NAME
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                cardSurroundingServices['recommendCardServiceName'],
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),

            /// TIMES SERVICE'S USED
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Row(
                children: [
                  Text(
                    '${cardSurroundingServices['recommendCardTimesServicesUsed']}x',
                    style: TextStyle(
                      color: assetsColor.hintText,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'digunakan',
                    style: TextStyle(
                      color: assetsColor.hintText,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            /// PRICE AREA
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Mulai dari',
                style: TextStyle(color: assetsColor.hintText, fontSize: 15),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Text(
                    'Rp${cardSurroundingServices['recommendCardPrice']}',
                    style: const TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ' /pcs',
                    style: TextStyle(
                      color: assetsColor.hintText,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.percent_rounded,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    cardSurroundingServices['recommendCardDiscountPercentage'],
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Rp${cardSurroundingServices['recommendCardDiscountedPrice']}',
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: assetsColor.hintText,
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
