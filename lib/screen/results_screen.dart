import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/widgets/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
 const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData.where(
      (data) {
        return data['user_answer'] == data['correct_answer'];
      },
    ).length;


    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          children: [
            Text('you answerd $numCorrectAnswers out of $numTotalQuestions correctly!'),
            SizedBox(height: 20),
            QuestionsSummary(summaryData),
            SizedBox(height: 20),
            TextButton(
              onPressed: onRestart,
              child: Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
