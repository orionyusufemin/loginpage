// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughnutChart extends StatefulWidget {
  const DoughnutChart({super.key});

  @override
  State<DoughnutChart> createState() => _DoughnutChartState();
}

class _DoughnutChartState extends State<DoughnutChart> {
  late TooltipBehavior tooltip;
  List<_ChartData> data = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [
      _ChartData(x: "Garanti", y: 2125),
      _ChartData(x: "Ziraat ", y: 1512),
      _ChartData(x: "Vakıf", y: 1971),
      _ChartData(x: "Halk", y: 1813)
    ];
    tooltip = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      legend: Legend(isVisible: true),
      backgroundColor: Colors.grey,
      title: ChartTitle(text: "My Doughnut Chart"),
      tooltipBehavior: tooltip,
      series: <CircularSeries<_ChartData, String>>[
        DoughnutSeries(
          enableTooltip: true,
          dataLabelMapper: (_ChartData data, index) => data.x,
          dataLabelSettings: DataLabelSettings(isVisible: true),
          xValueMapper: (_ChartData data, index) => data.x,
          yValueMapper: (_ChartData data, index) => data.y,
          dataSource: data,
        )
      ],
    );
  }
}

class _ChartData {
  final String x;
  final int y;
  _ChartData({
    required this.x,
    required this.y,
  });
}
