import 'package:flutter/material.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/HOMEPAGES/HomePages.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class DashboardPages extends StatefulWidget {
  const DashboardPages({super.key});

  @override
  State<DashboardPages> createState() => _DashboardPagesState();
}

class _DashboardPagesState extends State<DashboardPages> {
  int _selectedIndexMenuNavBar = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndexMenuNavBar);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: assetsColor.bgGrey200,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndexMenuNavBar = index;
          });
        },
        children: const [
          HomePages(),
          // Halaman-halaman lainnya
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: assetsColor.bgLightMode,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndexMenuNavBar,
        onTap: _onMenuNavBarItem,
        selectedItemColor: assetsColor.indicatorPrimary,
        unselectedItemColor: assetsColor.indicatorDefault,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: 'Jasamu'),
          BottomNavigationBarItem(icon: Icon(Icons.post_add), label: 'Pesanan'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_outlined), label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'Profil'),
        ],
      ),
    );
  }

  void _onMenuNavBarItem(int index) {
    setState(() {
      _selectedIndexMenuNavBar = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceIn,
    );
  }
}
