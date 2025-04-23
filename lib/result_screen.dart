// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:quiz_app/style_text.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.restartScreen,
    required this.choosenAnswers,
  });
  final void Function() restartScreen;
  final List<String> choosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < choosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numCorrectQuestions =
        summaryData.where((data) {
          return (data['correct_answer'] == data['user_answer']);
        }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyleText(
              "You answered $numCorrectQuestions out of ${choosenAnswers.length} questions correctly!",
              20,
            ),
            SizedBox(height: 30),
            QuestionsSummary(getSummaryData()),
            SizedBox(height: 30),
            TextButton.icon(
              onPressed: restartScreen,
              icon: Icon(Icons.refresh, size: 25),
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              label: Text(
                'Restart Quiz!',
                style: GoogleFonts.lato(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            // Scrollable(viewportBuilder: viewportBuilder),
          ],
        ),
      ),
    );
  }
}
