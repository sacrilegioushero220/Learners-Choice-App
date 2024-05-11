import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learners_choice_app/Presentation/presentation_layer.dart';
import 'package:learners_choice_app/core/blocs/cubit/cubit/local_storage_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      BlocProvider.of<LocalStorageCubit>(context).checkOnboardStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: BlocListener<LocalStorageCubit, LocalStorageState>(
          listener: (context, state) {
            if (state is OnboardedState) {
              BlocProvider.of<LocalStorageCubit>(context).getProfilePic();
              print("state is :$state");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              );
            } else if (state is NotOnboardedState) {
              print("state is :$state");
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const OnboardingScreen(),
                ),
              );
            }
          },
          child: Container(
            child: const Icon(
              size: 100,
              Icons.book,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
