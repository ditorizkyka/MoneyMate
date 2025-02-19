import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_mate/constant/constant.dart';

import '../controllers/detailcontent_controller.dart';

class DetailcontentView extends GetView<DetailcontentController> {
  const DetailcontentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorApp.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Detail Activity',
            style: TypographyApp.titleField,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Text("Tambahkan kebutuhan anda!",
                    style: TypographyApp.headline1),
                Gap.h8,
                Text(
                    "Seluruh kebutuhan keuangan anda disimpan dalam database kami, anda bisa melihat report dan statistik jingan ingin!",
                    style: TypographyApp.desc),
                Gap.h24,
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Spent Overview",
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    "\$10,576.00",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "10%",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.arrow_upward,
                                      color: Colors.green, size: 16),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Text("January",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Icon(Icons.arrow_drop_down, size: 20),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceBetween,
                          maxY: 7000,
                          barTouchData: BarTouchData(enabled: false),
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  switch (value.toInt()) {
                                    case 0:
                                      return _buildLabel(
                                          "Investment", Colors.blue);
                                    case 1:
                                      return _buildLabel(
                                          "Entertainment", Colors.teal);
                                    case 2:
                                      return _buildLabel(
                                          "Food & Beverages", Colors.green);
                                    default:
                                      return SizedBox();
                                  }
                                },
                                reservedSize: 32,
                              ),
                            ),
                          ),
                          gridData: FlGridData(show: false),
                          borderData: FlBorderData(show: false),
                          barGroups: [
                            _buildBarGroup(0, 6345.60, Colors.blue),
                            _buildBarGroup(1, 3172.80, Colors.teal),
                            _buildBarGroup(2, 1057.60, Colors.green),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  // height: 20,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(7),
                      // border: Border.all(),
                      color: ColorApp.white),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(60),
                          color: ColorApp.white,
                        ),
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          color: ColorApp.darkGreen,
                          size: 20,
                        ),
                      ),
                      Gap.w12,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Headset earphone baseus",
                              style: TypographyApp.mdblack.copyWith(
                                fontSize: 15,
                              ),
                            ),
                            Gap.h4,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Date : 2022-01-01",
                                  style: TypographyApp.desc,
                                ),
                                Gap.w12,
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 1),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.red,
                                  ),
                                  child: Text(
                                    "Urgent",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Gap.h12,
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  BarChartGroupData _buildBarGroup(int x, double y, Color color) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: color,
          width: 20,
          borderRadius: BorderRadius.circular(5),
        ),
      ],
    );
  }

  Widget _buildLabel(String text, Color color) {
    return Row(
      children: [
        Container(width: 10, height: 10, color: color),
        SizedBox(width: 4),
        Text(text, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
