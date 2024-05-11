import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learners_choice_app/Presentation/home/home.dart';
import 'package:learners_choice_app/core/blocs/cubit/cubit/local_storage_cubit.dart';
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
          padding: const EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
          ),
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
                Center(
                  child: BlocBuilder<LocalStorageCubit, LocalStorageState>(
                    builder: (context, state) {
                      print("current State is : $state");
                      if (state is ImagePicked) {
                        return InkWell(
                          onTap: () {
                            BlocProvider.of<LocalStorageCubit>(context)
                                .pickAndSaveImage();
                          },
                          child: CircleAvatar(
                            radius: 130, // Adjust the radius as needed
                            backgroundImage: FileImage(File(state.imagePath)),
                          ),
                        );
                      } else {
                        return InkWell(
                          onTap: () {
                            BlocProvider.of<LocalStorageCubit>(context)
                                .pickAndSaveImage();
                          },
                          child: buildImageWidget(
                            width: 316,
                            height: 263.39,
                            imagePath: imageAvatar,
                          ),
                        );
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  height: 130,
                  width: 328,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BuildCustomFabButton(
                          heroTag: "2",
                          label: "Back",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          isReversed: true,
                          icon: Icons.arrow_back),
                      BuildCustomFabButton(
                        heroTag: "3",
                        label: "Next",
                        onPressed: () async {
                          final localStorageCubit =
                              BlocProvider.of<LocalStorageCubit>(context);
                          await localStorageCubit.getProfilePic();
                          await localStorageCubit.saveOnboardStatus(true);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => const Home(),
                              ));
                          // Navigate to the next screen or perform any other action
                        },
                        isReversed: false,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
