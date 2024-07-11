import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ActsCard extends StatelessWidget {
  const ActsCard({
    super.key,
    required this.sectionNumber,
    required this.description,
    required this.title,
  });
  final String sectionNumber;
  final String description;
  final String title;
  @override
  Widget build(BuildContext context) {
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SectionCard(
                sectionNumber: sectionNumber,
              ),
              const SizedBox()
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text.rich(
              textAlign: TextAlign.justify,
              TextSpan(
                children: [
                  TextSpan(
                    text: "$title: ",
                    style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  TextSpan(
                    text: description,
                    style:
                        GoogleFonts.roboto(color: Colors.black, fontSize: 16),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  final String _sectionNumber;
  const SectionCard({
    super.key,
    required String sectionNumber,
  }) : _sectionNumber = sectionNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        border: Border.all(
          width: 1,
          color: const Color(0xFFEBE0E2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          "Section $_sectionNumber",
          style: GoogleFonts.roboto(
              color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
