import "package:flutter/material.dart";
import "package:bmi_calc/main.dart";

class ResultRoute extends StatelessWidget {
  final bmi;
  final message;
  final wheight;
  final height;
  const ResultRoute({this.bmi, this.message, this.wheight, this.height});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 213, 217, 219),
      appBar: AppBar(
        title: Text("Your BMI "),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 350,
              height: 350,
              decoration: BoxDecoration(
                  color: Color.fromARGB(161, 173, 173, 177).withOpacity(0.5),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your BMI is:",
                      style: TextStyle(fontSize: 40),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "$bmi" == null
                          ? "Enter value"
                          : "${bmi?.toStringAsFixed(1)}",
                      style:
                          TextStyle(fontSize: 100, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      "$message",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color:
                              bmi <= 25 && bmi > 0 ? Colors.green : Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                clearText();
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 70),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  primary: Colors.red),
              child: const Text(
                "GO BACK",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void clearText() {
    wheight.clear();
    height.clear();
  }
}
