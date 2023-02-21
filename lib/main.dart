
import 'package:asset_variation/feature/stock/history/di/history_bindings.dart';
import 'package:asset_variation/feature/stock/history/presentation/chart_table.page.dart';

import 'package:asset_variation/feature/stock/splash/presentation/splash_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/splas',
    getPages: [
      GetPage(
          name: '/home',
          page: () => const ChartTablePage(),
          binding: HistoryBind()),
      GetPage(
        name: '/splas',
        page: () => const SplashPage(),
      ),
    ],
  ));
}



