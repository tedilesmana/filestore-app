import 'package:filestore/presentation/settings/controllers/settings.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartSection extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ChartSection({Key? key}) : super(key: key);

  @override
  ChartSectionState createState() => ChartSectionState();
}

class ChartSectionState extends State<ChartSection> {
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SettingsController settingsController = Get.put(SettingsController());
    settingsController.getAllImageStoreByCategory();

    return Obx(
      () => Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        height: Get.width - 30,
        width: Get.width - 30,
        color: Colors.white,
        child: SfCircularChart(
          tooltipBehavior: _tooltip,
          annotations: <CircularChartAnnotation>[
            CircularChartAnnotation(
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Total Data",
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 12),
                  ),
                  Text(
                    settingsController.totalData.value.toString(),
                    style: const TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 25),
                  ),
                ],
              ),
            ),
          ],
          legend: const Legend(
            isVisible: true,
            position: LegendPosition.bottom,
            title: LegendTitle(
              text: 'By Category',
              textStyle: TextStyle(
                  color: Colors.red,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900),
            ),
          ),
          series: <CircularSeries<dynamic, dynamic>>[
            DoughnutSeries<ChartData, String>(
              dataSource: settingsController.data,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              name: 'Gold',
              dataLabelSettings: const DataLabelSettings(
                isVisible: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
