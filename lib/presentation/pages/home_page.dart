import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/presentation/currentDateTime/item_card_date_times.dart';
import 'package:majmua/presentation/prayerTime/main_card_adhan_time.dart';
import 'package:majmua/presentation/restTime/main_card_rest_time_indicators.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppWidgetStyle.mainSliverAppbar(AppString.appName),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(height: 16),
                  MainCardRestTimeIndicators(),
                  SizedBox(height: 5),
                  Divider(indent: 16, endIndent: 16),
                  SizedBox(height: 4),
                  MainCardAdhanTime(),
                  SizedBox(height: 5),
                  Divider(indent: 16, endIndent: 16),
                  SizedBox(height: 4),
                  ItemCardDateTimes(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
