import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learners_choice_app/core/blocs/Profile_bloc/profile_bloc.dart';
import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/extensions/text_extension.dart';
import 'package:learners_choice_app/core/widgets/build_image_widget.dart';
import 'package:learners_choice_app/core/widgets/build_rich_text_title.dart';
import 'package:learners_choice_app/core/widgets/name_text_field.dart';
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
                  child: BuildRichTextTitle(
                    title1: titleNameScreen1,
                    title2: titleNameScreen2,
                  ),
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
                NameTextField(controller: _nameTextController),
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
