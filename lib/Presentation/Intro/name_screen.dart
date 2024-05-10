import 'package:flutter/material.dart';
import 'package:learners_choice_app/Presentation/Intro/image_screen.dart';
import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/extensions/color_extention.dart';
import 'package:learners_choice_app/core/extensions/text_extension.dart';
import 'package:learners_choice_app/network/api_service.dart';
import '../../../../core/widgets/customButtons/custom_fab_button.dart';

class NameScreen extends StatelessWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 44.0,
                ),
                buildImageWidget(
                  width: 134,
                  height: 57,
                  imagePath: choiceLogo,
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
                Text(
                  smallTitleNameScreen,
                  style: context.titleSmallLight,
                ),
                const SizedBox(
                  height: 36.0,
                ),
                nameTextField(context, nameController),
                const SizedBox(
                  height: 105.0,
                ),
                buildImageWidget(
                  width: 316,
                  height: 263.39,
                  imagePath: mobileLogo,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(212, 70, 20, 0),
                  child: buildCustomFabButton(
                    context: BuildContext,
                    label: "Next",
                    // isReversed: false,

                    onPressed: () {
                      String name = nameController.text; // Get the entered name
                      print("name is $name");
                      ApiService.saveNameToFirestore(
                          name); // Call the API method
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) =>
                                  const ImageScreen())); // Navigate to the next screen or perform any other action
                    },
                    isReversed: false,
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
            context.primary,
          ),
        ),
      ],
    ),
    textAlign: TextAlign.left,
  );
}

Widget nameTextField(
    BuildContext context, TextEditingController nameTextController) {
  return TextField(
    style: const TextStyle(color: Colors.black),
    controller: nameTextController,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.only(top: 8, left: 16, bottom: 8),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 2, color: Color(0xFF00639B)),
      ),
      hintText: 'Name',
      hintStyle: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        height: 0.09,
        letterSpacing: 0.50,
      ),
    ),
  );
}

Widget buildImageWidget({
  required double width,
  required double height,
  required String imagePath,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: BoxFit.contain,
      ),
    ),
  );
}
