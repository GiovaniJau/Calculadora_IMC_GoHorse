import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC Go Horse',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculadora de IMC Go Horse'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Gender { male, female }

class results_object {
  String? resultText;
  TextStyle? resultTextStyle;

  results_object({this.resultText,
    this.resultTextStyle});
}

class _MyHomePageState extends State<MyHomePage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  double? _bmi;
  late String bmiResult;
  results_object result = results_object();

  bool showResults = false;
  double tmbResult = 0;
  String? basalMetabolism;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: !showResults ?
        Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: selectedGender == Gender.male
                              ? const Color(0xFF0BAECB)
                              : const Color(0xFF606172),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              FontAwesomeIcons.mars,
                              size: 80.0,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              "Homem",
                              style: TextStyle(
                                  fontSize: 18.0, color: Color(0xFFD8DADE)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration(
                          color: selectedGender == Gender.female
                              ? const Color(0xFF0BAECB)
                              : const Color(0xFF606172),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              FontAwesomeIcons.venus,
                              size: 80.0,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              "Mulher",
                              style: TextStyle(
                                  fontSize: 18.0, color: Color(0xFFD8DADE)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  decoration: const BoxDecoration(
                    color: Color(0xFF606172),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Altura",
                        style:
                            TextStyle(fontSize: 18.0, color: Color(0xFFD8DADE)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            height.toString(),
                            style: const TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.w900),
                          ),
                          const Text(
                            " cm",
                            style: TextStyle(
                                fontSize: 18.0, color: Color(0xFFD8DADE)),
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbColor: const Color(0xFF0BAECB),
                          overlayColor: const Color(0x290BAECB),
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: const Color(0xFF8D8E98),
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15.0),
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 30.0),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          activeColor: const Color(0xFF0BAECB),
                          inactiveColor: const Color(0xFF8D8E98),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        decoration: const BoxDecoration(
                          color: Color(0xFF606172),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text("Peso",
                                style: TextStyle(
                                    fontSize: 18.0, color: Color(0xFFD8DADE))),
                            Text(weight.toString(),
                                style: const TextStyle(
                                    fontSize: 50.0, fontWeight: FontWeight.w900)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  child: const Icon(FontAwesomeIcons.minus),
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(56, 56),
                                    primary: const Color(0xFF4C4F5E),
                                    shape: const CircleBorder(),
                                    elevation: 6.0,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  child: const Icon(FontAwesomeIcons.plus),
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(56, 56),
                                    primary: const Color(0xFF4C4F5E),
                                    shape: const CircleBorder(),
                                    elevation: 6.0,
                                  ),
                                ),
                              ]
                            ),
                          ]
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        decoration: const BoxDecoration(
                          color: Color(0xFF606172),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text("Idade",
                                style: TextStyle(
                                    fontSize: 18.0, color: Color(0xFFD8DADE))),
                            Text(age.toString(),
                                style: const TextStyle(
                                    fontSize: 50.0, fontWeight: FontWeight.w900)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                    child: const Icon(FontAwesomeIcons.minus),
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(56, 56),
                                      primary: const Color(0xFF4C4F5E),
                                      shape: const CircleBorder(),
                                      elevation: 6.0,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                    child: const Icon(FontAwesomeIcons.plus),
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(56, 56),
                                      primary: const Color(0xFF4C4F5E),
                                      shape: const CircleBorder(),
                                      elevation: 6.0,
                                    ),
                                  ),
                                ]
                              ),
                            ]
                          ),
                        ),
                      ),
                  ]
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (selectedGender == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Selecione o gênero', style: TextStyle(color: Color(0xFFFF0000), fontSize: 24.0, fontWeight: FontWeight.bold)),
                      )
                  );
                } else {
                  _bmi = weight/ pow(height/ 100, 2);
                  bmiResult = _bmi!.toStringAsFixed(1);

                  if (_bmi! <= 18.5) {
                    result.resultText = "Abaixo do peso";
                    result.resultTextStyle = const TextStyle(color: Color(0xFFFAB505), fontSize: 22.0, fontWeight: FontWeight.bold);
                  } else if (_bmi! > 18.5 && _bmi! <= 24.9) {
                    result.resultText = "Peso normal";
                    result.resultTextStyle = const TextStyle(color: Color(0xFF24D876), fontSize: 22.0, fontWeight: FontWeight.bold);
                  } else if (_bmi! > 24.9 && _bmi! <= 29.9) {
                    result.resultText = "Acima do peso";
                    result.resultTextStyle = const TextStyle(color: Color(0xFFFAB505), fontSize: 22.0, fontWeight: FontWeight.bold);
                  } else if (_bmi! > 29.9 && _bmi! <= 34.9) {
                    result.resultText = "Obesidade nível 1";
                    result.resultTextStyle = const TextStyle(color: Color(0xFFFF0000), fontSize: 22.0, fontWeight: FontWeight.bold);
                  } else if (_bmi! > 34.9 && _bmi! <= 39.9) {
                    result.resultText = "Obesidade nível 2";
                    result.resultTextStyle = const TextStyle(color: Color(0xFFFF0000), fontSize: 22.0, fontWeight: FontWeight.bold);
                  } else {
                    result.resultText = "Obesidade nível 3";
                    result.resultTextStyle = const TextStyle(color: Color(0xFFFF0000), fontSize: 22.0, fontWeight: FontWeight.bold);
                  }
                }

                if (age >= 10 && age <= 18) {
                  selectedGender!.index == 1 ? tmbResult = 12.2 * weight + 746 : tmbResult = 17.5 * weight + 651;
                } else if (age > 18 && age <= 30) {
                  selectedGender!.index == 1 ? tmbResult = 14.7 * weight + 496 : tmbResult = 15.3 * weight + 679;
                } else if (age > 30 && age <= 60) {
                  selectedGender!.index == 1 ? tmbResult = 8.7 * weight + 829 : tmbResult = 8.7 * weight + 879;
                } else if (age > 60) {
                  selectedGender!.index == 1 ? tmbResult = 10.5 * weight + 596 : tmbResult = 13.5 * weight + 487;
                }

                basalMetabolism = "Taxa de Metabolismo Basal:\n" + tmbResult.toStringAsFixed(0);

                setState(() {
                  showResults = true;
                });
              },
              child: Container(
                child: const Center(
                  child: Text("Calcular", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold))
                ),
                color: const Color(0xFF0BAECB),
                margin: const EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 80.0,
              ),
            )
          ],
        )
      : Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  "Seu resultado",
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                  color: const Color(0xFF606172),
                  borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(result.resultText.toString().toUpperCase(), style: result.resultTextStyle),
                      Text(bmiResult, style: const TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold)),
                      Text(basalMetabolism!, style: result.resultTextStyle, textAlign: TextAlign.center),
                    ],
                  ),
                ),
              )
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  showResults = false;
                });
              },
              child: Container(
                child: const Center(
                    child: Text("Novo Cálculo", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold))
                ),
                color: const Color(0xFF0BAECB),
                margin: const EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 80.0,
              ),
            )
          ]
        )
    );
  }
}
