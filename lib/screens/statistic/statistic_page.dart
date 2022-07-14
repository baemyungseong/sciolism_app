import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:sciolism_app/models/barChartModel.dart';

class StatisticScreen extends StatefulWidget {
  String uid;
  StatisticScreen({Key? key, required this.uid}) : super(key: key);
  @override
  _StatisticScreen createState() => _StatisticScreen();
}

class _StatisticScreen extends State<StatisticScreen> {
  final List<BarChartModel> data = [
    BarChartModel(
      year: "2019",
      mark: 6,
      color: charts.ColorUtil.fromDartColor(Colors.lightBlueAccent),
    ),
    BarChartModel(
      year: "2021",
      mark: 5,
      color: charts.ColorUtil.fromDartColor(Colors.pink),
    ),
    BarChartModel(
      year: "2022",
      mark: 8,
      color: charts.ColorUtil.fromDartColor(Colors.purple),
    ),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BarChartModel, String>> series = [
      charts.Series(
        id: "financial",
        data: data,
        domainFn: (BarChartModel series, _) => series.year,
        measureFn: (BarChartModel series, _) => series.mark,
        colorFn: (BarChartModel series, _) => series.color,
      ),
    ];

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: charts.BarChart(
          series,
          animate: true,
        ),
      ),
    );
  }
}
