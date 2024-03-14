import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';
import 'package:jasa_bantu/assets/AssetsLogo.dart';

AssetsColor assetsColor = AssetsColor();
AssetsLogo assetsLogo = AssetsLogo();

class ProfilePages extends StatefulWidget {
  const ProfilePages({super.key});

  @override
  State<ProfilePages> createState() => _ProfilePagesState();
}

class _ProfilePagesState extends State<ProfilePages> {
  /// FOR "SEARCH"
  TextEditingController searchProductsPagesController = TextEditingController();

  /// FOR "PROFILE"
  bool showProfilePicture = true;

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
                  'Profil Saya',
                  style: TextStyle(
                    color: assetsColor.textBlack,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: assetsColor.bgLightMode,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.orange.shade800,
                    backgroundImage: showProfilePicture
                        ? const AssetImage(
                            '',
                          )
                        : null,
                    child: showProfilePicture ? null : const Text('EP'),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Elsa Dianri',
                        style: TextStyle(
                          color: assetsColor.textBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '081327931942',
                            style: TextStyle(
                              color: assetsColor.hintText,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            CupertinoIcons.checkmark_seal_fill,
                            color: Colors.green,
                            size: 15,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            assetsLogo.jbLogoSquare,
                            height: 15,
                            width: 15,
                          ),
                          // Icon(
                          //   Icons.monetization_on,
                          //   color: assetsColor.primaryColor,
                          //   size: 20,
                          // ),
                          const SizedBox(width: 5),
                          Text(
                            'Rp 375.000',
                            style: TextStyle(
                              color: assetsColor.hintText,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: assetsColor.bgLightMode,
              ),
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Card(
                      color: assetsColor.bgLightMode,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        constraints: const BoxConstraints(
                          maxWidth: 200,
                          maxHeight: 200,
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: assetsColor.primaryColor,
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.qr_code_scanner,
                                color: assetsColor.textWhite,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Scan QR Code',
                              style: TextStyle(
                                color: assetsColor.textBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Scan untuk verifikasi penyewaan',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: assetsColor.hintText,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: Container(),
                            ),
                            SizedBox(
                              height: 30,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: assetsColor.buttonPrimary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                child: Text(
                                  'Scan QR',
                                  style: TextStyle(
                                    color: assetsColor.textWhite,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: assetsColor.bgLightMode,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        constraints: const BoxConstraints(
                          maxWidth: 200,
                          maxHeight: 200,
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.blue, shape: BoxShape.circle),
                              child: Text(
                                '42',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: assetsColor.textWhite,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Dalam Pengerjaan',
                              style: TextStyle(
                                color: assetsColor.textBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Lihat dan baca kemajuan proses jasa',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: assetsColor.hintText,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: Container(),
                            ),
                            SizedBox(
                              height: 30,
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                icon: Icon(
                                  Icons.arrow_forward,
                                  size: 15,
                                  color: assetsColor.textWhite,
                                ),
                                label: Text(
                                  'Cek proses',
                                  style: TextStyle(
                                    color: assetsColor.textWhite,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: assetsColor.bgLightMode,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        constraints: const BoxConstraints(
                          maxWidth: 200,
                          maxHeight: 200,
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.green[500],
                                  shape: BoxShape.circle),
                              child: Icon(
                                Icons.shopping_bag_outlined,
                                color: assetsColor.textWhite,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Buka Akun Vendor',
                              style: TextStyle(
                                color: assetsColor.textBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Proses registrasi gratis, mudah & cepat',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: assetsColor.hintText,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: Container(),
                            ),
                            SizedBox(
                              height: 30,
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green[500],
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                label: Text(
                                  'Buka gratis',
                                  style: TextStyle(
                                    color: assetsColor.textWhite,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                icon: Icon(
                                  Icons.shopping_bag_outlined,
                                  color: assetsColor.textWhite,
                                  size: 15,
                                ),
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
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: assetsColor.bgLightMode,
              ),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Column(
                children: [
                  ListTile(
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.black45,
                    ),
                    leading: Icon(
                      Icons.money,
                      color: Colors.green,
                      size: 25,
                    ),
                    title: const Text(
                      'Metode Pembayaran',
                      style: TextStyle(
                          // color: Colors.black45,
                          ),
                    ),
                    subtitle: Text(
                      'Atur kartu kredit, E-Wallet, Debit terdaftar',
                      style: TextStyle(
                        color: assetsColor.hintText,
                      ),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //         const ChangePassword()));
                    },
                  ),
                  ListTile(
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.black45,
                    ),
                    leading: Icon(
                      Icons.shield_moon,
                      color: Colors.green,
                      size: 25,
                    ),
                    title: const Text(
                      'Keamanan Akun',
                      style: TextStyle(
                          // color: Colors.black45,
                          ),
                    ),
                    subtitle: Text(
                      'Ubah kata sandi akun dan PIN',
                      style: TextStyle(
                        color: assetsColor.hintText,
                      ),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //         const ChangePassword()));
                    },
                  ),
                  ListTile(
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.black45,
                    ),
                    leading: Icon(
                      Icons.pin_drop_outlined,
                      color: Colors.blueAccent,
                      size: 25,
                    ),
                    title: const Text(
                      'Daftar Alamat',
                      style: TextStyle(
                          // color: Colors.black45,
                          ),
                    ),
                    subtitle: Text(
                      'Tambah alamat pengerjaan jasa',
                      style: TextStyle(
                        color: assetsColor.hintText,
                      ),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //         const ChangePassword()));
                    },
                  ),
                  ListTile(
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.black45,
                    ),
                    leading: Icon(
                      Icons.apartment_outlined,
                      color: Colors.blueAccent,
                      size: 25,
                    ),
                    title: const Text(
                      'Toko yang Diikuti',
                      style: TextStyle(
                          // color: Colors.black45,
                          ),
                    ),
                    subtitle: Text(
                      'Tambah alamat pengerjaan jasa',
                      style: TextStyle(
                        color: assetsColor.hintText,
                      ),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //         const ChangePassword()));
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: assetsColor.bgLightMode,
              ),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Column(
                children: [
                  ListTile(
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.black45,
                    ),
                    leading: Icon(
                      Icons.edit_notifications_outlined,
                      color: assetsColor.textPrimary,
                      size: 25,
                    ),
                    title: const Text(
                      'Notifikasi',
                      style: TextStyle(
                          // color: Colors.black45,
                          ),
                    ),
                    subtitle: Text(
                      'Ubah jenis topik notifikasi',
                      style: TextStyle(
                        color: assetsColor.hintText,
                      ),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //         const ChangePassword()));
                    },
                  ),
                  ListTile(
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.black45,
                    ),
                    leading: Icon(
                      Icons.help_center_outlined,
                      color: assetsColor.textPrimary,
                      size: 25,
                    ),
                    title: const Text(
                      'Butuh Bantuan?',
                      style: TextStyle(
                          // color: Colors.black45,
                          ),
                    ),
                    subtitle: Text(
                      'Pelayanan bantuan setiap hari',
                      style: TextStyle(
                        color: assetsColor.hintText,
                      ),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //         const ChangePassword()));
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: assetsColor.bgLightMode,
              ),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Column(
                children: [
                  ListTile(
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.black45,
                    ),
                    leading: Icon(
                      Icons.cancel_outlined,
                      color: Colors.red,
                      size: 25,
                    ),
                    title: const Text(
                      'Jasa Dikomplain',
                      style: TextStyle(
                          // color: Colors.black45,
                          ),
                    ),
                    subtitle: Text(
                      'Jasa yang tidak sesuai deskripsi',
                      style: TextStyle(
                        color: assetsColor.hintText,
                      ),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //         const ChangePassword()));
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: assetsColor.bgLightMode,
              ),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Column(
                children: [
                  ListTile(
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.black45,
                    ),
                    leading: Icon(
                      Icons.help_center_outlined,
                      color: assetsColor.hintText,
                      size: 25,
                    ),
                    title: const Text(
                      'Tentang Jasa Bantu',
                      style: TextStyle(
                          // color: Colors.black45,
                          ),
                    ),
                    subtitle: Text(
                      'Pelayanan bantuan setiap hari',
                      style: TextStyle(
                        color: assetsColor.hintText,
                      ),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //         const ChangePassword()));
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: assetsColor.bgLightMode,
              ),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 30),
              child: Column(
                children: [
                  ListTile(
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                      color: Colors.black45,
                    ),
                    leading: Icon(
                      Icons.logout,
                      color: assetsColor.hintText,
                      size: 25,
                    ),
                    title: const Text(
                      'Keluar Akun',
                      style: TextStyle(
                          // color: Colors.black45,
                          ),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //         const ChangePassword()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class ProfileCardWidget extends StatelessWidget{
//   const ProfileCardWidget({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//         children: [Card(
//       color: Colors.white,
//       child: Container(
//         constraints: const BoxConstraints(
//           maxWidth: 180,
//           maxHeight: 300,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             /// PROFILE IMAGE & BANNER AREA
//             Stack(
//               // clipBehavior: Clip.none,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Image.asset(
//                     cardDataVendor['vendorCardBannerPict'],
//                     height: 100,
//                     width: 200,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Center(
//                   child: Container(
//                     padding: const EdgeInsets.only(top: 45),
//                     decoration: const BoxDecoration(
//                       shape: BoxShape.circle,
//                     ),
//                     child: CircleAvatar(
//                       radius: 40,
//                       backgroundColor: Colors.brown.shade800,
//                       backgroundImage: showImage
//                           ? AssetImage(cardDataVendor['vendorCardProfilePict'])
//                           : null,
//                       child: showImage ? null : const Text('EP'),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//
//             /// MITRA'S NAME & MITRA'S LOCATION
//             Center(
//               child: Container(
//                 padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       child: Flexible(
//                         child: Text(
//                           cardDataVendor['vendorCardTitle'],
//                           overflow: TextOverflow.ellipsis,
//                           maxLines: 2,
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 15,
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 5),
//                     const Icon(
//                       CupertinoIcons.checkmark_seal_fill,
//                       color: Colors.green,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//
//             Container(
//               padding: const EdgeInsets.only(bottom: 40),
//               child: Text(
//                 cardDataVendor['vendorCardLocation'],
//                 textAlign: TextAlign.start,
//                 style: const TextStyle(
//                   color: Colors.black45,
//                   fontWeight: FontWeight.w500,
//                   fontSize: 15,
//                 ),
//               ),
//             ),
//
//             Expanded(
//               child: Container(),
//             ),
//
//             /// RATING AREA
//             Container(
//               padding: const EdgeInsets.all(5),
//               constraints: const BoxConstraints(
//                 maxWidth: 150,
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(
//                     Icons.star,
//                     color: Colors.amber,
//                   ),
//                   const SizedBox(width: 5),
//                   Text(
//                     cardDataVendor['vendorCardRating'],
//                     style: const TextStyle(color: Colors.black54, fontSize: 15),
//                   ),
//                   const SizedBox(width: 5),
//                   Text(
//                     '(${cardDataVendor['vendorCardTotalFollowers']})',
//                     style: const TextStyle(color: Colors.black54, fontSize: 15),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }
