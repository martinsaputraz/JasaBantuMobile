import 'package:flutter/material.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class ProductsTitle extends StatefulWidget {
  const ProductsTitle({Key? key}) : super(key: key);

  @override
  State<ProductsTitle> createState() => _ProductsTitleState();
}

class _ProductsTitleState extends State<ProductsTitle> {
  late bool saveToWishlist = false;
  late bool isRumahSelected = false;
  late bool isKantorSelected = false;
  late bool isTamanSelected = false;
  late bool isCustomSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: assetsColor.bgLightMode,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// BOX PROMO TEXT
          /// JIKA ADA
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            width: 140,
            decoration: BoxDecoration(
              border: Border.all(
                color: assetsColor.textPrimary,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.local_activity_outlined,
                  color: assetsColor.textPrimary,
                ),
                const SizedBox(width: 10),
                Text(
                  'Promo Gajian',
                  style: TextStyle(
                    color: assetsColor.textPrimary,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          /// TITLE PRODUCTS
          Text(
            'Konsultasi dan Jasa Desain Interior Rumah, Kantor dan Taman - Kantor',
            maxLines: 3,
            style: TextStyle(
              color: assetsColor.textBlack,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),

          /// MITRA'S LOCATION TEXT
          Text(
            'Pondok Indah, Jakarta Selatan',
            style: TextStyle(
              color: assetsColor.hintText,
            ),
          ),

          const SizedBox(height: 20),
          Row(
            children: [
              /// BOX "RATING"
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: assetsColor.hintText,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '4.8 (1.5K+)',
                      style: TextStyle(
                        color: assetsColor.textBlack,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              /// BUTTON "SAVE TO WISHLIST"
              GestureDetector(
                onTap: () {
                  setState(() {
                    saveToWishlist = !saveToWishlist;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      saveToWishlist ? Icons.favorite : Icons.favorite_border,
                      color: saveToWishlist ? Colors.red : assetsColor.hintText,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      saveToWishlist ? 'Disimpan' : 'Simpan',
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

          /// VARIANT BOX
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                buildVariantProductsGestureDetector(
                  'Rumah',
                  isRumahSelected,
                  () {
                    setState(() {
                      isRumahSelected = true;
                      isKantorSelected = false;
                      isTamanSelected = false;
                      isCustomSelected = false;
                    });
                  },
                ),
                const SizedBox(width: 5),
                buildVariantProductsGestureDetector(
                  'Kantor',
                  isKantorSelected,
                  () {
                    setState(() {
                      isRumahSelected = false;
                      isKantorSelected = true;
                      isTamanSelected = false;
                      isCustomSelected = false;
                    });
                  },
                ),
                const SizedBox(width: 5),
                buildVariantProductsGestureDetector(
                  'Taman',
                  isTamanSelected,
                  () {
                    setState(() {
                      isRumahSelected = false;
                      isKantorSelected = false;
                      isTamanSelected = true;
                      isCustomSelected = false;
                    });
                  },
                ),
                const SizedBox(width: 5),
                buildVariantProductsGestureDetector(
                  'Custom',
                  isCustomSelected,
                  () {
                    setState(() {
                      isRumahSelected = false;
                      isKantorSelected = false;
                      isTamanSelected = false;
                      isCustomSelected = true;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector buildVariantProductsGestureDetector(
    String text,
    bool isSelected,
    void Function() onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.transparent : assetsColor.hintText,
          ),
          borderRadius: BorderRadius.circular(5),
          color: isSelected ? assetsColor.primaryColor : Colors.transparent,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? assetsColor.textWhite : assetsColor.hintText,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
