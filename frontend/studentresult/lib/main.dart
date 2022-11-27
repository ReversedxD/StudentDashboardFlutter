import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_table/json_table.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  Future<List<dynamic>> buttonPressed() async {
    http.Response returnedResult = await http.get(
        Uri.parse('http://localhost:8000/result/E20CSE302'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset-UTF-8'
        });
    return jsonDecode(returnedResult.body);
  }

  // Future<int> totalee() async {
  //   http.Response returnedResult = await http.get(
  //       Uri.parse('http://localhost:8000/totale/'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset-UTF-8'
  //       });
  //   return jsonDecode(returnedResult.body);
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Testing Django',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Student Results"),
        ),
        body: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text("Here is your result for E20CSE302",
                    style: TextStyle(fontSize: 20)),
              ),
              FutureBuilder<List<dynamic>>(
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return JsonTable(
                      snapshot.data!,
                      allowRowHighlight: true,
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
                future: buttonPressed(),
              ),
              // Padding(
              //   padding: EdgeInsets.all(10),
              //   child: ElevatedButton(
              //     onPressed: totalee,
              //     child: Text("Here are your total marks"),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
