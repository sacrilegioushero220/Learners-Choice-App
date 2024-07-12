import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/widgets/my_custom_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              BuildImageWidget(
                width: 500,
                height: 150,
                imagePath: choiceIconPath,
              ),
              //
              const BuildAboutDescriptionCard(),
              const SizedBox(height: 30),
              BuildInfoTileCard(
                mailTap: () async {
                  final Uri url =
                      Uri(scheme: 'mailto', path: "choicemdsvpr6669@gmail.com");
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    throw Exception('url cannnot be launched');
                  }
                },
                locateUsTap: () {
                  const String googleMap =
                      "https://maps.app.goo.gl/axwWHAoFEDbYASWE7";
                  launchUrl(Uri.parse(googleMap));
                },
                phoneTap1: () async {
                  final Uri url = Uri(scheme: 'tel', path: "+919846090270");
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    throw Exception('url cannnot be launched');
                  }
                },
                phoneTap2: () async {
                  final Uri url = Uri(scheme: 'tel', path: "+919995543742");
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    throw Exception('url cannnot be launched');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
