import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/extensions/color_extention.dart';
import 'package:learners_choice_app/core/widgets/doc_tile.dart';
import 'package:learners_choice_app/features/Intro/presentation/name_screen.dart';

class DocsScreen extends StatelessWidget {
  const DocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> docTiles = [
      docTile(
        context: context,
        iconPath: tipsIconPath,
        title: tipsIconlabel,
        points: 10,
      ),
      docTile(
        context: context,
        iconPath: infoIconPath,
        title: infoIconlabel1,
        subtitle: infoIconlabel2,
        points: 10,
      ),
      docTile(
        context: context,
        iconPath: actsIconPath,
        title: actsIconlabel1,
        subtitle: actsIconlabel2,
        points: 10,
      ),
      docTile(
        context: context,
        iconPath: carIconPath,
        title: carIconlabel1,
        subtitle: carIconlabel2,
        points: 10,
      ),
    ];
    return Scaffold(
      backgroundColor: context.onPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.onPrimary,
        leading: Builder(builder: (BuildContext context) {
          return const Icon(Icons.menu);
        }),
        title: Text(appBarTitle),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircleAvatar(
                backgroundImage: AssetImage(avatar1Path),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildImageWidget(
                  width: 283,
                  height: 217,
                  imagePath: learningIconPath,
                ),
                SizedBox(
                  width: 340,
                  height: 410,
                  child: ListView.separated(
                    itemCount: docTiles.length,
                    itemBuilder: (context, index) {
                      return docTiles[index];
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 15,
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
