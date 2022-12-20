import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke

        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //underscore is the global variable naming convension
  var _heightvalue = 170.0;
  var _weightvalue = 60.0;
  var _bmi = 0;
  var _message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator"), backgroundColor: Colors.red, ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [

                Text("BMI Calculator", textAlign: TextAlign.left, style: TextStyle(color: Colors.red, fontSize: 42,),),
                SizedBox(height: 8),
                Image.network("https://static.vecteezy.com/system/resources/thumbnails/003/609/230/small/bmi-categories-chart-body-mass-index-and-scale-mass-people-severely-underweight-underweight-optimal-overweight-obese-severely-obese-graph-control-health-illustration-vector.jpg"),
                SizedBox(height: 8),
                Text("We care about your health"),
                SizedBox(height: 17),
                Text("Height ${_heightvalue.round().toString()}(cm)", style: TextStyle(fontSize: 38),),
                SizedBox(height: 8),
                Slider(
                  value: _heightvalue,
                  max: 220,
                  min:20,
                  // divisions: 5,
                  label: _heightvalue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _heightvalue = value;
                    });
                  },
                ),
                Text("Weight ${_weightvalue.round().toString()}(kg)", style: TextStyle(fontSize: 38),),
                SizedBox(height: 8),
                Slider(
                  value: _weightvalue,
                  min: 10,
                  max: 200,
                  // divisions: 5,
                  label: _weightvalue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _weightvalue = value;
                    });
                  },
                ),
                SizedBox(height: 8),

                //must use ternary operator, If _bmi equal to 0, display SizedBox()
                _bmi != 0 ? Text("Your BMI is ${_bmi.round()}, $_message!", style: TextStyle(fontSize: 20),): SizedBox(),
                SizedBox(height: 8),
                TextButton.icon(onPressed: (){

                  // import 'dart:math'; to make sure it does not show error
                  var bmi = _weightvalue / pow((_heightvalue/100), 2);
                  // print("Your BMI is ${bmi.round()}");
                  //assign the value bmi.round(local) into _bmi(global) =>bring it out in the UI
                  //_bmi = bmi.round();
                  //We want to set message to user so that the following message will come out
                  // <18 -> You are underweight
                  //18-25 -> You are normal
                  //25-30 -> You are overweight
                  //>30 -> Your are obese
                  var message = "";

                  if (bmi < 18){
                    message = "You are underweight";
                  }
                  else if (bmi<25){
                    message = "You are normal";
                  }
                  else if (bmi<30){
                    message = "You are overweight";
                  }
                  else{
                    message = "You are obese";
                  }

                  //use setState to assign the value bmi.round (local) into _bmi(global) AND refresh the UI
                  setState(() {
                    _bmi = bmi.round();
                    _message = message;
                  });

                }, icon: Icon(Icons.favorite), label: Text("Calculate"),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.pink)),
                ),
                // TextButton.icon(onPressed:(){},
                //   child: Text("Calculate"), style: TextButton.styleFrom(
                //     primary: Colors.white,
                //     backgroundColor: Colors.pink, // Background Color
                //   ),)

                ],
            ),
          ),
        ),
      ),
    );
  }
}



