import 'package:ai_app/cities.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

String getPlateNumber(String city) {
  final index = cities.values.toList().indexOf(city);
  return cities.keys.elementAt(index);
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI App - Cities of the Türkiye',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI App'), centerTitle: true),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                    itemCount: cities.values.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(cities.values.elementAt(index)),
                        onTap: () {
                          setState(() {
                            _selectedIndex = cities.values.elementAt(index);
                          });
                        },
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 2,
                  color: Colors.red,
                ),
              ),
              Text(
                _selectedIndex == null
                    ? 'Get Plate Number of City - Select City'
                    : 'Plate Number: ${getPlateNumber(_selectedIndex!)}',
                style: const TextStyle(fontSize: 36),
              ),
            ]),
      ),
    );
  }
}
