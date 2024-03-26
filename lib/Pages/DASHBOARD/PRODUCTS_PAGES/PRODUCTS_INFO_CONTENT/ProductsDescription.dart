import 'package:flutter/material.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class ProductsDescription extends StatefulWidget {
  const ProductsDescription({Key? key}) : super(key: key);

  @override
  State<ProductsDescription> createState() => _ProductsDescriptionState();
}

class _ProductsDescriptionState extends State<ProductsDescription> {
  //
  bool _isDescriptionProductsExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isDescriptionProductsExpanded = !_isDescriptionProductsExpanded;
    });
  }

  ///

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Deskripsi Jasa',
            style: TextStyle(
              color: assetsColor.textBlack,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          _isDescriptionProductsExpanded
              ? Text(
            'Menghadirkan solusi kreatif dan fungsional untuk memenuhi kebutuhan estetika dan kenyamanan dalam ruang hidup Anda. Dengan fokus pada Rumah, Kantor, dan Taman, kami menawarkan berbagai layanan yang merangkum perencanaan, desain, dan implementasi proyek Anda.',
            style: TextStyle(
              color: assetsColor.hintText,
              fontSize: 15,
            ),
          )
              : Text(
            'Menghadirkan solusi kreatif dan fungsional untuk memenuhi kebutuhan estetika dan kenyamanan dalam ruang hidup Anda. Dengan fokus pada Rumah, Kantor, dan Taman, kami menawarkan berbagai layanan yang merangkum perencanaan, desain, dan implementasi proyek Anda.',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: assetsColor.hintText,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: _toggleExpanded,
            child: Container(
              padding: const EdgeInsets.all(5),
              width: double.infinity,
              decoration: BoxDecoration(
                color: assetsColor.bgGrey200,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _isDescriptionProductsExpanded ? 'Tutup' : 'Selengkapnya',
                    style: TextStyle(
                      color: assetsColor.textBlack,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    _isDescriptionProductsExpanded
                        ? Icons.expand_less
                        : Icons.expand_more,
                    color: assetsColor.textBlack,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
