// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shoppingapp/components/round_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughnutChart extends StatefulWidget {
  TooltipBehavior toolTip;
  String label;
  DoughnutChart({super.key, required this.label, required this.toolTip});

  @override
  State<DoughnutChart> createState() => _DoughnutChartState();
}

class _DoughnutChartState extends State<DoughnutChart> {
  bool isVisible = false;
  late TooltipBehavior tooltip;
  List<_ChartData> Kredikart = [];
  List<_ChartData> Nakit = [];
  List<_ChartData> Carihesap = [];
  List<_ChartData> Cek = [];
  List<_ChartData> _getDataSource() {
    switch (widget.label) {
      case 'Kredikart':
        return Kredikart;
      case 'Nakit':
        return Nakit;
      case 'Carihesap':
        return Carihesap;
      case 'Cek':
        return Cek;
      default:
        return [];
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Kredikart = [
      _ChartData(x: "Garanti", y: 2125),
      _ChartData(x: "Ziraat ", y: 1512),
      _ChartData(x: "Vakıf", y: 1971),
      _ChartData(x: "Halk", y: 1813)
    ];
    Nakit = [
      _ChartData(x: "200Banknot", y: 295),
      _ChartData(x: "100Banknot", y: 403),
      _ChartData(x: "50Banknot", y: 193),
      _ChartData(x: "5Banknot", y: 177)
    ];
    Carihesap = [
      _ChartData(x: "Account 1", y: 120),
      _ChartData(x: "Account 2", y: 117)
    ];
    Cek = [_ChartData(x: "Bank A", y: 700), _ChartData(x: "Bank B", y: 572)];
    tooltip = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return !isVisible
        ? SfCircularChart(
            legend: Legend(isVisible: true),
            backgroundColor: Colors.grey,
            title: ChartTitle(text: widget.label),
            tooltipBehavior: tooltip,
            series: <CircularSeries<_ChartData, String>>[
              DoughnutSeries(
                onPointTap: (pointInteractionDetails) {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                enableTooltip: true,
                dataLabelMapper: (_ChartData data, index) => "${data.x} ${data.y}",
                dataLabelSettings: DataLabelSettings(isVisible: true),
                xValueMapper: (_ChartData data, index) => data.x,
                yValueMapper: (_ChartData data, index) => data.y,
                dataSource: _getDataSource(),
              )
            ],
          )
        : RoundChart(tooltip: widget.toolTip);
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
