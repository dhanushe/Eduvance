import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
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
        child: const SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 45),
                // Rounded View with title and description
                TranscriptCard(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        backgroundColor: Colors.red.shade300,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class TranscriptCard extends StatelessWidget {
  const TranscriptCard({
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
                    'English',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Category Chips(rounded rectangles)

                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    'A platform to learn and practice coding',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                const Row(
                  children: [
                    CategoryChip(),
                    SizedBox(width: 10),
                    CategoryChip(),
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

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFfeeeeb),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(5),
      child: const Text(
        'LONG',
        style: TextStyle(
            color: Color(0xFFcb7064),
            fontSize: 15,
            fontWeight: FontWeight.normal),
      ),
    );
  }
}
