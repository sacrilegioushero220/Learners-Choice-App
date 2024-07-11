import 'package:flutter/material.dart';

import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/extensions/color_extention.dart';
import 'package:learners_choice_app/core/widgets/doc_tile.dart';

class DocsScreen extends StatelessWidget {
  const DocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    final List<Widget> docTiles = [
      DocTile(
        iconPath: acts2IconPath,
        title: docTilelabel8,
      ),
      DocTile(
        iconPath: infoIconPath,
        title: docTilelabel2,
      ),
      DocTile(
        iconPath: actsIconPath,
        title: docTilelabel3,
      ),
      DocTile(
        iconPath: carIconPath,
        title: docTilelabel4,
      ),
      DocTile(
        iconPath: speedLimitIconPath,
        title: docTilelabel5,
      ),
      DocTile(
        iconPath: codeIconPath,
        title: docTilelabel6,
      ),
      DocTile(
        iconPath: hTrackIconPath,
        title: docTilelabel6,
      ),
      DocTile(
        iconPath: roadSignIconPath,
        title: docTilelabel7,
      ),
    ];
    return Scaffold(
      backgroundColor: context.onPrimary,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Scrollbar(
          thumbVisibility: true,
          controller: scrollController,
          child: ListView.separated(
            controller: scrollController,
            itemCount: docTiles.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: docTiles[index],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 15,
              );
            },
          ),
        ),
      ),
    );
  }
}
