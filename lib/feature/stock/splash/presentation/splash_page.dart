import 'package:asset_variation/data_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late DataService dataService;

  @override
  void initState() {
    Get.lazyPut<DataService>(() => DataService());
    dataService = Get.find();
    super.initState();

    dataService.dataStream.listen((data) {
      Get.offAllNamed('/home', arguments: {
        "choose": data.choose,
      });
    });
    dataService.startActivity();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: FlutterLogo(),
    ));
  }
}
