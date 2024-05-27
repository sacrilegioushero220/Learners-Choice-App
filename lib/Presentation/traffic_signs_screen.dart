import 'package:flutter/material.dart';
import 'package:learners_choice_app/Presentation/results_screen.dart';
import 'package:learners_choice_app/core/widgets/custom_app_bar.dart';
import 'package:learners_choice_app/core/widgets/traffic_sign_category.dart';

import '../core/blocs/cubit/apiCubit/traffic_sign_type.dart';

class TrafficSignScreen extends StatelessWidget {
  const TrafficSignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            TrafficSignCategoryCard(
              iconPath: 'assets/Images/STEEP ASCENT.jpg',
              title: 'Cautionary Signs',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ResultsScreen(
                              trafficSignType: TrafficSignType.cautionary,
                            )));
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TrafficSignCategoryCard(
              iconPath: 'assets/Images/leftturnprob.jpg',
              title: 'Mandatory Signs',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ResultsScreen(
                              trafficSignType: TrafficSignType.mandatory,
                            )));
              },
            ),
            const SizedBox(
              height: 15,
            ),
            TrafficSignCategoryCard(
              iconPath: 'assets/Images/hospital.jpg',
              title: 'Informatory Signs',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ResultsScreen(
                              trafficSignType: TrafficSignType.informatory,
                            )));
              },
            ),
          ],
        ),
      ),
    );
  }
}
