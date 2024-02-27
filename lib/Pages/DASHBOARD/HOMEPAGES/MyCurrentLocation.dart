import 'package:flutter/material.dart';
import 'package:jasa_bantu/main.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: assetsColor.bgLightMode,
      ),
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: assetsColor.bgGrey200,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: assetsColor.hintText,
                ),
                Text(
                  'Rumah Saya',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: assetsColor.hintText,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              'Jl. In Aja Dulu, Baru Tau Nanti, Abcdefghijkl',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: assetsColor.hintText,
              ),
            ),
          ),
          const Icon(Icons.expand_more_rounded),
        ],
      ),
    );
  }
}
