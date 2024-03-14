import 'package:flutter/material.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class OrderPages extends StatefulWidget {
  const OrderPages({super.key});

  @override
  State<OrderPages> createState() => _OrderPagesState();
}

class _OrderPagesState extends State<OrderPages> {
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
                child: Text(
                  'Pesanan',
                  style: TextStyle(
                    color: assetsColor.textBlack,
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
