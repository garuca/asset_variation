import 'package:asset_variation/feature/stock/history/presentation/controller.dart';
import 'package:asset_variation/feature/stock/history/presentation/widgets/table_view_.dart';
import 'package:asset_variation/feature/stock/history/presentation/widgets/line_chart_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ChartTablePage extends GetView<Controller> {
  const ChartTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool choose = Get.arguments['choose'];

    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: controller.obx(
            (state) => SingleChildScrollView(
            child: choose
                ? TableView(
              open: state!.value1!,
              percentDayMinusOne: state!.value2!,
              percentFirstDay: state!.value3!,
              timestamp: state.value4!,
            )
                : LineChartView(
                open: state!.value1!, timestamp: state.value4!)),
        onLoading: const CircularProgressIndicator(),
        onEmpty: const Text('Sem dados'),
        onError: (error) => Center(child: Text(error.toString())),
      ),
    );
  }
}