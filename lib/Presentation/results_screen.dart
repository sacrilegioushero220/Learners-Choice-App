import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learners_choice_app/core/blocs/cubit/apiCubit/api_cubit.dart';

import 'package:learners_choice_app/core/widgets/my_custom_widgets.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiCubit()..fetchItems(),
      child: Scaffold(
        appBar: customAppBar(context),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 8,
            right: 8,
          ),
          child: BlocBuilder<ApiCubit, ApiState>(
            builder: (context, state) {
              if (state is ApiLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ApiLoaded) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 5,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    return CustomListTile(
                      number: item['no'],
                      imagePath: item['imagePath'],
                      title: item['title'],
                    );
                  },
                );
              } else if (state is ApiError) {
                return Center(child: Text('Error: ${state.message}'));
              } else {
                return const Center(child: Text('No data available'));
              }
            },
          ),
        ),
      ),
    );
  }
}
