import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learners_choice_app/core/blocs/cubit/apiCubit/api_cubit.dart';
import 'package:learners_choice_app/core/widgets/my_custom_widgets.dart';

class CustomListViewScreen extends StatelessWidget {
  const CustomListViewScreen({super.key, required this.apiCubit,});
final ApiCubit apiCubit;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>apiCubit,
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
                return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    final item = state.items[index];
                    return CustomListTile2(
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

class CustomListTile2 extends StatelessWidget {
  const CustomListTile2({
    super.key,
    required this.number,
    required this.imagePath,
    required this.title,
  });

  final String number;
  final String imagePath;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF6EBEE),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            child: CachedNetworkImage(
              imageUrl: imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.contain,
              // placeholder: (context, url) => const CircularProgressIndicator(
              //   valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              // ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.left,
              overflow: TextOverflow.visible,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
