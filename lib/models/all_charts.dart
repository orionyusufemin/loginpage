// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:shoppingapp/components/doughnut_chart.dart';
import 'package:shoppingapp/components/round_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyBarChart extends StatefulWidget {
  const MyBarChart({super.key});

  @override
  State<MyBarChart> createState() => _MyBarChartState();
}

class _MyBarChartState extends State<MyBarChart> {
  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;
  bool isSwitched4 = false;
  bool isSwitched5 = false;
  List<String> monthNames = ["May", "Haz", "Temm", "Agu", "Eyl", "Ekm"];
  List<int> saleCount = [23423, 89763, 12974, 65384, 92648, 42638];
  List<int> saleCount1 = [3423, 12331, 12174, 6575, 1213, 6787];

  late List<_ChartData> data;
  late List<_ChartData> data1;
  late List<_ChartData1> data2;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [
      _ChartData("Masa", 4324),
      _ChartData("Tezgah", 1004),
      _ChartData("Trendyol", 2423),
      _ChartData("Paket", 4563),
      _ChartData("Yemek", 1300),
    ];
    data1 = [
      _ChartData("Kredi Kart", 7421),
      _ChartData("Nakit", 1068),
      _ChartData("Cek", 1272),
      _ChartData("Cari Hesap", 237),
      _ChartData("Zayi", 1),
      _ChartData("Yonetim", 1),
    ];
    data2 = [
      _ChartData1(2020, 12000000),
      _ChartData1(2021, 34000000),
      _ChartData1(2022, 19000000),
      _ChartData1(2023, 25000000),
      _ChartData1(2024, 36000000),
    ];
    _tooltip = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Aylık Satış",
              style: TextStyle(fontSize: 48),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Graph view"),
                Switch(
                  value: isSwitched1,
                  onChanged: (value) {
                    setState(() {
                      isSwitched1 = value;
                    });
                  },
                ),
                Text("Table view")
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.black54),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            child: !isSwitched1
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
          Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Toplam Gelir",
              style: TextStyle(fontSize: 48),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Graph view"),
                Switch(
                  value: isSwitched2,
                  onChanged: (value) {
                    setState(() {
                      isSwitched2 = value;
                    });
                  },
                ),
                Text("Table view")
              ],
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
          Divider(
            color: Colors.black,
          ),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.red.shade200),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Toplam Satış",
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Graph view"),
                      Switch(
                        value: isSwitched3,
                        onChanged: (value) {
                          setState(() {
                            isSwitched3 = value;
                          });
                        },
                      ),
                      Text("Table view")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: !isSwitched3
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: SfCartesianChart(
                              zoomPanBehavior: ZoomPanBehavior(
                                  zoomMode: ZoomMode.x,
                                  enablePanning: true,
                                  enablePinching: true),
                              isTransposed: false,
                              backgroundColor: Colors.black,
                              primaryXAxis: CategoryAxis(
                                labelStyle: TextStyle(color: Colors.white),
                                majorGridLines: MajorGridLines(width: 0),
                              ),
                              primaryYAxis: NumericAxis(
                                labelStyle: TextStyle(color: Colors.white),
                                minimum: 0,
                                maximum: 5000,
                                interval: 500,
                              ),
                              tooltipBehavior: _tooltip,
                              series: <CartesianSeries<_ChartData, String>>[
                                BarSeries<_ChartData, String>(
                                    dataSource: data,
                                    xValueMapper: (_ChartData data, _) =>
                                        data.x,
                                    yValueMapper: (_ChartData data, _) =>
                                        data.y,
                                    name: 'Yemek',
                                    color: Color.fromRGBO(8, 142, 255, 1))
                              ]),
                        )
                      : DataTable(
                          columnSpacing: 15,
                          columns: List.generate(
                            data.length,
                            (index) {
                              return DataColumn(label: Text(data[index].x));
                            },
                          ),
                          rows: List.generate(
                            1,
                            (index) {
                              return DataRow(
                                  cells: List.generate(
                                data.length,
                                (index) {
                                  return DataCell(
                                      Text(data[index].y.toString()));
                                },
                              ));
                            },
                          )),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.deepPurple.shade300),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Ödeme Tipi",
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Graph view"),
                      Switch(
                        value: isSwitched4,
                        onChanged: (value) {
                          setState(() {
                            isSwitched4 = value;
                          });
                        },
                      ),
                      Text("Table view")
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(10),
                    child: !isSwitched4
                        ? RoundChart(
                            tooltip: _tooltip,
                          )
                        : DataTable(
                            columnSpacing: 7,
                            columns: List.generate(
                              data1.length,
                              (index) {
                                return DataColumn(label: Text(data1[index].x));
                              },
                            ),
                            rows: List.generate(
                              1,
                              (index) {
                                return DataRow(
                                    cells: List.generate(
                                  data1.length,
                                  (index) {
                                    return DataCell(
                                        Text(data1[index].y.toString()));
                                  },
                                ));
                              },
                            ))),
              ],
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.amber.shade300),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Yıllık Kar",
                    style: TextStyle(fontSize: 48),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Graph view"),
                      Switch(
                        value: isSwitched5,
                        onChanged: (value) {
                          setState(() {
                            isSwitched5 = value;
                          });
                        },
                      ),
                      Text("Table view")
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: !isSwitched5
                        ? SfCartesianChart(
                            zoomPanBehavior: ZoomPanBehavior(
                                enablePanning: true,
                                enablePinching: true,
                                zoomMode: ZoomMode.x),
                            backgroundColor: Colors.grey,
                            tooltipBehavior: _tooltip,
                            primaryXAxis: CategoryAxis(
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                            primaryYAxis: NumericAxis(
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                            series: <CartesianSeries>[
                              LineSeries<_ChartData1, int>(
                                width: 5,
                                name: "Yıllık Kar",
                                dashArray: <double>[10, 10],
                                enableTooltip: true,
                                dataSource: data2,
                                xValueMapper: (_ChartData1 data2, index) =>
                                    data2.x,
                                yValueMapper: (_ChartData1 data2, index) =>
                                    data2.y,
                              )
                            ],
                          )
                        : DataTable(
                            columnSpacing: 35,
                            columns: List.generate(
                              data2.length,
                              (index) {
                                return DataColumn(
                                    label: Text(data2[index].x.toString()));
                              },
                            ),
                            rows: List.generate(
                              1,
                              (index) {
                                return DataRow(
                                    cells: List.generate(
                                  data2.length,
                                  (index) => DataCell(Text(
                                      (data2[index].y / 1000000.toDouble())
                                              .toString() +
                                          "M")),
                                ));
                              },
                            )))
              ],
            ),
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

class _ChartData1 {
  _ChartData1(this.x, this.y);

  final int x;
  final double y;
}
