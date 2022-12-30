import 'package:flutter/material.dart';
import 'package:majmua/application/style/app_styles.dart';
import 'package:majmua/application/theme/app_themes.dart';
import 'package:majmua/presentation/currentDate/current_date_item.dart';
import 'package:majmua/presentation/restTime/rest_times.dart';

class CurrentDateContainer extends StatefulWidget {
  const CurrentDateContainer({Key? key}) : super(key: key);

  @override
  State<CurrentDateContainer> createState() => _CurrentDateContainerState();
}

class _CurrentDateContainerState extends State<CurrentDateContainer> {
  final RestTimes _restTimes = RestTimes();

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    return Row(
      children: [
        const SizedBox(width: 8),
        Expanded(
          flex: 3,
          child: Card(
            elevation: 1,
            margin: EdgeInsets.zero,
            shape: AppStyles.mainCardBorderRadius,
            child: Container(
              padding: AppStyles.mainPaddingMini,
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CurrentDateItem(
                    currentMonth: _restTimes.getMonthName,
                    currentYear: _restTimes.dateTime.year,
                    currentDay: _restTimes.dateTime.day,
                    color: appColors.firstAppColor,
                  ),
                  CurrentDateItem(
                    currentMonth: _restTimes.getMonthHijriName,
                    currentYear: _restTimes.dateTimeHijri.hYear,
                    currentDay: _restTimes.dateTimeHijri.hDay,
                    color: appColors.secondAppColor,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: AppStyles.mainBorderRadius,
                  side: BorderSide(
                    color: _restTimes.dateTime.weekday == 5
                        ? appColors.thirdAppColor
                        : appColors.weekDaysColor,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: SizedBox(
                    height: 35,
                    child: Center(
                      child: Text(
                        _restTimes.getNameWeekDay,
                        style: TextStyle(
                          fontSize: 16,
                          color: _restTimes.dateTime.weekday == 5
                              ? appColors.thirdAppColor
                              : appColors.weekDaysColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Card(
                elevation: 1,
                margin: EdgeInsets.zero,
                shape: AppStyles.mainCardBorderRadius,
                child: SizedBox(
                  height: 77,
                  child: Center(
                    child: Padding(
                      padding: AppStyles.mainPaddingMini,
                      child: Text(
                        _restTimes.getMessageForSaum,
                        style: TextStyle(
                          fontSize: _restTimes.dateTime.weekday == 5 ? 50 : 14,
                          color: _restTimes.dateTime.weekday == 5
                              ? appColors.thirdAppColor
                              : appColors.mainTextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
