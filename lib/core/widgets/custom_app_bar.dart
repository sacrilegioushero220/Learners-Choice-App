import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learners_choice_app/core/blocs/cubit/cubit/local_storage_cubit.dart';
import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/extensions/color_extention.dart';

PreferredSizeWidget customAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: context.onPrimary,
    leading: Builder(builder: (BuildContext context) {
      return const Icon(Icons.menu);
    }),
    title: Text(appBarTitle),
    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: SizedBox(
          width: 30,
          height: 30,
          child: BlocBuilder<LocalStorageCubit, LocalStorageState>(
            builder: (context, state) {
              print("current state in homeScreen is $state");
              if (state is ProfilePicFetchState) {
                return CircleAvatar(
                  radius: 130, // Adjust the radius as needed
                  backgroundImage: FileImage(File(state.profilePic)),
                );
              }

              return CircleAvatar(
                backgroundImage: AssetImage(avatar1Path),
              );
            },
          ),
        ),
      ),
    ],
  );
}
