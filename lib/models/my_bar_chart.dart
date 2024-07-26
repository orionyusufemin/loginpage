import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MyBarChart extends StatefulWidget {
  const MyBarChart({super.key});

  @override
  State<MyBarChart> createState() => _MyBarChartState();
}

class _MyBarChartState extends State<MyBarChart> {
  final List<String> months = [
    'Mayis',
    'Haziran',
    'Temmuz',
    'Ağustos',
    'Eylül',
    'Ekim'
  ];
  final List<double> values = [23983, 12863, 98536, 39835, 41238, 76921];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceBetween,
          maxY: 100000,
          barTouchData: BarTouchData(enabled: false),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const style = TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  );
                  Widget text;
                  switch (value.toInt()) {
                    case 0:
                      text = const Text('Mayis', style: style);
                      break;
                    case 1:
                      text = const Text('Haziran', style: style);
                      break;
                    case 2:
                      text = const Text('Temmuz', style: style);
                      break;
                    case 3:
                      text = const Text('Ağustos', style: style);
                      break;
                    case 4:
                      text = const Text('Eylül', style: style);
                      break;
                    case 5:
                      text = const Text('Ekim', style: style);
                      break;
                    default:
                      text = const Text('', style: style);
                      break;
                  }
                  return SideTitleWidget(child: text, axisSide: meta.axisSide);
                },
                reservedSize: 40,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  );
                },
                reservedSize: 40,
                interval: 20000,
              ),
            ),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          barGroups: values.asMap().entries.map((entry) {
            return BarChartGroupData(
              x: entry.key,
              barRods: [
                BarChartRodData(
                  toY: entry.value,
                  color: Colors.blue,
                  width: 16,
                  borderRadius: BorderRadius.zero,
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
