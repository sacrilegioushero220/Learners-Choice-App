import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learners_choice_app/core/blocs/Profile_bloc/profile_bloc.dart';

import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/extensions/color_extention.dart';
import 'package:learners_choice_app/core/extensions/text_extension.dart';
import 'package:learners_choice_app/core/widgets/build_image_widget.dart';
import '../../../../core/widgets/customButtons/custom_fab_button.dart';

class NameScreen extends StatelessWidget {
  NameScreen({
    super.key,
  });

  final _nameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
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
                nameTextField(context, controller: _nameTextController),
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
                const SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    buildCustomFabButton(
                      context: BuildContext,
                      label: "Next",
                      // isReversed: false,

                      onPressed: () {
                        final name = _nameTextController.text.trim();
                        BlocProvider.of<ProfileBloc>(context)
                            .add(SaveNameEvent(profileName: name));

                        if (name.isNotEmpty) {
                          context.pushNamed("ImageScreen");
                        }
                      },
                      isReversed: false, tag: 'fab3',
                    ),
                  ],
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

Widget nameTextField(BuildContext context,
    {required TextEditingController controller}) {
  return TextField(
    style: const TextStyle(color: Colors.black),
    controller: controller,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.only(top: 8, left: 16, bottom: 8),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 2, color: Color(0xFF00639B)),
      ),
      hintText: 'Name',
      hintStyle: TextStyle(
        color: context.onSurface,
        fontSize: 16,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        height: 0.09,
        letterSpacing: 0.50,
      ),
    ),
  );
}
