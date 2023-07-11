import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduscript/database.dart';
import 'package:eduscript/resource_card.dart';
import 'package:eduscript/transcript_card.dart';
import 'package:eduscript/transcription_screen.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduScript',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        // GoogleFonts Open Sans
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentSelection = 0;
  DatabaseMethods databaseMethods = DatabaseMethods();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // init firebase
    initFirebase();
  }

  initFirebase() async {
    await Firebase.initializeApp();
    print('firebase initialized');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFfaf8f6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFfaf8f6),
        title: const Text(
          'EDUSCRIPT',
          style: TextStyle(
            color: Colors.red,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
        // Lead actions
        leading: IconButton(
          icon: const Icon(FeatherIcons.menu),
          color: const Color(0xFF8b8c92),
          onPressed: () {},
        ),
        // Trailing
        actions: <Widget>[
          IconButton(
            icon: const Icon(FeatherIcons.search),
            color: const Color(0xFF8b8c92),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(FeatherIcons.bell),
            color: const Color(0xFF8b8c92),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
      ),
      body: Container(
        // Rounded Corners at the top
        decoration: const BoxDecoration(
          color: Colors.white,
          // color: Colors.black
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 45),

                // Segmented Control for Transcription vs Resource Generation
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: CupertinoSlidingSegmentedControl(
                      groupValue: _currentSelection,
                      thumbColor: Colors.red.shade300,
                      children: {
                        0: Text(
                          'Transcription',
                          style: TextStyle(
                            color: _currentSelection == 0
                                ? Colors.white
                                : Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        1: Text(
                          'Resources',
                          style: TextStyle(
                            color: _currentSelection == 1
                                ? Colors.white
                                : Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      },
                      onValueChanged: (i) {
                        setState(() {
                          _currentSelection = i as int;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Rounded View with title and description
                _buildHomeListView(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_currentSelection == 0) _showOverlay(context);
          if (_currentSelection == 1) {
            // Show Cupertino Bottom Sheet with different resource options
            showCupertinoModalPopup<void>(
              context: context,
              builder: (BuildContext context) => CupertinoActionSheet(
                title: const Text('Select Resource Type'),
                message: const Text(
                    'Some of these resources are generated by AI. For these resources, you are limited to 5 free resources per day.'),
                actions: <CupertinoActionSheetAction>[
                  CupertinoActionSheetAction(
                    child: const Text('Summary'),
                    onPressed: () {
                      Navigator.pop(context);
                      _showCreateResourceBottomSheet(
                          context, ResourceType.summary);
                    },
                  ),
                  CupertinoActionSheetAction(
                    child: const Text('Flashcards'),
                    onPressed: () {
                      Navigator.pop(context);
                      _showCreateResourceBottomSheet(
                          context, ResourceType.flashcards);
                    },
                  ),
                  CupertinoActionSheetAction(
                    child: const Text('Quiz'),
                    onPressed: () {
                      Navigator.pop(context);
                      _showCreateResourceBottomSheet(
                          context, ResourceType.quiz);
                    },
                  ),
                  CupertinoActionSheetAction(
                    child: const Text('Notes'),
                    onPressed: () {
                      Navigator.pop(context);
                      _showCreateResourceBottomSheet(
                          context, ResourceType.notes);
                    },
                  ),
                  CupertinoActionSheetAction(
                    child: const Text('Video Reccomendation'),
                    onPressed: () {
                      Navigator.pop(context);
                      _showCreateResourceBottomSheet(
                          context, ResourceType.video);
                    },
                  ),
                ],
              ),
            );
          }
        },
        tooltip: 'Increment',
        backgroundColor: Colors.red.shade300,
        child: Icon(
            _currentSelection == 0 ? FeatherIcons.mic : FeatherIcons.plus,
            color: Colors.white),
      ),
    );
  }

  _showCreateResourceBottomSheet(
      BuildContext context, ResourceType rtype) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        height: 1500,
        child: FractionallySizedBox(
          widthFactor: 1.0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 30),
              Text(
                'Create a new ${ResourceTypeHelper.getString(rtype)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Select a transcription to use',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),

              const SizedBox(height: 20),

              // Small Card View for all Transcriptions
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          // Show a loading indicator
                          showCupertinoDialog(
                            context: context,
                            builder: (context) => const CupertinoAlertDialog(
                              title: Text('Loading'),
                              content: CupertinoActivityIndicator(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(
                                    0,
                                    3,
                                  ), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Transcription ${index + 1}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nisl nisl ultricies.',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildHomeListView() {
    if (_currentSelection == 0) {
      // return const Column(
      //   children: [
      //     Center(child: TranscriptCard()),
      //     SizedBox(height: 20),
      //     Center(child: TranscriptCard()),
      //   ],
      // );
      print('here');
      return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('transcripts').snapshots(),
        builder: ((context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: (snapshot.data!).docs.length,
                  itemBuilder: ((context, index) {
                    QueryDocumentSnapshot<Object?> data =
                        (snapshot.data!).docs[index];
                    return TranscriptCard(
                      title: (data['title'] as String),
                      subtitle: data['text'] as String,
                      wordCount: data['wordCount'],
                      date: data['date'] as String,
                    );
                  }),
                )
              : const Center(child: CircularProgressIndicator());
        }),
      );
    } else {
      return const Center(child: ResourceCard());
    }
  }

  void _showOverlay(BuildContext context) {
    // Show Cupertino Alert with Text Field
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: const Column(
                children: [
                  Text('Transcribe'),
                  SizedBox(height: 10),
                ],
              ),
              // Text Field
              content: CupertinoTextField(
                placeholder: 'Title',
                autofocus: true,
                controller: titleController,
              ),
              actions: [
                CupertinoDialogAction(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CupertinoDialogAction(
                  child: const Text('Transcribe'),
                  onPressed: () {
                    Navigator.pop(context);
                    // Show Transcription Screen animated from bottom
                    Navigator.of(context).push(_createRoute());
                  },
                ),
              ],
            ));
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          TranscriptionScreen(title: titleController.text),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

// enum for resource type
enum ResourceType {
  summary,
  flashcards,
  quiz,
  notes,
  video,
}

// Helper class for resource type
class ResourceTypeHelper {
  static String getString(ResourceType rtype) {
    switch (rtype) {
      case ResourceType.summary:
        return 'Summary';
      case ResourceType.flashcards:
        return 'Flashcards';
      case ResourceType.quiz:
        return 'Quiz';
      case ResourceType.notes:
        return 'Notes';
      case ResourceType.video:
        return 'Video';
      default:
        return 'Summary';
    }
  }
}
