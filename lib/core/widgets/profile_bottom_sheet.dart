import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learners_choice_app/core/blocs/Profile_bloc/profile_bloc.dart';
import 'package:learners_choice_app/core/widgets/name_text_field.dart';

import 'build_image_widget.dart';

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
  CustomBottomSheet(
      {super.key, required this.profileName, required this.profilePic});

  String profileName;
  final String profilePic;

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
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ImagePickedState) {
                    print("ImagePicked State");
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
                        width: 116,
                        height: 163.39,
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

                BlocProvider.of<ProfileBloc>(context)
                    .add(PickNameEvent(profileName: name));
                print("NamePicked State");
                print(profileName);

                BlocProvider.of<ProfileBloc>(context).add(SaveProfileEvent(
                    profileName: profileName, profilePicPath: profilePic));
                print("SaveProfile State");
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
