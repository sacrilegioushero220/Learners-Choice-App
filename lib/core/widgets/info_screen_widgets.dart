import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/extensions/text_extension.dart';
import 'package:learners_choice_app/core/widgets/my_custom_widgets.dart';

Widget buildInfoTileCard(BuildContext context) {
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
                  Row(
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
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Image.asset(
                locationIcon,
              )),
        ],
      ),
    ),
  );
}

Widget buildAboutCard(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(
      top: 10,
      left: 15,
      right: 15,
      bottom: 17,
    ),
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFFEBE0E2)),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(19),
      child: Text(
        choiceDescription,
        textAlign: TextAlign.center,
        style: _choiceTextStyle(),
      ),
    ),
  );
}

TextStyle? _choiceTextStyle() {
  return const TextStyle(
    color: Color(0xFF53433F),
    fontSize: 14,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.25,
  );
}
