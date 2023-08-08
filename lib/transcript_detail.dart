import 'package:eduscript/transcript_card.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TranscriptDetailScreen extends StatefulWidget {
  const TranscriptDetailScreen({super.key});

  @override
  State<TranscriptDetailScreen> createState() => _TranscriptDetailScreenState();
}

class _TranscriptDetailScreenState extends State<TranscriptDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          // Actions to share and copy information
          actions: [
            IconButton(
              onPressed: () {
                // Share the transcript
              },
              icon: Icon(
                FeatherIcons.share,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                // Copy the transcript
              },
              icon: Icon(
                FeatherIcons.copy,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Photosynthesis Lecture',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  Row(
                    children: [
                      CategoryChip(title: '150 WORDS'),
                      SizedBox(width: 10),
                      CategoryChip(title: '5 MINUTES'),
                    ],
                  ),
                  SizedBox(height: 35),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Text(
                      'During the photosynthesis class, students learned about the fundamental process by which plants convert sunlight into energy. The instructor explained how chlorophyll, the green pigment in plant cells, captures light energy and transforms carbon dioxide and water into glucose and oxygen. Through interactive visuals and engaging discussions, the students gained a deeper understanding of the role photosynthesis plays in sustaining life on Earth and its significance in the global ecosystem. They left the class with a newfound appreciation for the intricate wonders of nature\'s energy production system.',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // Summary button
                  SizedBox(height: 35),
                  Row(
                    children: [
                      Container(
                        // Half of the screen width
                        width: MediaQuery.of(context).size.width / 3,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            // Show Cupertino Bottom Sheet
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) => CupertinoActionSheet(
                                title: Text(
                                  'Summary',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                message: Text(
                                  'During the photosynthesis class, students learned about the fundamental process by which plants convert sunlight into energy. The instructor explained how chlorophyll, the green pigment in plant cells, captures light energy and transforms carbon dioxide and water into glucose and oxygen. Through interactive visuals and engaging discussions, the students gained a deeper understanding of the role photosynthesis plays in sustaining life on Earth and its significance in the global ecosystem. They left the class with a newfound appreciation for the intricate wonders of nature\'s energy production system.',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                                cancelButton: CupertinoActionSheetAction(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Close',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                // Another button to share
                                actions: [
                                  CupertinoActionSheetAction(
                                    onPressed: () {
                                      // Share the summary
                                    },
                                    child: Text(
                                      'Share',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  // another button to copy
                                  CupertinoActionSheetAction(
                                    onPressed: () {
                                      // Copy the summary
                                    },
                                    child: Text(
                                      'Copy',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Text(
                            'SUMMARY',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      // Glossary Button
                      SizedBox(width: 10),
                      Container(
                        // Half of the screen width
                        width: MediaQuery.of(context).size.width / 3,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            // Show Cupertino Bottom Sheet with the different words and their definitions
                            showCupertinoModalPopup(
                              context: context,
                              builder: (context) => CupertinoActionSheet(
                                title: Text(
                                  'Glossary',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                message: Text(
                                  'Chlorophyll: The green pigment in plant cells that captures light energy and transforms carbon dioxide and water into glucose and oxygen.\n\nPhotosynthesis: The process by which plants convert sunlight into energy.\n\nGlucose: A simple sugar that is an important energy source in living organisms and is a component of many carbohydrates.\n\nOxygen: A colorless, odorless reactive gas, the chemical element of atomic number 8 and the life-supporting component of the air.',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                                cancelButton: CupertinoActionSheetAction(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Close',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                // Another button to share
                                actions: [
                                  CupertinoActionSheetAction(
                                    onPressed: () {
                                      // Share the glossary
                                    },
                                    child: Text(
                                      'Share',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  // another button to copy
                                  CupertinoActionSheetAction(
                                    onPressed: () {
                                      // Copy the glossary
                                      Navigator.pop(context);
                                      // Display Cupertino Alert Dialog that says "Copied!"
                                      showCupertinoDialog(
                                        context: context,
                                        builder: (context) =>
                                            CupertinoAlertDialog(
                                          title: Text('Copied!'),
                                          actions: [
                                            CupertinoDialogAction(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('Close'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Copy',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Text(
                            'GLOSSARY',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
