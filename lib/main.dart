import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _tipPercentage = 0;
  int _toPay = 0;
  int _numOfPeople = 1;


  int get tipFoWaiter {
    return ((_tipPercentage / 100) * _toPay).toInt();
  }

  String get payPerPerson {
    return ((tipFoWaiter + _toPay) / _numOfPeople).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              width: 325,
              height: 125,
              decoration: BoxDecoration(
                  color: Colors.lightGreenAccent[100],
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Tyle płaci kazda osoba: ",
                      style: TextStyle(color: Colors.green)),
                  Text(
                    "$payPerPerson zł",
                    style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 26),
                  )
                ],
              )),
          const SizedBox(height: 10),
          Container(
            width: 325,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: Column(children: [
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _toPay = int.parse(value);
                  });
                },
                style: const TextStyle(color: Colors.green),
                decoration: const InputDecoration(
                  hintText: "Do zapłaty",
                  prefixIcon: Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Text("Liczba osób"),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Row(children: [
                          Column(
                            children: [
                              FilledButton.tonal(
                                  style: FilledButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    backgroundColor: Colors.lightGreenAccent[100],
                                    minimumSize: const Size(20, 20),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (_numOfPeople > 1) {
                                        _numOfPeople = _numOfPeople - 1;
                                      }
                                    });
                                  },
                                  child: const Text(
                                    "-",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 24),
                                  )),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "$_numOfPeople",
                                  style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              FilledButton.tonal(
                                  style: FilledButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    backgroundColor: Colors.lightGreenAccent[100],
                                    minimumSize: const Size(20, 20),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _numOfPeople = _numOfPeople + 1;
                                    });
                                  },
                                  child: const Text(
                                    "+",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 24),
                                  )),
                            ],
                          ),
                        ]),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Cały napiwek"),
                  Text(
                    "$tipFoWaiter",
                    style: const TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Text(
                "$_tipPercentage%",
                style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Slider(
                  min: 0,
                  max: 100,
                  activeColor: Colors.green,
                  inactiveColor: Colors.lightGreenAccent,
                  divisions: 10,
                  value: _tipPercentage.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      _tipPercentage = value.round();
                    });
                  })
            ]),
          ),
        ]),
      ),
    );
  }
}
