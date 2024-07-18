import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learners_choice_app/Presentation/Intro/image_screen.dart';
import 'package:learners_choice_app/core/blocs/cubit/localStorageCubit/local_storage_cubit.dart';
import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/extensions/color_extention.dart';
import 'package:learners_choice_app/core/extensions/text_extension.dart';
import 'package:learners_choice_app/core/widgets/build_image_widget.dart';
import '../../../../core/widgets/customButtons/custom_fab_button.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  late TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: SizedBox(
              height: screenHeight - 100, // Dynamic height adjustment
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 44.0,
                  ),
                  BuildImageWidget(
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
                  Center(
                    child: BuildImageWidget(
                      width: 316,
                      height: 263.39,
                      imagePath: mobileLogo,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          BuildCustomFabButton(
                            heroTag: "1",
                            label: "Next",
                            onPressed: () {
                              String name =
                                  nameController.text; // Get the entered name

                              if (name.isNotEmpty) {
                                BlocProvider.of<LocalStorageCubit>(context)
                                    .saveName(name, context);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (ctx) => const ImageScreen(),
                                    ));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please enter a valid name '),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              }
                            },
                            isReversed: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
    textInputAction: TextInputAction.done,
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
