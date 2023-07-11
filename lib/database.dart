import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future<void> addTranscriptToDB(map) async {
    await FirebaseFirestore.instance.collection('transcripts').add(map);
  }
}
