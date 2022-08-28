import 'package:flutter/material.dart';
import "package:bmi_calc/result_page.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  double? bmi = 0;
  String? message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(24, 233, 111, 0.7),
        title: Text("BMI calculator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16)),
            const Text(
              "Enter your data to calculate",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Image.asset(
                '/Users/vatranrobert/Desktop/bmi_calc/lib/assets/images/bmi.png'),
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Height (cm)'),
              controller: _heightController,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'kg'),
              controller: _weightController,
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                _calculate();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => ResultRoute(
                          bmi: bmi,
                          message: message,
                          wheight: _weightController,
                          height: _heightController,
                        )),
                  ),
                );
              },
              child: Text(
                "CALCULATE",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 70),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  primary: Colors.green),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }

  void _calculate() {
    final double? height = double.tryParse(_heightController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);

    if (height == null || height <= 0 || weight == null || weight <= 0) {
      setState(() {
        message = "Incorrect data!";
        bmi = 0;
      });
      return;
    }

    setState(() {
      bmi = (weight / height / height) * 10000;
      if (bmi! < 18.5) {
        message = "You are underweight";
      } else if (bmi! < 25) {
        message = 'Your body is fine';
      } else if (bmi! < 30) {
        message = 'You are overweight';
      } else {
        message = 'You are obese';
      }
    });
  }
}
