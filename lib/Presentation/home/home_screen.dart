import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:learners_choice_app/Presentation/custom_grid_view_screen.dart';
import 'package:learners_choice_app/Presentation/custom_list_view_screen.dart';
import 'package:learners_choice_app/Presentation/learners_test/mock_test_screen.dart';
import 'package:learners_choice_app/Presentation/presentation_layer.dart';
import 'package:learners_choice_app/Presentation/traffic_signs_screen.dart';
import 'package:learners_choice_app/core/blocs/cubit/apiCubit/api_cubit.dart';
import 'package:learners_choice_app/core/blocs/cubit/quizCubit/quiz_cubit.dart';
import 'package:learners_choice_app/core/widgets/my_custom_widgets.dart';
import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/extensions/color_extention.dart';
import 'package:learners_choice_app/core/extensions/text_extension.dart';

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
              BuildImageWidget(
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
              BuildLLTile(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MockTestScreen()));
                },
              ),
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
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => const TrafficSignScreen()));
                      },
                    ),
                    BuildCustomGridViewItem(
                      iconPath: gridViewItemIcon2,
                      label: gridViewItemlabel2,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => CustomListViewScreen(
                                    apiCubit: ApiCubit()..fetchRoadSigns())));
                      },
                    ),
                    BuildCustomGridViewItem(
                      iconPath: gridViewItemIcon3,
                      label: gridViewItemlabel3,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => CustomGridViewScreen(
                                      apiCubit: ApiCubit()..fetchHazardSigns(),
                                    )));
                      },
                    ),
                    BuildCustomGridViewItem(
                      iconPath: gridViewItemIcon4,
                      label: gridViewItemlabel4,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => CustomListViewScreen(
                                      apiCubit: ApiCubit()
                                        ..fetchDriverSignals(),
                                    )));
                      },
                    ),
                    BuildCustomGridViewItem(
                      iconPath: gridViewItemIcon5,
                      label: gridViewItemlabel5,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => CustomListViewScreen(
                                      apiCubit: ApiCubit()..fetchHandSignals(),
                                    )));
                      },
                    ),
                    BuildCustomGridViewItem(
                      iconPath: gridViewItemIcon6,
                      label: gridViewItemlabel6,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => QnaScreen(
                                      quizCubit:
                                          QuizCubit(DefaultCacheManager())
                                            ..fetchQnA(),
                                    )));
                      },
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
