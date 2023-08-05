import 'package:flutter/material.dart';
import 'package:majmua/application/state/rest_time_state.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:provider/provider.dart';

class CardDailyMessage extends StatelessWidget {
  const CardDailyMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Card(
      margin: AppWidgetStyle.mainMargin,
      color: appColors.mainReverse,
      child: Consumer<RestTimeState>(
        builder: (BuildContext context, restTimeState, _) {
          return SingleChildScrollView(
            padding: AppWidgetStyle.mainPadding,
            child: Text(
              AppString.dailyTexts[context.watch<RestTimeState>().getCdt.weekday - 1],
              style: const TextStyle(
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
