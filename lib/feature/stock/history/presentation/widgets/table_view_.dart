import 'package:flutter/material.dart';
import 'package:asset_variation/commons/extensions/int.dart';
import 'package:asset_variation/commons/extensions/double.dart';

class TableView extends StatelessWidget {
  final List<double?>? percentDayMinusOne;
  final List<double?>? percentFirstDay;
  final List<double> open;
  final List<int> timestamp;

  final List<Color> gradientColors = [
    Colors.cyan,
    Colors.blue,
  ];

  TableView({
    super.key,
    required this.open,
    required this.percentDayMinusOne,
    required this.percentFirstDay,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    customText(text) {
      return Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      );
    }

    TableCell getCellPercent(i) {
      if (percentDayMinusOne![i] != null) {
        return TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: customText(percentDayMinusOne![i]!.percentFormat()));
      }
      return TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: customText("-"));
    }

    TableCell getCellPercentD1(i) {
      if (percentFirstDay![i] != null) {
        return TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: customText(percentFirstDay![i]!.percentFormat()));
      }
      return TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: customText("-"));
    }

    List<TableRow> tableRows() {
      List<TableRow> rows = [];
      rows.add(TableRow(
        children: <Widget>[
          TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: customText("Dia")),
          TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: customText("Data")),
          TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: customText("Valor")),
          TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: customText("Variação D-1")),
          TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: customText("Variação ${timestamp[0].toDateFormat()}")),
        ],
      ));
      for (int i = 0; i < timestamp.length; i++) {
        rows.add(TableRow(
          children: <Widget>[
            TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: customText('${i + 1}')),
            TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: customText(timestamp[i].toDateFormat())),
            TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: customText(open[i].toStringAsFixed(2))),
            getCellPercent(i),
            getCellPercentD1(i)
          ],
        ));
      }
      return rows;
    }

    return Table(
        border: TableBorder.all(),
        columnWidths: const <int, TableColumnWidth>{
          0: FixedColumnWidth(50),
          1: FlexColumnWidth(),
          2: FlexColumnWidth(),
          3: FlexColumnWidth(),
          4: FlexColumnWidth(),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: tableRows());
  }
}
