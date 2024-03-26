import 'package:flutter/material.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/PRODUCTS_PAGES/PRODUCTS_INFO_CONTENT/ExpertiseCertificatesMitra.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/PRODUCTS_PAGES/PRODUCTS_INFO_CONTENT/MitraExperiences.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/PRODUCTS_PAGES/PRODUCTS_INFO_CONTENT/MitraPortofolio.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/PRODUCTS_PAGES/PRODUCTS_INFO_CONTENT/ProductsCarouselInfo.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/PRODUCTS_PAGES/PRODUCTS_INFO_CONTENT/ProductsDescription.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/PRODUCTS_PAGES/PRODUCTS_INFO_CONTENT/ProductsMitraProfile.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/PRODUCTS_PAGES/PRODUCTS_INFO_CONTENT/ProductsPrice.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/PRODUCTS_PAGES/PRODUCTS_INFO_CONTENT/ProductsReview.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/PRODUCTS_PAGES/PRODUCTS_INFO_CONTENT/ProductsTitle.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/PRODUCTS_PAGES/PRODUCTS_INFO_CONTENT/SimiliarProducts.dart';
import 'package:jasa_bantu/Pages/TRANSACTION/PAYMENTS/PaymentsPages.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class ProductsInfo extends StatefulWidget {
  const ProductsInfo({super.key});

  @override
  State<ProductsInfo> createState() => _ProductsInfoState();
}

class _ProductsInfoState extends State<ProductsInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: assetsColor.bgGrey200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: assetsColor.bgLightMode,
          automaticallyImplyLeading: false,
          title: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: assetsColor.hintText,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_outlined,
                color: assetsColor.hintText,
              ),
            ),
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
      body: ListView(
        shrinkWrap: true,
        addAutomaticKeepAlives: false,
        cacheExtent: 100.0,
        children: const [
          //
          /// CAROUSEL IMAGE
          ProductsCarouselInfo(),

          /// PRODUCTS INFO TITLE
          ProductsTitle(),

          /// PRODUCTS PRICE
          ProductsPrice(),

          /// MITRA PROFILE
          ProductsMitraProfile(),
          SizedBox(height: 10),

          /// DESCRIPTION PRODUCTS
          ProductsDescription(),
          SizedBox(height: 10),

          /// PRODUCTS REVIEW
          ProductsReview(),
          SizedBox(height: 10),

          /// MITRA CERTIFICATES
          ExpertiseCertificatesMitra(),
          SizedBox(height: 10),

          /// MITRA PORTOFOLIO
          MitraPortofolio(),
          SizedBox(height: 10),

          /// MITRA EXPERIENCES
          MitraExperiences(),
          SizedBox(height: 10),

          /// SIMILIAR PRODUCTS
          SimiliarProducts(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: assetsColor.bgLightMode,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: assetsColor.hintText,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: IconButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const PaymentsPages()),
                  // );
                },
                style: IconButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
                icon: Icon(
                  Icons.chat_outlined,
                  color: assetsColor.textBlack,
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PaymentsPages()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: assetsColor.buttonPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: Text(
                  'Selesai & Lanjutkan',
                  style: TextStyle(
                    color: assetsColor.textWhite,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
