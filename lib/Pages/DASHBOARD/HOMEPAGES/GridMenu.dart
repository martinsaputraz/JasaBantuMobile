import 'package:flutter/material.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/CategoryMenu.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';
import 'package:jasa_bantu/assets/AssetsIcon.dart';

AssetsColor assetsColor = AssetsColor();
AssetsIcon assetsIcon = AssetsIcon();

class GridMenu extends StatefulWidget {
  const GridMenu({super.key});

  @override
  State<GridMenu> createState() => _GridMenuState();
}

class _GridMenuState extends State<GridMenu> {
  /// LIST MENU GRID
  final List<Map<String, dynamic>> gridMenuItems = [
    {
      'gridMenuIcon': assetsIcon.iconKatTagihan,
      'gridMenuText': 'Tagihan',
      // 'gridMenuRoutes': '/tagihan',
    },
    {
      'gridMenuIcon': assetsIcon.iconKatKonsultasi,
      'gridMenuText': 'Konsultasi',
      // 'gridMenuRoutes': '/consult',
    },
    {
      'gridMenuIcon': assetsIcon.iconKatBisnis,
      'gridMenuText': 'Bisnis',
      // 'gridMenuRoutes': '/business',
    },
    {
      'gridMenuIcon': assetsIcon.iconKatKesehatan,
      'gridMenuText': 'Kesehatan',
      // 'gridMenuRoutes': '/health',
    },
    {
      'gridMenuIcon': assetsIcon.iconKatKecantikan,
      'gridMenuText': 'Kecantikan',
      // 'gridMenuRoutes': '/beauty',
    },
    {
      'gridMenuIcon': assetsIcon.iconKatDonasi,
      'gridMenuText': 'Donasi',
      // 'gridMenuRoutes': '/donate',
    },
    {
      'gridMenuIcon': assetsIcon.iconKatReservasi,
      'gridMenuText': 'Reservasi',
      // 'gridMenuRoutes': '/reservation',
    },
    {
      'gridMenuIcon': assetsIcon.iconKatProfesional,
      'gridMenuText': 'Profesional',
      // 'gridMenuRoutes': '/professional',
    },
    {
      'gridMenuIcon': assetsIcon.iconKatHomeCleaning,
      'gridMenuText': 'Home Cleaning',
      // 'gridMenuRoutes': '/homecleaning',
    },
    {
      'gridMenuIcon': assetsIcon.iconKatTenagaKerja,
      'gridMenuText': 'Tenaga Kerja',
      // 'gridMenuRoutes': '/labor',
    },
    {
      'gridMenuIcon': assetsIcon.iconKatHewanPeliharaan,
      'gridMenuText': 'Hewan Peliharaan',
      // 'gridMenuRoutes': '/pets',
    },
    {
      'gridMenuIcon': assetsIcon.iconKatLayananPemerintah,
      'gridMenuText': 'Layanan Pemerintah',
      // 'gridMenuRoutes': '/governmentservices',
    },
    {
      'gridMenuIcon': assetsIcon.iconKatEventOrganizer,
      'gridMenuText': 'Event Organizer',
      // 'gridMenuRoutes': '/eventorganizer',
    },
    {
      'gridMenuIcon': assetsIcon.iconKatHomeService,
      'gridMenuText': 'Home Service',
      // 'gridMenuRoutes': '/homeservice',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: assetsColor.bgLightMode,
      ),
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
      child: GridView.builder(
        itemCount: gridMenuItems.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 60,
          crossAxisSpacing: 30,
          // mainAxisSpacing: 1,
        ),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final item = gridMenuItems[index];
          return GridTile(
            child: GridMenuTile(
              gridMenuIcon: item['gridMenuIcon'],
              gridMenuText: item['gridMenuText'],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CategoryMenu()),
                );
                // Navigator.pushNamed(context, item['gridMenuRoutes']);
              },
              // gridMenuRoutes: item['gridMenuRoutes'],
            ),
          );
        },
      ),
    );
  }
}

class GridMenuTile extends StatelessWidget {
  final String gridMenuIcon;
  final String gridMenuText;
  final VoidCallback onPressed;

  // final String gridMenuRoutes;

  const GridMenuTile({
    super.key,
    required this.gridMenuIcon,
    required this.gridMenuText,
    required this.onPressed,
    // required this.gridMenuRoutes,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          //     () {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => const CategoryMenu()),
          //   );
          // },
          onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IntrinsicWidth(
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.indigo[50],
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                gridMenuIcon,
                height: 40,
                width: 40,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            gridMenuText,
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
