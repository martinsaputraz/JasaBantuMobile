import 'package:flutter/material.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class ProductsReview extends StatefulWidget {
  const ProductsReview({Key? key}) : super(key: key);

  @override
  State<ProductsReview> createState() => _ProductsReviewState();
}

class _ProductsReviewState extends State<ProductsReview>
    with TickerProviderStateMixin {
  late TabController _reviewsTabController;
  late int selectedReviewsTabIndex;

  @override
  void initState() {
    super.initState();
    _reviewsTabController = TabController(length: 2, vsync: this);
    selectedReviewsTabIndex = _reviewsTabController.index;
    _reviewsTabController.addListener(() {
      setState(() {
        selectedReviewsTabIndex = _reviewsTabController.index;
      });
    });
  }

  @override
  void dispose() {
    _reviewsTabController.dispose();
    super.dispose();
  }

  late bool isLikedReview = false;

  /// LIST DATA REVIEWER
  List<Map<String, dynamic>> reviewersCardData = [
    {
      'reviewersCardProfilePhotos':
          'assets/images/CardImages/CardContent_Profile(1).png',
      'reviewersCardUsernames': 'Jennyfer Ken',
      'reviewersCardPeriode': '20 Jan - 18 Mar 2024',
      'reviewersCardRates': '5/5',
      'reviewersCardVariant': 'Rumah 27m2',
      'reviewersCardProducts': 'Design Rumah Tropical 2 Lantai',
      'reviewersCardDetailsReview':
          'Arsitek sangat berpengalaman dan hasil yang sangat bagus serta memberikan banyak sekali opsi untuk saya jadi bahan pertimbangan',
      'reviewersCardNumberUserAgreed': '7',
      'reviewersCardNumberPhotos': null,
    },
    {
      'reviewersCardProfilePhotos':
          'assets/images/CardImages/CardContent_Profile(2).png',
      'reviewersCardUsernames': 'Margareth8077',
      'reviewersCardPeriode': '13 Jan - 28 Feb 2024',
      'reviewersCardRates': '5/5',
      'reviewersCardVariant': 'Rumah 149m2',
      'reviewersCardProducts': 'Konsultasi Interior Bergaya Industrial',
      'reviewersCardDetailsReview':
          'Sangat bagus dari masukan dan layout kantor saya sebagai agency dan saya senang.',
      'reviewersCardNumberUserAgreed': null,
      'reviewersCardNumberPhotos': null,
    },
    // Add more data entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: assetsColor.bgLightMode,
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context)
          .size
          .height, // Set a fixed height or use other height constraints
      child: Column(
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Penilaian Jasa',
                      style: TextStyle(
                        color: assetsColor.textBlack,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '4.8/5 (93 Penyewa)',
                          style: TextStyle(
                            color: assetsColor.textBlack,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    //
                  },
                  child: Text(
                    'Lihat semua',
                    style: TextStyle(
                      color: assetsColor.hintText,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          TabBar(
            controller: _reviewsTabController,
            indicatorColor: assetsColor.primaryColor,
            labelPadding: const EdgeInsets.symmetric(horizontal: 1.0),
            tabs: <Widget>[
              _buildTabReviews('Dengan ulasan', 0),
              _buildTabReviews('Tanpa ulasan', 1),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _reviewsTabController,
              children: [
                // Content for 'Dengan Ulasan'
                _buildTabReview('Dengan Ulasan', 0), // Menampilkan data pertama
                _buildTabReview('Dengan Ulasan', 1), // Menampilkan data kedua
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabReviews(String title, int index) {
    return Tab(
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          color: selectedReviewsTabIndex == index
              ? assetsColor.primaryColor
              : assetsColor.hintText,
          fontWeight: selectedReviewsTabIndex == index
              ? FontWeight.bold
              : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildTabReview(String tabTitle, int index) {
    final Map<String, dynamic> reviewerData = reviewersCardData[index];
    if (tabTitle == 'Dengan Ulasan') {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///
            Row(
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage(reviewerData['reviewersCardProfilePhotos']),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      reviewerData['reviewersCardUsernames'],
                      style: TextStyle(
                        color: assetsColor.textBlack,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      reviewerData['reviewersCardPeriode'],
                      style: TextStyle(
                        color: assetsColor.hintText,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isLikedReview = !isLikedReview;
                    });
                  },
                  icon: Icon(
                    isLikedReview ? Icons.thumb_up : Icons.thumb_up_outlined,
                    color: isLikedReview
                        ? assetsColor.textPrimary
                        : assetsColor.hintText,
                    size: 25,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            ///
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20,
                ),
                const SizedBox(width: 5),
                Text(
                  reviewerData['reviewersCardRates'],
                  style: TextStyle(
                    color: assetsColor.textBlack,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  reviewerData['reviewersCardVariant'],
                  style: TextStyle(
                    color: assetsColor.textBlack,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),

            ///
            Text(
              reviewerData['reviewersCardProducts'],
              style: TextStyle(
                color: assetsColor.textBlack,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              reviewerData['reviewersCardDetailsReview'],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: assetsColor.hintText,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10),
            //
            Text(
              reviewerData['reviewersCardNumberUserAgreed'] != null
                  ? '${reviewerData['reviewersCardNumberUserAgreed']} pengguna setuju'
                  : '',
              style: TextStyle(
                color: assetsColor.hintText,
                fontSize: 15,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///
            Row(
              children: [
                const CircleAvatar(),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jennyfer Ken',
                      style: TextStyle(
                        color: assetsColor.textBlack,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '20 Jan - 18 Mar 2024',
                      style: TextStyle(
                        color: assetsColor.hintText,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10),

            ///
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20,
                ),
                const SizedBox(width: 5),
                Text(
                  '5/5',
                  style: TextStyle(
                    color: assetsColor.textBlack,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  'Rumah 27m2',
                  style: TextStyle(
                    color: assetsColor.textBlack,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }
}
