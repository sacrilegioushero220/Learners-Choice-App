import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learners_choice_app/core/blocs/cubit/localStorageCubit/local_storage_cubit.dart';
import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/extensions/color_extention.dart';
import 'package:learners_choice_app/core/widgets/show_profile_dialog.dart';

PreferredSizeWidget customAppBar(BuildContext context,
    {String customAppBarTitle = "Learner's Choice"}) {
  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: context.onPrimary,
    leading: Builder(builder: (BuildContext context) {
      return const Icon(Icons.menu);
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
                  return CircleAvatar(
                    radius: 130, // Adjust the radius as needed
                    backgroundImage: FileImage(File(profilePic)),
                  );
                }
                return CircleAvatar(
                  backgroundImage: AssetImage(avatar1Path),
                );
              },
            ),
          ),
        ),
      ),
    ],
  );
}
