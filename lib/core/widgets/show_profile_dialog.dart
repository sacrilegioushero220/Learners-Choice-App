import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learners_choice_app/core/blocs/cubit/cubit/local_storage_cubit.dart';
import 'package:learners_choice_app/core/widgets/my_custom_widgets.dart';

Future<dynamic> showProfileDialog(
  BuildContext context,
  String profileName,
  String profilePic,
) {
  return showModalBottomSheet(
      context: context,
      builder: (context) => CustomBottomSheet(
            profileName: profileName,
            profilePic: profilePic,
          ));
}

// ignore: must_be_immutable
class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet({
    super.key,
    required this.profileName,
    required this.profilePic,
  });

  String profileName;
  String profilePic;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          const ListTile(
            title: Text("Profile"),
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
                  if (state is ProfilePicFetchState) {
                    print("ImagePicked State");
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
                        width: 116,
                        height: 163.39,
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
                        width: 116,
                        height: 163.39,
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
                  padding: const EdgeInsets.all(24.0),
                  child: NameTextField(
                    controller: controller,
                    hintText: profileName,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextButton(
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

                BlocProvider.of<LocalStorageCubit>(context).updateProfile(name);

                print(profileName);
              },
              child: const Text("Update"),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
