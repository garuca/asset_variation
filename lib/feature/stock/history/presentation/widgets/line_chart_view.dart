import 'package:asset_variation/commons/extensions/int.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartView extends StatelessWidget {
  final List<double> open;
  final List<double?>? percentDayMinusOne;
  final List<double?>? percentFirstDay;
  final List<int> timestamp;

  final List<Color> gradientColors = [
    Colors.cyan,
    Colors.blue,
  ];

  LineChartView({super.key, required this.open, required this.timestamp, this.percentDayMinusOne, this.percentFirstDay});

  @override
  Widget build(BuildContext context) {
    Widget bottomTitleWidgets(double value, TitleMeta meta) {
      const style = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );
      Widget text;
      switch (value.toInt()) {
        default:
          text = Text(value.toInt().toDateFormat(), style: style);
          break;
      }

      return SideTitleWidget(
        axisSide: meta.axisSide,
        child: text,
      );
    }

    List<FlSpot> flSpots = [];
    for (int i = 0; i < open.length; i++) {
      flSpots.add(
        FlSpot(timestamp[i].toDouble(), open[i]),
      );
    }
    LineChartData mainData() {
      return LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.blue,
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: Colors.red,
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1000000.0,
              getTitlesWidget: bottomTitleWidgets,
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d)),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: flSpots,
            isCurved: true,
            gradient: LinearGradient(
              colors: gradientColors,
            ),
            barWidth: 5,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: gradientColors
                    .map((color) => color.withOpacity(0.3))
                    .toList(),
              ),
            ),
          ),
        ],
      );
    }

    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: LineChart(
              mainData(),
            ),
          ),
        ),
      ],
    );
  }
}
