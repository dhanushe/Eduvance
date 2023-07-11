import 'package:flutter/material.dart';

class TranscriptCard extends StatelessWidget {
  TranscriptCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.wordCount,
    required this.date,
  });

  String title;
  String subtitle;
  String date;
  String wordCount;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          // thin border
          border: Border.all(
            color: Colors.grey.withOpacity(0.3),
            width: 1,
          ),
          // border
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 0.2,
              blurRadius: 8,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Category Chips(rounded rectangles)

                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Expanded(
                    // widthFactor: 0.8,
                    child: Text(
                      // Trim subtitle to 33 characters
                      subtitle.length > 33
                          ? '${subtitle.substring(0, 33)}...'
                          : subtitle,
                      style: const TextStyle(
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    CategoryChip(title: '$wordCount WORDS'),
                    // SizedBox(width: 10),
                    // CategoryChip(),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Flexible(
                child: Text(date,
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.normal))),
          ],
        ),
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  CategoryChip({
    super.key,
    required this.title,
  });

  // title
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFfeeeeb),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(5),
      child: Text(
        title,
        style: const TextStyle(
            color: Color(0xFFcb7064),
            fontSize: 15,
            fontWeight: FontWeight.normal),
      ),
    );
  }
}
