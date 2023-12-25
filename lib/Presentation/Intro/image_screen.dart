import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learners_choice_app/core/blocs/Profile_bloc/profile_bloc.dart';
import 'package:learners_choice_app/core/widgets/build_image_widget.dart';
import 'package:learners_choice_app/presentation/Intro/name_screen.dart';
import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/extensions/color_extention.dart';
import 'package:learners_choice_app/core/extensions/text_extension.dart';
import 'package:learners_choice_app/core/widgets/customButtons/custom_fab_button.dart';

//
class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.person_add,
                    color: context.primary,
                    size: 60.0,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                SizedBox(
                    width: 291,
                    child: Text(
                      imageTitle,
                      style: context.displayLargeLight,
                    )),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  imageSubtitle,
                  style: context.titleSmallLight!.copyWith(
                    color: context.primary,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    if (state is ImagePickedState) {
                      final selectedImagePath = state.profileImagePath;
                      return InkWell(
                        onTap: () {
                          BlocProvider.of<ProfileBloc>(context)
                              .add(PickImageEvent());
                        },
                        child: BuildImageWidget(
                          isCircleAvatar: true,
                          isFileImage: true,
                          boxFit: BoxFit.cover,
                          width: 316,
                          height: 263.39,
                          imagePath: selectedImagePath,
                        ),
                      );
                    }

                    return InkWell(
                      onTap: () {
                        BlocProvider.of<ProfileBloc>(context)
                            .add(PickImageEvent());
                      },
                      child: BuildImageWidget(
                        width: 316,
                        height: 263.39,
                        imagePath: imageAvatar,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 70,
                ),
                SizedBox(
                  height: 130,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildCustomFabButton(
                          context: BuildContext,
                          label: "Back",
                          onPressed: () => context.goNamed("NameScreen"),
                          isReversed: true,
                          icon: Icons.arrow_back,
                          tag: 'fab1'),
                      buildCustomFabButton(
                        context: BuildContext,
                        label: "Next",
                        onPressed: () {
                          context.pushReplacementNamed("HomeScreen");
                        },
                        isReversed: false,
                        tag: 'fab2',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildImagePreviewWidget(String selectedImagePath) {
    return Container(
      width: 100, // Adjust the size as needed
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: FileImage(File(selectedImagePath)),
        ),
      ),
    );
  }
}
