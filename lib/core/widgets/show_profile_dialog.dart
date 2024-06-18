import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learners_choice_app/core/blocs/cubit/localStorageCubit/local_storage_cubit.dart';
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

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  late TextEditingController controller;
  String profilePic = "";
  String profileName = "";

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    final state = BlocProvider.of<LocalStorageCubit>(context).state;
    if (state is ProfileFetchedState) {
      profilePic = state.profilePic;
      profileName = state.profileName;
      controller.text = profileName;
    } else if (state is ProfileUpdatedState) {
      profilePic = state.profilePic;
      profileName = state.profileName;
      controller.text = profileName;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                        setState(() {
                          profilePic = state.profilePic;
                          profileName = state.profileName;
                          controller.text = profileName;
                        });
                      } else if (state is ImagePicked) {
                        setState(() {
                          profilePic = state.imagePath;
                        });
                      }
                    },
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          BlocProvider.of<LocalStorageCubit>(context)
                              .pickAndSaveImage();
                        },
                        child: BuildImageWidget(
                          isCircleAvatar: true,
                          isFileImage: profilePic.isNotEmpty,
                          boxFit: BoxFit.cover,
                          width: 50,
                          height: 60,
                          imagePath: profilePic,
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: NameTextField(
                        controller: controller,
                        hintText: "Enter your name",
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
                      }
                      Navigator.pop(context);
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
