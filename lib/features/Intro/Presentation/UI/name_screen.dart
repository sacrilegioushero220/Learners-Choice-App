import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/extensions/text_extension.dart';
import 'package:learners_choice_app/features/Intro/Presentation/widgets/custom_fab_button.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 44.0,
              ),
              Container(
                width: 134,
                height: 57,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(choiceLogo),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              SizedBox(
                width: 291,
                child: buildRichTextTitle(
                    titleNameScreen1, titleNameScreen2, context),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7.5),
                child: Text(
                  smallTitleNameScreen,
                  style: context.titleSmallLight,
                ),
              ),
              const SizedBox(
                height: 36.0,
              ),
              NameTextField(),
              const SizedBox(
                height: 105.0,
              ),
              Container(
                width: 316,
                height: 263.39,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(mobileLogo),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              buildCustomFabButton(
                BuildContext: BuildContext,
                label: "Next",
                isReversed: false,
                isLeft: false,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

Text buildRichTextTitle(String title1, String title2, BuildContext context) {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: title1,
          style: context.headlineMediumLight,
        ),
        TextSpan(
          text: title2,
          style: getCustomHeadlineMediumLight(
            context,
            const Color(0xFF00639B),
          ),
        ),
      ],
    ),
    textAlign: TextAlign.center,
  );
}

Widget NameTextField() {
  return TextField(
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.only(top: 8, left: 16, bottom: 8),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 2, color: Color(0xFF00639B)),
      ),
      hintText: 'Name',
      hintStyle: const TextStyle(
        color: Color(0xFF201A19),
        fontSize: 16,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        height: 0.09,
        letterSpacing: 0.50,
      ),
    ),
  );
}
