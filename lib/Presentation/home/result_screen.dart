import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learners_choice_app/core/blocs/cubit/docLoaderCubit/doc_loader_cubit.dart';
import 'package:learners_choice_app/core/blocs/cubit/docLoaderCubit/doc_loader_state.dart';
import 'package:learners_choice_app/core/widgets/my_custom_widgets.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({
    super.key,
    this.appBarTitle,
    required this.docsLoaderCubit,
  });
  final String? appBarTitle;
  final DocLoaderCubit docsLoaderCubit;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    super.initState();
    widget.docsLoaderCubit.fetchDriverActs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        customAppBarTitle: widget.appBarTitle ?? "",
      ),
      body: BlocBuilder<DocLoaderCubit, DocLoaderState>(
        builder: (context, state) {
          if (state is DocLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DriverActsLoaded) {
            // Print the fetched data for debugging
            print("DriverActs Data Loaded: ${state.driverActs}");
            return Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final driverActs = state.driverActs[index];

                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: ActsCard(
                        sectionNumber: driverActs.sectionNumber.toString(),
                        description: driverActs.description ?? "",
                        title: driverActs.title ?? "",
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: state.driverActs.length),
            );
          } else if (state is DocLoaderError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            BlocProvider.of<DocLoaderCubit>(context).fetchDriverActs();
            return const Center(
                child: Text(
              'No data available',
              style: TextStyle(color: Colors.black),
            ));
          }
        },
      ),
    );
  }
}
