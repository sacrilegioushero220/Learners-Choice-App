import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learners_choice_app/core/blocs/cubit/localStorageCubit/local_storage_cubit.dart';
import 'package:learners_choice_app/core/widgets/show_profile_dialog.dart';

PreferredSizeWidget customAppBar(BuildContext context,
    {String customAppBarTitle = "Learner's Choice"}) {
  String profilePicPath = "";
  return PreferredSize(
    preferredSize: const Size.fromHeight(65.0),
    child: AppBar(
      //elevation: 1,
      scrolledUnderElevation: 0,
      toolbarHeight: 70,
      backgroundColor: const Color(0xFFF6EBEE),
      leading: Builder(builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(18),
          child: SvgPicture.asset(
            "assets/snack_bar.svg",
            // ignore: deprecated_member_use
            color: const Color(0xFF410002),
          ),
        );
      }),
      title: Text(customAppBarTitle),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: SizedBox(
            width: 30,
            height: 30,
            child: GestureDetector(
              onTap: () {
                showProfileDialog(context);
              },
              child: BlocConsumer<LocalStorageCubit, LocalStorageState>(
                listener: (context, state) {
                  // Handle state changes if needed
                },
                builder: (context, state) {
                  if (state is ProfileFetchedState ||
                      state is ProfileUpdatedState) {
                    final profilePic = state is ProfileFetchedState
                        ? state.profilePic
                        : (state as ProfileUpdatedState).profilePic;
                    profilePicPath = profilePic;
                    return CircleAvatar(
                      radius: 130, // Adjust the radius as needed
                      backgroundImage: FileImage(File(profilePic)),
                    );
                  }
                  return CircleAvatar(
                    radius: 130,
                    backgroundImage: FileImage(File(profilePicPath)),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
