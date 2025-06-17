import 'package:flutter/material.dart';

class LetterScreen extends StatelessWidget {
  const LetterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFbfefff),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("To My Special,", style: TextStyle(fontSize: 28, color: Color(0xFF01579b))),
                    SizedBox(height: 20),
                    Text(
                      "I hope this message finds you with a smile as bright as the candles on your cake. "
                      "Today is your day, a celebration of all the amazing moments we've shared and "
                      "the incredible memories yet to come.\n\n"
                      "You've been a shining light in my life, a source of laughter, support, and endless inspiration. "
                      "This birthday, I wish you happiness that knows no bounds, dreams that soar higher than ever, "
                      "and a heart filled with love.\n\n"
                      "Never forget how truly special you are — not just today but every day. Cheers to you and "
                      "all the beautiful moments waiting for you ahead!",
                      style: TextStyle(fontSize: 22, height: 1.6),
                    ),
                    SizedBox(height: 40),
                    Text(
                      "With all my love and best wishes,\nYour Friend 💙",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Column(
                children: [
                  Image.asset('assets/images/heart.gif', width: 150),
                  const SizedBox(height: 15),
                  const Text(
                    "Wishing you endless love and happiness ❤️",
                    style: TextStyle(fontSize: 18, color: Colors.pinkAccent, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF64b5f6),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Back to Surprise", style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
