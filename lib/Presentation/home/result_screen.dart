import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/widgets/custom_app_bar.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, this.appBarTitle});
  final appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, customAppBarTitle: appBarTitle),
    );
  }
}
