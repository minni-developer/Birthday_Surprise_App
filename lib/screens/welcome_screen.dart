import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin {
  final TextEditingController _wishController = TextEditingController();
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool showMainPage = false;
  bool candlesLit = true;
  int flippedCount = 0;
  final List<bool> cardFlipped = List.filled(4, false);
  final List<String> messages = [
    "Wishing you endless joy and laughter!",
    "May your dreams always shine bright!",
    "Here’s to another year of amazing adventures!",
    "Keep being the wonderful person you are!"
  ];

  @override
  void initState() {
    super.initState();
    _audioPlayer.setReleaseMode(ReleaseMode.loop);
    _audioPlayer.play(AssetSource('audio/birthday.m4a'));
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _wishController.dispose();
    super.dispose();
  }

  void _flipCard(int index) {
    if (!cardFlipped[index]) {
      setState(() {
        cardFlipped[index] = true;
        flippedCount++;
        if (flippedCount == cardFlipped.length) {
          // trigger confetti later if needed
        }
      });
    }
  }

  void _toggleCandles() {
    setState(() {
      candlesLit = !candlesLit;
    });
    if (!candlesLit) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Make your wish and send it!")),
      );
    }
  }

  void _sendWish() async {
    final String wish = _wishController.text.trim();
    if (wish.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please type your wish before sending.")),
      );
      return;
    }

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'manahilsabir544@gmail.com',
      queryParameters: {
        'subject': 'My Birthday Wish',
        'body': wish,
      },
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Couldn't open email app.")),
      );
    }
  }

  Widget _buildCard(int index) {
    return GestureDetector(
      onTap: () => _flipCard(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: 150,
        height: 200,
        decoration: BoxDecoration(
          color: cardFlipped[index] ? Colors.lightBlue[100] : Colors.yellow[100],
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10)],
        ),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            cardFlipped[index] ? messages[index] : "Click me!",
            style: TextStyle(
              fontSize: 18,
              color: cardFlipped[index] ? Colors.blue[900] : Colors.black87,
              fontStyle: cardFlipped[index] ? FontStyle.italic : FontStyle.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 700),
        child: showMainPage ? _buildMainPage() : _buildOverlay(),
      ),
    );
  }

  Widget _buildOverlay() {
    return Container(
      color: const Color(0xFFb2ebf2),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Did you think I forgot?", style: TextStyle(fontSize: 28)),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(onPressed: () {
                  setState(() {
                    showMainPage = true;
                  });
                }, child: const Text("No")),
                const SizedBox(width: 20),
                ElevatedButton(onPressed: () {
                  setState(() {
                    showMainPage = true;
                  });
                }, child: const Text("Yes")),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Good! Because I didn’t! 😎", style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }

  Widget _buildMainPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("🎂 Happy Birthday!", style: TextStyle(fontSize: 34, color: Color(0xFF01579b))),
          const SizedBox(height: 24),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children: List.generate(4, _buildCard),
          ),
          const SizedBox(height: 36),
          Column(
            children: [
              const Text("Make a Wish!", style: TextStyle(fontSize: 24, color: Color(0xFF01579b))),
              const SizedBox(height: 16),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: 220,
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFc332ab), Color(0xFFfbc02d)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: const Color(0xFFc332ab), width: 2),
                      boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10)],
                    ),
                  ),
                  if (candlesLit)
                    Positioned(
                      top: -30,
                      child: Container(
                        width: 10,
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFF42a5f5),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Align(
                          alignment: Alignment.topCenter,
                          child: Icon(Icons.whatshot, color: Colors.amber, size: 18),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _toggleCandles,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3bb7b7),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                ),
                child: Text(
                  candlesLit ? "Blow Out Candles & Make a Wish" : "Candles Blown Out!",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _wishController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Type your wish here... Quick!",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _sendWish,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF64b5f6),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                ),
                child: const Text("Send Wish", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: () => Navigator.pushNamed(context, '/letter'),
            icon: const Icon(Icons.menu_book),
            label: const Text("Read Your Special Letter 📜"),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF64b5f6),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ],
      ),
    );
  }
}
