import 'package:eduscript/transcript_card.dart';
import 'package:flutter/material.dart';

class ResourceCard extends StatelessWidget {
  const ResourceCard({
    super.key,
  });

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
                  child: const Text(
                    'English Quiz',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    CategoryChip(title: '15 QUESTIONS'),
                    // SizedBox(width: 10),
                    // CategoryChip(),
                  ],
                ),
              ],
            ),
            const Spacer(),
            const Flexible(
                child: Text('5th July',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.normal))),
          ],
        ),
      ),
    );
  }
}
