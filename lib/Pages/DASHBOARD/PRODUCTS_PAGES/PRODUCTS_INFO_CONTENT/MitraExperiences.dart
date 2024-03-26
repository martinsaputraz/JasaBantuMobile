import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jasa_bantu/assets/AssetsColor.dart';

AssetsColor assetsColor = AssetsColor();

class MitraExperiences extends StatefulWidget {
  const MitraExperiences({Key? key}) : super(key: key);

  @override
  State<MitraExperiences> createState() => _MitraExperiencesState();
}

class _MitraExperiencesState extends State<MitraExperiences> {
  /// LIST DATA CERTIFICATE
  List<Map<String, dynamic>> mitraExperiencesCardData = [
    {
      'mitraExperiencesCardNames': 'Manajer Proyek Arsitektur',
      'mitraExperiencesCardLocated': 'InnoBuild Architects, Jakarta, Indonesia',
      'mitraExperiencesCardPeriode': 'Feb 2024 - Sekarang (7 tahun)',
      'mitraExperiencesCardDetails':
          'Sebagai arsitek senior di Studio Kreatif ArkiVision, saya bertanggung jawab atas perencanaan dan desain eksekutif berbagai proyek arsitektur.',
    },
    {
      'mitraExperiencesCardNames': 'Desainer Arsitektur',
      'mitraExperiencesCardLocated': 'UrbaInnovate Designs, Jakarta, Indonesia',
      'mitraExperiencesCardPeriode': 'Mei 2015 - Jan 2017 (2 tahun)',
      'mitraExperiencesCardDetails':
          'Pada proyek terbaru kami, berhasil mencapai peningkatan signifikan dalam efisiensi penggunaan ruang kantor, mengintegrasikan konsep keberlanjutan, dan menciptakan lingkungan kerja yang kreatif dan produktif.',
    },
    // Add more data entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          /// TITLE
          Row(
            children: [
              Icon(
                CupertinoIcons.doc_append,
                color: assetsColor.textPrimary,
                size: 30,
              ),
              const SizedBox(width: 5),
              Text(
                'Pengalaman Profesional',
                style: TextStyle(
                  color: assetsColor.textBlack,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          /// ListView untuk menampilkan kartu sertifikasi
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: mitraExperiencesCardData.length,
            itemBuilder: (context, index) {
              final mitraExperiencesData = mitraExperiencesCardData[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mitraExperiencesData['mitraExperiencesCardNames'],
                    maxLines: 2,
                    style: TextStyle(
                      color: assetsColor.textBlack,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    mitraExperiencesData['mitraExperiencesCardLocated'],
                    style: TextStyle(
                      color: assetsColor.textBlack,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    mitraExperiencesData['mitraExperiencesCardPeriode'],
                    style: TextStyle(
                      color: assetsColor.hintText,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    mitraExperiencesData['mitraExperiencesCardDetails'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: assetsColor.hintText,
                      fontSize: 15,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //
                    },
                    child: Text(
                      'Lihat lebih lengkap',
                      style: TextStyle(
                        color: assetsColor.textPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
