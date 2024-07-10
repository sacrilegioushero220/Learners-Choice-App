import 'package:flutter/material.dart';
import 'package:learners_choice_app/presentation/Intro/name_screen.dart';
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
        iconPath: tipsIconPath,
        title: tipsIconlabel,
      ),
      DocTile(
        iconPath: infoIconPath,
        title: infoIconlabel1,
      ),
      DocTile(
        iconPath: actsIconPath,
        title: actsIconlabel1,
      ),
      DocTile(
        iconPath: carIconPath,
        title: carIconlabel1,
      ),
      DocTile(
        iconPath: carIconPath,
        title:
            "avg=2205.67ms min=8.15msmax=10855.35mscount=5max=10855.35ms count=5",
      ),
      DocTile(
        iconPath: carIconPath,
        title: carIconlabel1,
      ),
      DocTile(
        iconPath: carIconPath,
        title: carIconlabel1,
      ),
      DocTile(
        iconPath: carIconPath,
        title: carIconlabel1,
      ),
      DocTile(
        iconPath: carIconPath,
        title: carIconlabel1,
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
