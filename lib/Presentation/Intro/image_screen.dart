import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learners_choice_app/Presentation/home/home.dart';
import 'package:learners_choice_app/core/blocs/cubit/localStorageCubit/local_storage_cubit.dart';
import 'package:learners_choice_app/core/widgets/build_image_widget.dart';
import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/extensions/color_extention.dart';
import 'package:learners_choice_app/core/extensions/text_extension.dart';
import 'package:learners_choice_app/core/widgets/customButtons/custom_fab_button.dart';

//
class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
            ),
            child: SizedBox(
              height: screenHeight - 100,
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
                            child: BuildImageWidget(
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
                  Expanded(
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

                            if (localStorageCubit.state is ImagePicked) {
                              await localStorageCubit.saveOnboardStatus(true);
                              await localStorageCubit.getProfile();

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => const Home(),
                                ),
                              );
                            } else {
                              // Show a message or a dialog to the user indicating that they need to pick an image
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please pick an image first.'),
                                ),
                              );
                            }
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
      ),
    );
  }
}
