import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/extensions/text_extension.dart';
import 'package:learners_choice_app/features/Intro/Presentation/UI/name_screen.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 170),
                  child: buildImageWidget(
                    width: 223,
                    height: 49,
                    imagePath: choiceIconPath,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 250,
                  width: 322,
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 15,
                    right: 15,
                    bottom: 17,
                  ),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFFEBE0E2)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(19),
                    child: Text(
                      'Choice Driving School has been providing driving lessons for over 40 years in Vandiperiyar, Idukki District of Kerala. We offer driving lessons for LMV (Light Motor Vehicle) and MCWG (Motor Cycle with Gear and without Gear), as well as services related to License and Vehicle Related Services.\n',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF53433F),
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                        letterSpacing: 0.25,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                    width: 322,
                    height: 157,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFCF1F3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x26000000),
                          blurRadius: 3,
                          offset: Offset(0, 1),
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                          color: Color(0x4C000000),
                          blurRadius: 2,
                          offset: Offset(0, 1),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.settings),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "LMV, MCWG, MCWOG, HMV , Vehicle Insurance",
                                style: context.captionLight,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.mail_outline_outlined),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "choicemdsvpr6669@gmail.com",
                                style: context.captionLight,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Vandiperiyar, Idukki District, Kerala, \npin code: 685509',
                                style: context.captionLight,
                              )
                            ],
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
