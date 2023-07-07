import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_to_text.dart';

class TranscriptionScreen extends StatefulWidget {
  const TranscriptionScreen({super.key});

  @override
  State<TranscriptionScreen> createState() => _TranscriptionScreenState();
}

class _TranscriptionScreenState extends State<TranscriptionScreen> {
  bool _isPlaying = true;
  final stt.SpeechToText _speech = stt.SpeechToText();
  String _text = 'Listening...';
  final double _confidence = 1.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('starting transcription');
    _text = 'Listening...';
    // toggleRecording();
    toggleRecording();
  }

  Future toggleRecording() => SpeechAPI.toggleRecording(
        onResult: (text) {
          setState(() => _text = text);
          print('text: $_text');
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFfaf8f6),
        onPressed: () {
          setState(() {
            _isPlaying = !_isPlaying;
          });
        },
        child: Icon(
          _isPlaying ? FeatherIcons.pause : Icons.play_arrow,
          color: Colors.red,
        ),
      ),
      backgroundColor: const Color(0xFFfaf8f6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFfaf8f6),
        title: Column(
          children: [
            const Text(
              'TRANSCRIPTION',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            // Currently Recording or Currently Paused
            Container(
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                color: _isPlaying ? Colors.green[100] : Colors.deepOrange[100],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                _isPlaying ? 'Currently Recording' : 'Currently Paused',
                style: TextStyle(
                  color:
                      _isPlaying ? Colors.green[700] : Colors.deepOrange[700],
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
        // Lead actions
        leading: IconButton(
          icon: const Icon(Icons.arrow_downward_rounded),
          color: const Color(0xFF8b8c92),
          onPressed: () {
            SpeechAPI.cancelRecording();
            SpeechAPI.stopRecording();
            _text = 'Listening...';
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text(
            _text,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

class SpeechAPI {
  static final _speech = SpeechToText();

  static Future<bool> toggleRecording({
    required Function(String text) onResult,
  }) async {
    final isAvailable = await _speech.initialize();
    if (isAvailable) {
      _speech.listen(
        onResult: (value) => onResult(value.recognizedWords),
      );
    }

    return isAvailable;
  }

  static Future stopRecording() => _speech.stop();
  // Clear Recognized Words
  static Future cancelRecording() => _speech.cancel();
}
