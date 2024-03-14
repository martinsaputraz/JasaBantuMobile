import 'package:flutter/material.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/QRScanScreen.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class ProductsPages extends StatefulWidget {
  const ProductsPages({super.key});

  @override
  State<ProductsPages> createState() => _ProductsPagesState();
}

class _ProductsPagesState extends State<ProductsPages> {
  /// FOR "SEARCH"
  TextEditingController searchProductsPagesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: assetsColor.bgGrey,
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
                          controller: searchProductsPagesController,
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
      body: Center(
        child: Text(
          'This Pages is Coming Soon',
          style: TextStyle(
            color: assetsColor.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
