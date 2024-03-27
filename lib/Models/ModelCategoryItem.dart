import 'package:flutter/material.dart';
import 'package:jasa_bantu/assets/AssetsIcon.dart';

AssetsIcon assetsIcon = AssetsIcon();

class CategoryItem {
  final int id;
  final IconData iconData;
  final String title;

  CategoryItem(this.id, this.iconData, this.title);
}

class CategoryItemBuilder {
  static CategoryItem build(int id, IconData iconData, String title) {
    return CategoryItem(id, iconData, title);
  }
}

class CategoryItemList {
  static List<CategoryItem> buildItems() {
    return [
      CategoryItemBuilder.build(
          0, assetsIcon.iconKatTagihan as IconData, 'Tagihan'),
      CategoryItemBuilder.build(
          1, assetsIcon.iconKatKonsultasi as IconData, 'Konsultasi'),
      CategoryItemBuilder.build(
          2, assetsIcon.iconKatBisnis as IconData, 'Bisnis'),
      CategoryItemBuilder.build(
          3, assetsIcon.iconKatKesehatan as IconData, 'Kesehatan'),
      CategoryItemBuilder.build(
          4, assetsIcon.iconKatKecantikan as IconData, 'Kecantikan'),
      CategoryItemBuilder.build(
          5, assetsIcon.iconKatDonasi as IconData, 'Donasi'),
      CategoryItemBuilder.build(
          6, assetsIcon.iconKatReservasi as IconData, 'Reservasi'),
      CategoryItemBuilder.build(
          7, assetsIcon.iconKatProfesional as IconData, 'Profesional'),
      CategoryItemBuilder.build(
          8, assetsIcon.iconKatTenagaKerja as IconData, 'Tenaga Kerja'),
      CategoryItemBuilder.build(
          9, assetsIcon.iconKatHewanPeliharaan as IconData, 'Hewan Peliharan'),
      CategoryItemBuilder.build(
          10,
          assetsIcon.iconKatLayananPemerintah as IconData,
          'Layanan Pemerintahan'),
      CategoryItemBuilder.build(
          11, assetsIcon.iconKatEventOrganizer as IconData, 'Event Organizer'),
      CategoryItemBuilder.build(
          12, assetsIcon.iconKatHomeService as IconData, 'Home Services'),
    ];
  }
}
