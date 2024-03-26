import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/QRScanScreen.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/PRODUCTS_PAGES/PRODUCTS_INFO_CONTENT/ProductsInfo.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class PelukisProducts extends StatefulWidget {
  const PelukisProducts({super.key});

  @override
  State<PelukisProducts> createState() => _PelukisProductsState();
}

class _PelukisProductsState extends State<PelukisProducts> {
  /// FOR "SEARCH"
  TextEditingController searchPelukisProductsController =
      TextEditingController();

  /// LIST MENU GRID
  final List<Map<String, dynamic>> gridProductsProfesionalItems = [
    {
      'gridProductsProfesionalIcon': Icons.translate,
      'gridProductsProfesionalText': 'Translator',
      // 'gridMenuRoutes': '/tagihan',
    },
    {
      'gridProductsProfesionalIcon': Icons.description,
      'gridProductsProfesionalText': 'Biro Jasa',
      // 'gridMenuRoutes': '/consult',
    },
    {
      'gridProductsProfesionalIcon': Icons.flatware,
      'gridProductsProfesionalText': 'Private Chef',
      // 'gridMenuRoutes': '/business',
    },
    {
      'gridProductsProfesionalIcon': Icons.man_4,
      'gridProductsProfesionalText': 'Bodyguard',
      // 'gridMenuRoutes': '/health',
    },
    {
      'gridProductsProfesionalIcon': Icons.camera_alt_outlined,
      'gridProductsProfesionalText': 'Photographer',
      // 'gridMenuRoutes': '/beauty',
    },
    {
      'gridProductsProfesionalIcon': Icons.video_camera_front_outlined,
      'gridProductsProfesionalText': 'Videographer',
      // 'gridMenuRoutes': '/donate',
    },
    {
      'gridProductsProfesionalIcon': Icons.image_outlined,
      'gridProductsProfesionalText': 'Design',
      // 'gridMenuRoutes': '/reservation',
    },
    {
      'gridProductsProfesionalIcon': Icons.celebration_outlined,
      'gridProductsProfesionalText': 'Decoration',
      // 'gridMenuRoutes': '/professional',
    },
  ];

  ///
  List<Map<String, dynamic>> productsProfessionalCardData = [
    {
      'productsProfessionalCardTitle': 'Story Bots',
      'productsProfessionalCardLocation': 'Tangerang Selatan',
      'productsProfessionalCardPromoType': 'Promo Gajian',
      'productsProfessionalCardPromoBoxColor': Colors.deepOrange,
      'productsProfessionalCardServiceName':
          'Konsultasi Desain Interior Rumah, Kantor',
      'productsProfessionalCardTimesServicesUsed': '25',
      'productsProfessionalCardPrice': '150.000',
      'productsProfessionalCardDiscountPercentage': '40%',
      'productsProfessionalCardDiscountedPrice': '275.000',
      'productsProfessionalCardRating': '4.9',
      'productsProfessionalCardBannerImages':
          'assets/images/CardImages/CardContent_Banner(1).png',
      'productsProfessionalCardProfileImages':
          'assets/images/CardImages/CardContent_Profile(1).png',
    },
    {
      'productsProfessionalCardTitle': 'Again Faster',
      'productsProfessionalCardLocation': 'Jakarta Utara',
      'productsProfessionalCardPromoType': 'Promo Gajian',
      'productsProfessionalCardPromoBoxColor': Colors.deepOrange,
      'productsProfessionalCardServiceName':
          'Konsultasi Desain Interior Rumah, Kantor',
      'productsProfessionalCardTimesServicesUsed': '39',
      'productsProfessionalCardPrice': '150.000',
      'productsProfessionalCardDiscountPercentage': '40%',
      'productsProfessionalCardDiscountedPrice': '275.000',
      'productsProfessionalCardRating': '5.0',
      'productsProfessionalCardBannerImages':
          'assets/images/CardImages/CardContent_Banner(4).png',
      'productsProfessionalCardProfileImages':
          'assets/images/CardImages/CardContent_Profile(4).png',
    },
    {
      'productsProfessionalCardTitle': 'Anika Lifestyle Service',
      'productsProfessionalCardLocation': 'Jakarta Barat',
      'productsProfessionalCardPromoType': 'Promo Gajian',
      'productsProfessionalCardPromoBoxColor': Colors.purple,
      'productsProfessionalCardServiceName':
          'Konsultasi Desain Interior Rumah, Kantor',
      'productsProfessionalCardTimesServicesUsed': '548',
      'productsProfessionalCardPrice': '150.000',
      'productsProfessionalCardDiscountPercentage': '40%',
      'productsProfessionalCardDiscountedPrice': '275.000',
      'productsProfessionalCardRating': '4.5',
      'productsProfessionalCardBannerImages':
          'assets/images/CardImages/CardContent_Banner(5).png',
      'productsProfessionalCardProfileImages':
          'assets/images/CardImages/CardContent_Profile(5).png',
    },
    {
      'productsProfessionalCardTitle': 'Story Bots',
      'productsProfessionalCardLocation': 'Tangerang Selatan',
      'productsProfessionalCardPromoType': 'Promo Gajian',
      'productsProfessionalCardPromoBoxColor': Colors.purple,
      'productsProfessionalCardServiceName':
          'Konsultasi Desain Interior Rumah, Kantor',
      'productsProfessionalCardTimesServicesUsed': '120',
      'productsProfessionalCardPrice': '150.000',
      'productsProfessionalCardDiscountPercentage': '40%',
      'productsProfessionalCardDiscountedPrice': '275.000',
      'productsProfessionalCardRating': '4.4',
      'productsProfessionalCardBannerImages':
          'assets/images/CardImages/CardContent_Banner(6).png',
      'productsProfessionalCardProfileImages':
          'assets/images/CardImages/CardContent_Profile(6).png',
    },
    // Add more data entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: assetsColor.bgGrey200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: assetsColor.bgLightMode,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: assetsColor.bgGrey200,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchPelukisProductsController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Cari di Jasa Bantu...',
                            hintStyle: TextStyle(
                              color: assetsColor.hintText,
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                            ),
                            border: InputBorder.none,
                            prefixIcon:
                                Icon(Icons.search, color: assetsColor.hintText),
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        // Atur tinggi garis sesuai kebutuhan
                        width: 1.0,
                        // Lebar garis, Anda bisa atur sesuai kebutuhan
                        color: assetsColor.hintText, // Warna garis
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.qr_code_scanner,
                          color: assetsColor.hintText,
                        ),
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const QRScanScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_outlined,
                color: assetsColor.hintText,
              ),
            ),
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(
            //     Icons.notifications,
            //     color: assetsColor.hintText,
            //   ),
            // ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.local_mall_outlined,
                color: assetsColor.hintText,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu_outlined,
                color: assetsColor.hintText,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: assetsColor.bgLightMode,
            ),
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  gridProductsProfesionalItems.length,
                  (index) {
                    final item = gridProductsProfesionalItems[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: GridProductsProfesionalTile(
                        gridProductsProfesionalIcon:
                            item['gridProductsProfesionalIcon'],
                        gridProductsProfesionalText:
                            item['gridProductsProfesionalText'],
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => const CategoryMenu()),
                          // );
                          // Navigator.pushNamed(context, item['gridMenuRoutes']);
                        },
                        // gridMenuRoutes: item['gridMenuRoutes'],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            height: 70,
            decoration: BoxDecoration(
              color: assetsColor.bgLightMode,
            ),
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: assetsColor.borderDefault,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: assetsColor.textBlack,
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Rumah Saya',
                          style: TextStyle(
                            color: assetsColor.textBlack,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: assetsColor.borderDefault,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.filter_list_outlined,
                          color: assetsColor.textBlack,
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Filter',
                          style: TextStyle(
                            color: assetsColor.textBlack,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: assetsColor.borderDefault,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      '24 Jam',
                      style: TextStyle(
                        color: assetsColor.textBlack,
                        fontSize: 15,
                      ),
                    ),
                  ),

                  ///
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: assetsColor.borderDefault,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Gratis ongkos',
                      style: TextStyle(
                        color: assetsColor.textBlack,
                        fontSize: 15,
                      ),
                    ),
                  ),

                  ///
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: assetsColor.borderDefault,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Paling dekat',
                      style: TextStyle(
                        color: assetsColor.textBlack,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: assetsColor.borderDefault,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Terverifikasi',
                      style: TextStyle(
                        color: assetsColor.textBlack,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// CARD LIST PRODUCTS
          Expanded(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                decoration: BoxDecoration(
                  color: assetsColor.bgLightMode,
                ),
                padding: const EdgeInsets.all(5),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 0.48,
                  ),
                  itemCount: productsProfessionalCardData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: ProductsProfessionalCardWidget(
                        cardProductsProfessional:
                            productsProfessionalCardData[index],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GridProductsProfesionalTile extends StatelessWidget {
  final IconData gridProductsProfesionalIcon;
  final String gridProductsProfesionalText;
  final VoidCallback onPressed;

  // final String gridMenuRoutes;

  const GridProductsProfesionalTile({
    super.key,
    required this.gridProductsProfesionalIcon,
    required this.gridProductsProfesionalText,
    required this.onPressed,
    // required this.gridMenuRoutes,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => const PaymentsPages()),
      //   );
      // },
      // onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IntrinsicWidth(
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: assetsColor.primaryColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Icon(
                gridProductsProfesionalIcon,
                size: 20,
                color: assetsColor.textWhite,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            gridProductsProfesionalText,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              color: assetsColor.textBlack,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductsProfessionalCardWidget extends StatelessWidget {
  final Map<String, dynamic> cardProductsProfessional;

  ProductsProfessionalCardWidget(
      {Key? key, required this.cardProductsProfessional})
      : super(key: key);

  bool showImage = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProductsInfo()),
        );
      },
      // onPressed,
      child: Card(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: assetsColor.bgLightMode,
          ),
          constraints: const BoxConstraints(
            maxWidth: 180,
            maxHeight: 350,
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
                      cardProductsProfessional[
                          'productsProfessionalCardBannerImages'],
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
                          Text(
                              cardProductsProfessional[
                                  'productsProfessionalCardRating'],
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
                          ? AssetImage(cardProductsProfessional[
                              'productsProfessionalCardProfileImages'])
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
                        cardProductsProfessional[
                            'productsProfessionalCardTitle'],
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
                  cardProductsProfessional['productsProfessionalCardLocation'],
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
                      color: cardProductsProfessional[
                          'productsProfessionalCardPromoBoxColor'],
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.confirmation_num_outlined,
                        color: cardProductsProfessional[
                            'productsProfessionalCardPromoBoxColor'],
                      ),
                      const SizedBox(width: 5),
                      Text(
                        cardProductsProfessional[
                            'productsProfessionalCardPromoType'],
                        style: TextStyle(
                            color: cardProductsProfessional[
                                'productsProfessionalCardPromoBoxColor']),
                      ),
                    ],
                  ),
                ),
              ),

              /// SERVICE'S NAME
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(
                  cardProductsProfessional[
                      'productsProfessionalCardServiceName'],
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
                      '${cardProductsProfessional['productsProfessionalCardTimesServicesUsed']}x',
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
                      'Rp${cardProductsProfessional['productsProfessionalCardPrice']}',
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
                      cardProductsProfessional[
                          'productsProfessionalCardDiscountPercentage'],
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Rp${cardProductsProfessional['productsProfessionalCardDiscountedPrice']}',
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
      ),
    );
  }
}
