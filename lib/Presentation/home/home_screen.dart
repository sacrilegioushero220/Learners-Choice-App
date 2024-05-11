import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learners_choice_app/core/blocs/cubit/cubit/local_storage_cubit.dart';
import 'package:learners_choice_app/presentation/Intro/name_screen.dart';
import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/extensions/color_extention.dart';
import 'package:learners_choice_app/core/extensions/text_extension.dart';
import 'package:learners_choice_app/core/widgets/custom_grid_view_item.dart';
import 'package:learners_choice_app/core/widgets/ll_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

@override
void initState(context) {
  BlocProvider.of<LocalStorageCubit>(context).getProfilePic();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.onPrimary,
      appBar: AppBar(
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 15,
              ),
              buildImageWidget(
                width: 278,
                height: 138,
                imagePath: carHomePage,
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                "Mock Test",
                style: context.lightTextTheme.headlineMedium,
              ),
              const SizedBox(
                height: 25,
              ),
              buildLLTile(context),
              const SizedBox(
                height: 35,
              ),
              Text(
                "Keep Learning",
                style: context.lightTextTheme.headlineMedium,
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 250,
                width: 330,
                child: GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 3,
                  children: [
                    BuildCustomGridViewItem(
                      iconPath: gridViewItemIcon1,
                      label: gridViewItemlabel1,
                    ),
                    BuildCustomGridViewItem(
                      iconPath: gridViewItemIcon2,
                      label: gridViewItemlabel2,
                    ),
                    BuildCustomGridViewItem(
                      iconPath: gridViewItemIcon3,
                      label: gridViewItemlabel3,
                    ),
                    BuildCustomGridViewItem(
                      iconPath: gridViewItemIcon4,
                      label: gridViewItemlabel4,
                    ),
                    BuildCustomGridViewItem(
                      iconPath: gridViewItemIcon5,
                      label: gridViewItemlabel5,
                    ),
                    BuildCustomGridViewItem(
                      iconPath: gridViewItemIcon6,
                      label: gridViewItemlabel6,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
