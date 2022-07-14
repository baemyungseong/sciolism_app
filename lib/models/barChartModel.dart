import 'dart:ffi';

import 'package:charts_flutter/flutter.dart' as charts;

class BarChartModel {
  String year;
  int mark;
  final charts.Color color;

  BarChartModel({
    required this.year,
    required this.mark,
    required this.color,
  });
}
