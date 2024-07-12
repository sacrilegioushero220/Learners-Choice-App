import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/extensions/text_extension.dart';

class BuildInfoTileCard extends StatelessWidget {
  const BuildInfoTileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Row(
          children: [
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.settings),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            services,
                            style: context.captionLight,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.mail_outline_outlined),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            mailId,
                            style: context.captionLight,
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          const Icon(Icons.call),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              "Mobile:\n+91 9846090270, +91 9995543742",
                              style: context.captionLight,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    locationIcon,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
