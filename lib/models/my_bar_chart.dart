// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Monthly Sales",
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
              "Total Income",
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
          
        ],
      ),
    );
  }
}
