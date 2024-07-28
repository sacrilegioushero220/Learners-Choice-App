import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/extensions/text_extension.dart';
import 'package:learners_choice_app/core/widgets/my_custom_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BuildImageWidget(
                width: 500,
                height: 120,
                imagePath: choiceIconPath,
              ),
              //
              const BuildAboutDescriptionCard(),
              const SizedBox(
                height: 20,
              ),
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
              const SizedBox(
                height: 40,
              ),
              BottomInfoCard(
                developerTap: () {
                  const String website = "https://www.abhiramtsabu.com";
                  launchUrl(Uri.parse(website));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomInfoCard extends StatelessWidget {
  const BottomInfoCard({
    super.key,
    this.privacyPolicyTap,
    this.developerTap,
  });
  final void Function()? privacyPolicyTap;
  final void Function()? developerTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Text(
            "Choice Driving School, Ayyapara Building, Chottupara PO, Vandiperiyar, Idukki, 685533",
            textAlign: TextAlign.center,
            style: context.captionLight,
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: privacyPolicyTap,
            child: Text("Privacy Policy",
                style: GoogleFonts.roboto(
                    color: const Color.fromARGB(255, 101, 98, 98))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 10),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: "Developed with 💙 by ",
                  style: GoogleFonts.roboto(
                      color: const Color.fromARGB(255, 101, 98, 98))),
              WidgetSpan(
                child: GestureDetector(
                  onTap: developerTap,
                  child: Text("Abhiram",
                      style: GoogleFonts.roboto(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple)),
                ),
              )
            ])),
          ),
        ],
      ),
    );
  }
}
