import 'package:flutter/material.dart';
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
            Container(
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
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.indigo[100],
                              ),
                              child: Image.asset(
                                assetsIcon.iconKatTagihan,
                                height: 50,
                                width: 50,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Tagihan',
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

            ///
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
                    onTap: () {
                      // Handle item tap here
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
