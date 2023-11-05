import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/extensions/color_extention.dart';
import 'package:learners_choice_app/features/Intro/Presentation/UI/name_screen.dart';

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
            )
          ],
        ),
      ),
    );
  }
}
