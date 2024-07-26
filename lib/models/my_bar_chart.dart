// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyBarChart extends StatefulWidget {
  const MyBarChart({super.key});

  @override
  State<MyBarChart> createState() => _MyBarChartState();
}

class _MyBarChartState extends State<MyBarChart> {
  bool isSwitched = false;
  List<String> monthNames = ["May", "Haz", "Temm", "Agu", "Eyl", "Ekm"];
  List<int> saleCount = [23423, 89763, 12974, 65384, 92648, 42638];
  List<int> saleCount1 = [3423, 12331, 12174, 6575, 1213, 6787];

  late List<_ChartData> data;
  late List<_ChartData> data1;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [
      _ChartData("Masa", 520087),
      _ChartData("Tezgah Satis", 435342),
      _ChartData("Trendyol", 234542),
      _ChartData("Paket", 907242),
      _ChartData("Yemek Sepeti", 743298),
    ];
    data1 = [
      _ChartData("Kredi Karti", 7421),
      _ChartData("Nakit", 1068),
      _ChartData("Yemek Ceki", 1272),
      _ChartData("Cari Hesap", 237),
      _ChartData("Zayi", 1),
      _ChartData("Yonetim", 1),
    ];
    _tooltip = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Text(
              "Aylık Satış",
              style: TextStyle(fontSize: 48),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Graph view"),
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
              Text("Table view")
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.black54),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            child: !isSwitched
                ? BarChart(BarChartData(
                    maxY: 100000,
                    backgroundColor: Colors.black26,
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 50,
                          getTitlesWidget: (value, meta) {
                            return SideTitleWidget(
                                child: Text(
                                  value.toInt().toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                                axisSide: meta.axisSide);
                          },
                        )),
                        bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            int index = value.toInt();
                            return SideTitleWidget(
                                child: Text(
                                  monthNames[index],
                                  style: TextStyle(color: Colors.white),
                                ),
                                axisSide: meta.axisSide);
                          },
                        ))),
                    alignment: BarChartAlignment.spaceEvenly,
                    barGroups: List.generate(
                      monthNames.length,
                      (index) {
                        return BarChartGroupData(x: index, barRods: [
                          BarChartRodData(
                              toY: saleCount[index].toDouble(), width: 15)
                        ]);
                      },
                    )))
                : Text("sasdaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Toplam Gelir",
              style: TextStyle(fontSize: 48),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(color: Colors.black54),
            child: BarChart(BarChartData(
                maxY: 200000,
                gridData: FlGridData(show: false),
                backgroundColor: Colors.black26,
                titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                      reservedSize: 58,
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toString(),
                          style: TextStyle(),
                        );
                      },
                    )),
                    bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();
                        return Text(
                          monthNames[index].toString(),
                          style: TextStyle(color: Colors.white),
                        );
                      },
                    ))),
                barGroups: List.generate(
                  saleCount.length,
                  (index) {
                    return BarChartGroupData(x: index, barRods: [
                      BarChartRodData(toY: saleCount1[index] * 14, width: 12)
                    ]);
                  },
                ))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Toplam Satış",
              style: TextStyle(fontSize: 48),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: SfCartesianChart(
                  isTransposed: false,
                  backgroundColor: Colors.black,
                  primaryXAxis: CategoryAxis(
                    majorGridLines: MajorGridLines(width: 0),
                  ),
                  primaryYAxis: NumericAxis(
                    minimum: 0,
                    maximum: 1000000,
                    interval: 100000,
                  ),
                  tooltipBehavior: _tooltip,
                  series: <CartesianSeries<_ChartData, String>>[
                    BarSeries<_ChartData, String>(
                        dataSource: data,
                        xValueMapper: (_ChartData data, _) => data.x,
                        yValueMapper: (_ChartData data, _) => data.y,
                        name: 'Yemek',
                        color: Color.fromRGBO(8, 142, 255, 1))
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Ödeme Tipi",
              style: TextStyle(fontSize: 48),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: SfCircularChart(
                tooltipBehavior: _tooltip,
                margin: EdgeInsets.all(0),
                series: <CircularSeries<_ChartData, String>>[
                  DoughnutSeries(
                    enableTooltip: true,
                    dataSource: data1,
                    xValueMapper: (_ChartData data1, index) => data1.x,
                    sortingOrder: SortingOrder.descending,
                    dataLabelMapper: (data1, index) =>
                        data1.x.toString() + " % " + (data1.y / 100).toString(),
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                    yValueMapper: (_ChartData data1, index) => data1.y,
                    name: "Ödeme tipi",
                  )
                ]),
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
