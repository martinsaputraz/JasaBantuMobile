import 'package:flutter/material.dart';
import 'package:jasa_bantu/Pages/DASHBOARD/Notifications/AllNotifications.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class NotificationsPages extends StatefulWidget {
  const NotificationsPages({Key? key}) : super(key: key);

  @override
  State<NotificationsPages> createState() => _NotificationsPagesState();
}

class _NotificationsPagesState extends State<NotificationsPages>
    with TickerProviderStateMixin {
  late final TabController _notificationsTabController;
  late int selectedNotificationsTabIndex;

  @override
  void initState() {
    super.initState();
    _notificationsTabController = TabController(length: 4, vsync: this);
    selectedNotificationsTabIndex = _notificationsTabController.index;
    _notificationsTabController.addListener(() {
      setState(() {
        selectedNotificationsTabIndex = _notificationsTabController.index;
      });
    });
  }

  @override
  void dispose() {
    _notificationsTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: assetsColor.bgGrey200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: assetsColor.bgLightMode,
          title: Text(
            'Notifikasi',
            style: TextStyle(
              color: assetsColor.textBlack,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                //
              },
              icon: Icon(
                Icons.local_mall_outlined,
                color: assetsColor.hintText,
              ),
            ),
            IconButton(
              onPressed: () {
                //
              },
              icon: Icon(
                Icons.menu_outlined,
                color: assetsColor.hintText,
              ),
            ),
          ],
          bottom: TabBar(
            controller: _notificationsTabController,
            indicatorColor: assetsColor.primaryColor,
            labelPadding: const EdgeInsets.symmetric(horizontal: 1.0),
            tabs: <Widget>[
              _buildTabNotifications('Semua', 0),
              _buildTabNotifications('Transaksi', 1),
              _buildTabNotifications('Promo & Voucher', 2),
              _buildTabNotifications('Sistem', 3),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _notificationsTabController,
        children: const <Widget>[
          AllNotifications(),
          Center(
            child: Text("Transaction content notifications will appear here"),
          ),
          Center(
            child:
                Text("Promo & Vouchers content notifications will appear here"),
          ),
          Center(
            child: Text("Systems content notifications will appear here"),
          ),
        ],
      ),
    );
  }

  Widget _buildTabNotifications(String title, int index) {
    return Expanded(
      child: Tab(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: selectedNotificationsTabIndex == index
                ? assetsColor.primaryColor
                : assetsColor.hintText,
            fontWeight: selectedNotificationsTabIndex == index
                ? FontWeight.bold
                : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
