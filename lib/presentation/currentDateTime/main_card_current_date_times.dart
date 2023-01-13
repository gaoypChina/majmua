import 'package:flutter/material.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:majmua/presentation/currentDateTime/item_year_month_day.dart';

class MainCardCurrentDateTimes extends StatelessWidget {
  const MainCardCurrentDateTimes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Padding(
      padding: AppWidgetStyle.horizontalPaddingMini,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Card(
              elevation: 1,
              shape: AppWidgetStyle.mainRectangleBorder,
              margin: EdgeInsets.zero,
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  ItemYearMonthDay(
                    year: 2023,
                    month: 'Январь',
                    day: 13,
                    color: appColors.firstAppColor,
                  ),
                  ItemYearMonthDay(
                    year: 1444,
                    month: 'Джумада ас-Сани',
                    day: 19,
                    color: appColors.secondAppColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
