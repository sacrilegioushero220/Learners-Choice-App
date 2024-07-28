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

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  double gapOfCarImage() {
    final screenSize = MediaQuery.of(context).size.height;
    print("screenSize is this:$screenSize");
    if (screenSize < 700 && screenSize >= 600) {
      print("20");
      return 20;
    } else if (screenSize < 800 && screenSize >= 700) {
      print(" this 10");
      return 10;
    }
    print(" 60");
    return 60;
  }

  Map<String, dynamic> viewPortSize() {
    final screenSize = MediaQuery.of(context).size.height;
    bool thumbVisibility;
    double height;

    if (screenSize < 700 && screenSize >= 600) {
      thumbVisibility = true;
      height = 130;
    } else if (screenSize < 800 && screenSize >= 700) {
      thumbVisibility = false;
      height = 230;
    } else {
      thumbVisibility = false;
      height = 260;
    }

    return {
      'thumbVisibility': thumbVisibility,
      'height': height,
    };
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    final viewport = viewPortSize();
    final thumbVisibility = viewport['thumbVisibility'];
    final height = viewport['height'];
    return Scaffold(
      backgroundColor: context.onPrimary,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: gapOfCarImage(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: BuildImageWidget(
                width: 278,
                height: 138,
                imagePath: carHomePage,
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: Text(
                "Mock Test",
                style: context.lightTextTheme.headlineMedium,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: BuildLLTile(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MockTestScreen()));
                },
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: Text(
                "Keep Learning",
                style: context.lightTextTheme.headlineMedium,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Scrollbar(
              thumbVisibility: thumbVisibility,
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: SizedBox(
                  width: 330,
                  height: height,
                  child: GridView.count(
                    controller: scrollController,
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                    ),
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
                                        apiCubit: ApiCubit()
                                          ..fetchHazardSigns(),
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
                                        apiCubit: ApiCubit()
                                          ..fetchHandSignals(),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
