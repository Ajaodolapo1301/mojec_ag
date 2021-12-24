
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import 'package:mojec_agent/core/utils/styles/color_utils.dart';
import 'package:mojec_agent/core/utils/widgets/app_app_bar.dart';
import 'package:mojec_agent/core/utils/widgets/header.dart';

import 'package:mojec_agent/features/earning/model/chartModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mojec_agent/features/earning/pages/widget/modelChart.dart';


class Earning extends StatefulWidget {
  const Earning({Key? key}) : super(key: key);

  @override
  _EarningState createState() => _EarningState();
}

class _EarningState extends State<Earning> with TickerProviderStateMixin {
late TabController controller;

  model(){
    List<Model>  data = [
      Model(
          day: "M",
          barColor: charts.ColorUtil.fromDartColor(fadedBlue.withOpacity(0.3)),
          average:  1

      ),
      Model(
          day: 'T',
          barColor: charts.ColorUtil.fromDartColor(fadedBlue.withOpacity(0.3)),
          average:  2

      ),
      Model(
          day: "W",
          barColor: charts.ColorUtil.fromDartColor(fadedBlue.withOpacity(0.3)),
          average: 3

      ),
      Model(
          day: "TH",
          barColor: charts.ColorUtil.fromDartColor(fadedBlue.withOpacity(0.3)),
          average:  4

      ),
      Model(
          day: "F",
          barColor: charts.ColorUtil.fromDartColor(fadedBlue.withOpacity(0.3)),
          average:  5

      ),
      Model(
          day: "S",
          barColor: charts.ColorUtil.fromDartColor(fadedBlue.withOpacity(0.3)),
          average:  4

      ),
      Model(
          day: "S",
          barColor: charts.ColorUtil.fromDartColor(fadedBlue.withOpacity(0.3)),
          average:  3

      ),
    ];
    return      ModelChart(
      data: data,
    );
  }


  @override
  void initState() {
    controller =TabController(length: 2, vsync:this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBar(
        elevate: true,
        titleText: "Your Earning",
      ),
    );
  }
}

class EarningTab extends StatefulWidget {
  const EarningTab({Key? key}) : super(key: key);

  @override
  _EarningTabState createState() => _EarningTabState();
}

class _EarningTabState extends State<EarningTab> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class WithdrawalTab extends StatefulWidget {
  const WithdrawalTab({Key? key}) : super(key: key);

  @override
  _WithdrawalTabState createState() => _WithdrawalTabState();
}

class _WithdrawalTabState extends State<WithdrawalTab> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}




