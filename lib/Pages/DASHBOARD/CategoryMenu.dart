import 'package:flutter/material.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/PRODUCTS_PAGES/PRODUCTS_BY_CATEGORY/KAT_PRODUCTS_PROFESIONAL/PelukisProducts.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';
import 'package:jasa_bantu/assets/AssetsIcon.dart';

AssetsColor assetsColor = AssetsColor();
AssetsIcon assetsIcon = AssetsIcon();

class CategoryMenu extends StatefulWidget {
  const CategoryMenu({super.key});

  @override
  State<CategoryMenu> createState() => _CategoryMenuState();
}

class _CategoryMenuState extends State<CategoryMenu> {
  //
  late int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  double groupAlignment = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: assetsColor.bgLightMode,
        title: Text(
          'Kategori',
          style: TextStyle(
            color: assetsColor.textBlack,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: assetsColor.bgLightMode,
        ),
        child: Row(
          children: <Widget>[
            /// NAVIGATION RAIL SCROLL MADE BY ELSAAA
            Container(
              width: 110,
              decoration: BoxDecoration(
                color: assetsColor.bgGrey200,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //
                    GestureDetector(
                      onTap: () {
                        //
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.indigo[100],
                              ),
                              child: Image.asset(
                                assetsIcon.iconKatTagihan,
                                height: 30,
                                width: 30,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Tagihan',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: assetsColor.textBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.indigo[100],
                              ),
                              child: Image.asset(
                                assetsIcon.iconKatKonsultasi,
                                height: 30,
                                width: 30,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Konsultasi',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: assetsColor.textBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.indigo[100],
                              ),
                              child: Image.asset(
                                assetsIcon.iconKatProfesional,
                                height: 30,
                                width: 30,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Profesional',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: assetsColor.textBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.indigo[100],
                              ),
                              child: Image.asset(
                                assetsIcon.iconKatHomeCleaning,
                                height: 30,
                                width: 30,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Home Cleaning',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: assetsColor.textBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.indigo[100],
                              ),
                              child: Image.asset(
                                assetsIcon.iconKatBisnis,
                                height: 30,
                                width: 30,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Bisnis',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: assetsColor.textBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.indigo[100],
                              ),
                              child: Image.asset(
                                assetsIcon.iconKatKesehatan,
                                height: 30,
                                width: 30,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Kesehatan',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: assetsColor.textBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.indigo[100],
                              ),
                              child: Image.asset(
                                assetsIcon.iconKatTenagaKerja,
                                height: 30,
                                width: 30,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Tenaga Kerja',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: assetsColor.textBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.indigo[100],
                              ),
                              child: Image.asset(
                                assetsIcon.iconKatLayananPemerintah,
                                height: 30,
                                width: 30,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Layanan Pemerintahan',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: assetsColor.textBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.indigo[100],
                              ),
                              child: Image.asset(
                                assetsIcon.iconKatKecantikan,
                                height: 30,
                                width: 30,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Kecantikan',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: assetsColor.textBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.indigo[100],
                              ),
                              child: Image.asset(
                                assetsIcon.iconKatEventOrganizer,
                                height: 30,
                                width: 30,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Event Organizer',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: assetsColor.textBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.indigo[100],
                              ),
                              child: Image.asset(
                                assetsIcon.iconKatHomeService,
                                height: 30,
                                width: 30,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Home Services',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: assetsColor.textBlack,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// MENU LIST TILE BY CATEGORY
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: assetsColor.primaryColor,
                      ),
                      child: Icon(
                        Icons.pedal_bike,
                        color: assetsColor.textWhite,
                      ),
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
                      color: assetsColor.hintText,
                    ),
                    title: Text('Item ${index + 1}'),
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PelukisProducts()),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  NavigationRailDestination _buildNavigationRailDestination({
    required String assetName,
    required String label,
  }) {
    return NavigationRailDestination(
      icon: Container(
        decoration: BoxDecoration(
          color: Colors.indigo[100],
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          assetName,
          width: 30,
          height: 30,
        ),
      ),
      label: Container(
        padding: const EdgeInsets.all(5),
        child: Text(
          label,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
