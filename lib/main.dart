import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:statefull_widget/widgets/button_widget.dart';
import 'package:statefull_widget/widgets/information_suhu_widget.dart';
import 'package:statefull_widget/widgets/input_text_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController getSuhu = new TextEditingController();

  double kelvin = 0;
  double reamur = 0;
  double inputUser = 0;

  void temperatureConversion() {
    setState(() {
      inputUser = double.parse(getSuhu.text);
      kelvin = inputUser + 273;
      reamur = inputUser * (4 / 5);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Konverter Suhu"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InputSuhu(
                getSuhu: getSuhu,
              ),
              InformationSuhu(
                kelvin: kelvin,
                reamur: reamur,
              ),
              ButtonWidget(konversi: temperatureConversion)
            ],
          )),
    );
  }
}
