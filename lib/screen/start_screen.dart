import 'package:flutter/material.dart'; // Importing the image asset
import 'package:flutter/src/material/outlined_button.dart'; // Importing the OutlinedButton widget

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(200, 255, 255, 255),
          ),
          // Opacity(
          //   opacity: 0.5, // Setting the opacity to 0.8
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          SizedBox(height: 80), // Adding space between the image and the text
          Text(
            'Learn Flutter is Fun',
            style: TextStyle(
              color: const Color.fromARGB(255, 252, 189, 249),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 103, 30, 211),
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 10,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            onPressed:startQuiz,
            icon: Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
              size: 24,
            ),
            label: const Text(
              'Start Quiz',
            ),
          ),
        ],
      ),
    );
  }
}
