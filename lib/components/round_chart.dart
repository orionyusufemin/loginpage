import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RoundChart extends StatefulWidget {
  TooltipBehavior tooltip;
  RoundChart({super.key, required this.tooltip});

  @override
  State<RoundChart> createState() => _RoundChartState();
}

class _RoundChartState extends State<RoundChart> {
  late List<_ChartData> data1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data1 = [
      _ChartData("Kredi Kart", 7421),
      _ChartData("Nakit", 1068),
      _ChartData("Cek", 1272),
      _ChartData("Cari Hesap", 237),
      _ChartData("Zayi", 1),
      _ChartData("Yonetim", 1),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      legend: Legend(isVisible: true),
        tooltipBehavior: widget.tooltip,
        margin: EdgeInsets.all(0),
        series: <CircularSeries<_ChartData, String>>[
          DoughnutSeries(
            explode: true,
            enableTooltip: true,
            dataSource: data1,
            xValueMapper: (_ChartData data1, index) => data1.x,
            sortingOrder: SortingOrder.descending,
            dataLabelMapper: (data1, index) =>
                data1.x.toString() + " % " + (data1.y / 100).toString(),
            dataLabelSettings:
                DataLabelSettings(isVisible: true, color: Colors.white),
            yValueMapper: (_ChartData data1, index) => data1.y,
            name: "Ödeme tipi",
          )
        ]);
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
