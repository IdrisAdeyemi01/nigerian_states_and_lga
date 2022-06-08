import 'package:flutter/material.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String stateValue = 'Select a State';
  String lgaValue = 'Select a Local Government Area';
  String selectedLGAFromAllLGAs = NigerianStatesAndLGA.getAllNigerianLGAs()[0];
  List<String> statesLga = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nigerian States and LGAs')),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('Select a Nigerian state'),
          const SizedBox(
            height: 20,
          ),
          DropdownButton<String>(
              value: stateValue,
              isExpanded: true,
              hint: const Text('Select a Nigerian state'),
              items: NigerianStatesAndLGA.allStates
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              onChanged: (val) {
                statesLga.clear();
                statesLga.add(lgaValue);
                statesLga.addAll(NigerianStatesAndLGA.getStateLGAs(val!));
                setState(() {
                  stateValue = val;
                });
              }),
          const SizedBox(
            height: 20,
          ),
          DropdownButton<String>(
              value: lgaValue,
              isExpanded: true,
              hint: const Text('Select a Lga'),
              items: stateValue == 'Select a State'
                  ? []
                  : statesLga.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
              onChanged: (val) {
                setState(() {
                  lgaValue = val!;
                });
              }),
          const SizedBox(
            height: 20,
          ),
          DropdownButton<String>(
              value: selectedLGAFromAllLGAs,
              isExpanded: true,
              hint: const Text('Select a Lga'),
              items: NigerianStatesAndLGA.getAllNigerianLGAs()
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  selectedLGAFromAllLGAs = val!;
                });
              }),
        ]),
      ),
    );
  }
}
