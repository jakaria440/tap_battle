import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int blueScore = 50;
  int cyanScore = 50;
  void scoreOne() {
    setState(() {
      cyanScore = cyanScore + 2;
      blueScore = blueScore - 2;
    });
  }

  void scoreTwo() {
    setState(() {
      cyanScore = cyanScore - 2;
      blueScore = blueScore + 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: cyanScore,
                  child: InkWell(
                    onTap: scoreOne,
                    child: Container(
                      color: const Color.fromARGB(255, 255, 91, 159),
                    ),
                  ),
                ),
                Expanded(
                  flex: blueScore,
                  child: InkWell(
                    onTap: scoreTwo,
                    child: Container(
                      color: Colors.blueAccent,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ],
            ),
            cyanScore >= 100 || blueScore >= 100
                ? Container(
                    color: Color.fromARGB(255, 76, 0, 255).withOpacity(0.5),
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/balloon.gif'),
                        Text(
                          "${cyanScore >= 100 ? 'Cyan' : 'Blue'} won!!",
                          style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              blueScore = 50;
                              cyanScore = 50;
                            });
                          },
                          child: const Text("Reset"),
                        )
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
