import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';
import 'package:jasa_bantu/assets/AssetsIcon.dart';
import 'package:jasa_bantu/assets/AssetsLogo.dart';

AssetsColor assetsColor = AssetsColor();
AssetsIcon assetsIcon = AssetsIcon();
AssetsLogo assetsLogo = AssetsLogo();

class ChatPages extends StatefulWidget {
  const ChatPages({super.key});

  @override
  State<ChatPages> createState() => _ChatPagesState();
}

class _ChatPagesState extends State<ChatPages> {
  /// FOR "SEARCH"
  TextEditingController searchProductsPagesController = TextEditingController();

  ///
  final List<Map<String, dynamic>> dataChats = [
    {
      'profileChatsImages':
          'assets/images/CardImages/CardContent_Profile(1).png',
      'isOnline': true,
      'name': 'Clean Sweep',
      'description':
          'Selamat Sore! Kami memiliki jasa perawatan kulit dan wajah',
      'date': 'Hari ini',
      'count': 8,
      'showCheckmark': true,
    },
    {
      'profileChatsImages':
          'assets/images/CardImages/CardContent_Profile(2).png',
      'isOnline': false,
      'name': 'Event Elegance',
      'description': 'Bergabung Nov 2022, Jakarta Barat',
      'date': 'Kemarin',
      'count': 3,
      'showCheckmark': true,
    },
    {
      'profileChatsImages':
          'assets/images/CardImages/CardContent_Profile(3).png',
      'isOnline': true,
      'name': 'Edu Guidance',
      'description': 'Smartphone saya rusak, Apakah Anda bisa memperbaikinya?',
      'date': '18 Jan',
      'count': null,
      'showCheckmark': true,
    },
    {
      'profileChatsImages':
          'assets/images/CardImages/CardContent_Profile(4).png',
      'isOnline': false,
      'name': 'Style Sync',
      'description': 'Saya membutuhkan pengiriman ke daerah',
      'date': '12 Jan',
      'count': 7,
      'showCheckmark': true,
    },
    {
      'profileChatsImages':
          'assets/images/CardImages/CardContent_Profile(5).png',
      'isOnline': false,
      'name': 'Auto Sculpt',
      'description': 'Kami spesialis dalam layanan perbaikan rumah',
      'date': '25 Des',
      'count': null,
      'showCheckmark': true,
    },
    {
      'profileChatsImages':
          'assets/images/CardImages/CardContent_Profile(6).png',
      'isOnline': false,
      'name': 'Event Elegance',
      'description': 'Bergabung Nov 2022, Jakarta Barat',
      'date': '25 Des',
      'count': null,
      'showCheckmark': true,
    },
    {
      'profileChatsImages':
          'assets/images/CardImages/CardContent_Profile(6).png',
      'isOnline': false,
      'name': 'Event Elegance',
      'description': 'Bergabung Nov 2022, Jakarta Barat',
      'date': '25 Des',
      'count': null,
      'showCheckmark': true,
    },
  ];

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
                  'Inbox pesan (18)',
                  style: TextStyle(
                    color: assetsColor.textBlack,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            // IconButton(
            //   onPressed: () {},
            //   icon: Icon(
            //     Icons.receipt_outlined,
            //     color: assetsColor.hintText,
            //   ),
            // ),
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
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: assetsColor.bgGrey200,
            ),
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
                prefixIcon: Icon(Icons.search, color: assetsColor.hintText),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: assetsColor.bgLightMode,
                ),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: dataChats.map((data) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 80,
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.orange.shade800,
                                  // Atur backgroundImage sesuai kebutuhan
                                  // backgroundImage: showProfilePicture
                                  //     ? const AssetImage(
                                  //         '',
                                  //       )
                                  //     : null,
                                  // child: showProfilePicture ? null : const Text('EP'),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: data['isOnline']
                                          ? Colors.green
                                          : assetsColor
                                              .bgGrey200, // isOnline adalah variabel yang menunjukkan status online/offline
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        data['name'],
                                        style: TextStyle(
                                          color: assetsColor.textBlack,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      if (data['showCheckmark'] == true)
                                        const Icon(
                                          CupertinoIcons.checkmark_seal_fill,
                                          size: 20,
                                          color: Colors.green,
                                        ),
                                    ],
                                  ),
                                  Text(
                                    data['description'],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: assetsColor.hintText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  data['date'],
                                  style: TextStyle(
                                    color: assetsColor.hintText,
                                  ),
                                ),
                                if (data['count'] != null)
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: assetsColor.primaryColor,
                                    ),
                                    child: Text(
                                      data['count'].toString(),
                                      style: TextStyle(
                                          color: assetsColor.textWhite),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
