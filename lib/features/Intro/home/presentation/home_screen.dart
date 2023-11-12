import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/extensions/color_extention.dart';
import 'package:learners_choice_app/core/extensions/text_extension.dart';
import 'package:learners_choice_app/features/Intro/Presentation/UI/name_screen.dart';
import 'package:learners_choice_app/features/Intro/Presentation/widgets/custom_grid_view_item.dart';
import 'package:learners_choice_app/features/Intro/Presentation/widgets/ll_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 15,
              ),
              buildImageWidget(
                width: 278,
                height: 138,
                imagePath: carHomePage,
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                "Mock Test",
                style: context.lightTextTheme.headlineMedium,
              ),
              const SizedBox(
                height: 25,
              ),
              buildLLTile(context),
              const SizedBox(
                height: 35,
              ),
              Text(
                "Keep Learning",
                style: context.lightTextTheme.headlineMedium,
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 250,
                width: 330,
                child: GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 3,
                  children: [
                    buildCustomGridViewItem(
                        gridViewItemIcon1, gridViewItemlabel1, context),
                    buildCustomGridViewItem(
                        gridViewItemIcon2, gridViewItemlabel2, context),
                    buildCustomGridViewItem(
                        gridViewItemIcon3, gridViewItemlabel3, context),
                    buildCustomGridViewItem(
                        gridViewItemIcon4, gridViewItemlabel4, context),
                    buildCustomGridViewItem(
                        gridViewItemIcon5, gridViewItemlabel5, context),
                    buildCustomGridViewItem(
                        gridViewItemIcon6, gridViewItemlabel6, context)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
