import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:learners_choice_app/Presentation/home/pdf_screen.dart';
import 'package:learners_choice_app/Presentation/home/result_screen.dart';
import 'package:learners_choice_app/Presentation/home/sync_pdf_screen.dart';
import 'package:learners_choice_app/core/blocs/cubit/docLoaderCubit/doc_loader_cubit.dart';

import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/extensions/color_extention.dart';
import 'package:learners_choice_app/core/widgets/doc_tile.dart';

class DocsScreen extends StatelessWidget {
  const DocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    final List<Widget> docTiles = [
      DocTile(
        iconPath: acts2IconPath,
        title: docTilelabel8,
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => ResultScreen(
                      appBarTitle: "Important acts for drivers",
                      docsLoaderCubit: DocLoaderCubit(DefaultCacheManager())
                        ..fetchDriverActs(),
                    ))),
      ),
      DocTile(
        iconPath: infoIconPath,
        title: docTilelabel2,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const SyncPdfScreen(
                  documentPath: 'assets/pdf/DrivingSyllabus.pdf',
                  appBarTitle: 'Driving School Syllabus',
                ),
              ));
        },
      ),
      DocTile(
        iconPath: actsIconPath,
        title: docTilelabel3,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const SyncPdfScreen(
                  documentPath: 'assets/pdf/CMV.pdf',
                  appBarTitle: 'The Motor Vehicles Act 1988',
                ),
              ));
        },
      ),
      DocTile(
        iconPath: speedLimitIconPath,
        title: docTilelabel4,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const SyncPdfScreen(
                  documentPath: 'assets/pdf/SpeedLimit.pdf',
                  appBarTitle: 'Speed Limits of Indian Roads',
                ),
              ));
        },
      ),
      DocTile(
        iconPath: codeIconPath,
        title: docTilelabel5,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const SyncPdfScreen(
                  documentPath: 'assets/pdf/RegistartionCode.pdf',
                  appBarTitle: 'Vehicle Registration Codes',
                ),
              ));
        },
      ),
      DocTile(
        iconPath: hTrackIconPath,
        title: docTilelabel6,
      ),
      DocTile(
        iconPath: roadSignIconPath,
        title: docTilelabel7,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const SyncPdfScreen(
                  documentPath: 'assets/pdf/roadTest.pdf',
                  appBarTitle: 'Vehicle Registration Codes',
                ),
              ));
        },
      ),
    ];
    return Scaffold(
      backgroundColor: context.onPrimary,
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Scrollbar(
          thumbVisibility: true,
          controller: scrollController,
          child: ListView.separated(
            controller: scrollController,
            itemCount: docTiles.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: docTiles[index],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 15,
              );
            },
          ),
        ),
      ),
    );
  }
}
