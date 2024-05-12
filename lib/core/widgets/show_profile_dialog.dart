import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learners_choice_app/core/blocs/cubit/cubit/local_storage_cubit.dart';
import 'package:learners_choice_app/core/extensions/text_extension.dart';
import 'package:learners_choice_app/core/widgets/my_custom_widgets.dart';

Future<dynamic> showProfileDialog(
  BuildContext context,
) async {
  return showModalBottomSheet(
    isScrollControlled: true,
    showDragHandle: true,
    context: context,
    builder: (context) => const CustomBottomSheet(),
  );
}

// ignore: must_be_immutable
class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String profilePic = "";
    String profileName = "";
    final controller = TextEditingController();
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //padding: const EdgeInsets.all(16),
            //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Profile",
                    style: context.captionLight?.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  BlocConsumer<LocalStorageCubit, LocalStorageState>(
                    listener: (context, state) {
                      if (state is ProfileUpdatedState) {
                        profilePic = state.profilePic;
                      } else if (state is ImagePicked) {
                        profilePic = state.imagePath;
                      }
                    },
                    builder: (context, state) {
                      if (state is ProfileFetchedState) {
                        profilePic = state.profilePic;
                        return InkWell(
                          onTap: () {
                            BlocProvider.of<LocalStorageCubit>(context)
                                .pickAndSaveImage();
                          },
                          child: BuildImageWidget(
                            isCircleAvatar: true,
                            isFileImage: true,
                            boxFit: BoxFit.cover,
                            width: 50,
                            height: 60,
                            imagePath: profilePic,
                          ),
                        );
                      } else if (state is ProfileUpdatedState) {
                        profilePic = state.profilePic;
                        return InkWell(
                          onTap: () {
                            BlocProvider.of<LocalStorageCubit>(context)
                                .pickAndSaveImage();
                          },
                          child: BuildImageWidget(
                            isCircleAvatar: true,
                            isFileImage: true,
                            boxFit: BoxFit.cover,
                            width: 50,
                            height: 60,
                            imagePath: profilePic,
                          ),
                        );
                      }

                      return InkWell(
                        onTap: () {
                          BlocProvider.of<LocalStorageCubit>(context)
                              .pickAndSaveImage();
                        },
                        child: BuildImageWidget(
                          isCircleAvatar: true,
                          isFileImage: true,
                          width: 100,
                          height: 163.39,
                          imagePath: profilePic,
                          boxFit: BoxFit.fill,
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: BlocConsumer<LocalStorageCubit, LocalStorageState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          if (state is ProfileFetchedState) {
                            print(state.profileName);
                            return NameTextField(
                              controller: controller,
                              hintText: state.profileName,
                            );
                          }
                          if (state is ProfileUpdatedState) {
                            return NameTextField(
                              controller: controller,
                              hintText: state.profileName,
                            );
                          }

                          return NameTextField(
                            controller: controller,
                            hintText: profileName,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FilledButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () {
                      final name = controller.text.trim();

                      if (name.isNotEmpty) {
                        BlocProvider.of<LocalStorageCubit>(context)
                            .updateProfile(name);

                        Navigator.pop(context);
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: const Icon(Icons.done),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
