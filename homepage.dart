import 'dart:io';
import 'dart:math';

import 'package:untitled6/page.dart';



void main() {
  var game = page();
  guessresult? guessResult;
  print("‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗");
  print("    GAME START 🎮    ");

  print("‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗");

  for (int i = 0;; i++) {
    print("Answer = ${game.answer}");
    stdout.write('➝ Guess the number between 1 - 100 : ');
    var input = stdin.readLineSync();
    if (input == null) {
      return;
    }
    var guess = int.tryParse(input);
    guessResult = game.doguess(guess!);

    if (guessResult == guessresult.correct) {
      print(" $guess is coorrect,total guesses : ${page.myList.length}");

      print("‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗");
      print("   Play Again? ( Y / N ) ");
      input = stdin.readLineSync();

      if (input == "Y" || input == "y") {
        game.answer = Random().nextInt(100) + 1;
        continue;
      } else if((input == "N" || input == "n")){
        print("‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗");
        print("      goodbye 👋   ");
        print("‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗");
        break;
      }else {
        break;
      }
    } else if (guessResult == guessresult.tooHigh) {
      print("‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗");
      print(" > $guess is Too HIGH  !! ");
      print("‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗");
    } else {
      print("‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗");
      print(" > $guess is Too Low !!  ");
      print("‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗‗");
    }
  }
}