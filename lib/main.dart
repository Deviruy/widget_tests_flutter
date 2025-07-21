import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_tests_flutter/pages/traffic_light_page.dart';
import 'package:widget_tests_flutter/viewmodel/traffic_light_viewmodel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TrafficLightViewmodel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: TrafficLightPage(),
    );
  }
}
