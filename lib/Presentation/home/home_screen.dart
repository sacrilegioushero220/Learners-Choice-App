import 'package:flutter/material.dart';
import 'package:learners_choice_app/presentation/Intro/name_screen.dart';
import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/extensions/color_extention.dart';
import 'package:learners_choice_app/core/extensions/text_extension.dart';
import 'package:learners_choice_app/core/widgets/custom_grid_view_item.dart';
import 'package:learners_choice_app/core/widgets/ll_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.onPrimary,
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
                    BuildCustomGridViewItem(
                      iconPath: gridViewItemIcon1,
                      label: gridViewItemlabel1,
                    ),
                    BuildCustomGridViewItem(
                      iconPath: gridViewItemIcon2,
                      label: gridViewItemlabel2,
                    ),
                    BuildCustomGridViewItem(
                      iconPath: gridViewItemIcon3,
                      label: gridViewItemlabel3,
                    ),
                    BuildCustomGridViewItem(
                      iconPath: gridViewItemIcon4,
                      label: gridViewItemlabel4,
                    ),
                    BuildCustomGridViewItem(
                      iconPath: gridViewItemIcon5,
                      label: gridViewItemlabel5,
                    ),
                    BuildCustomGridViewItem(
                      iconPath: gridViewItemIcon6,
                      label: gridViewItemlabel6,
                    )
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
