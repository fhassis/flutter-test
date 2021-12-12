import 'package:kchart_test/candle_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Candle Test',
    theme: ThemeData(primarySwatch: Colors.blue),
    home: const CandleChart(),
  ));
}
