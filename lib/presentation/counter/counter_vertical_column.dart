import 'package:flutter/material.dart';
import 'package:majmua/application/state/counter_state.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';
import 'package:provider/provider.dart';

class CounterVerticalColumn extends StatelessWidget {
  const CounterVerticalColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    return Consumer<CounterState>(
      builder: (context, counter, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 3,
              margin: AppWidgetStyle.horizontalMargin,
              child: Container(
                height: 200,
                width: double.infinity,
                padding: AppWidgetStyle.mainPaddingMini,
                child: Center(
                  child: Text(
                    counter.getCountValue.toString(),
                    style: const TextStyle(
                      fontSize: 65,
                      fontFamily: 'Lato',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            InkWell(
              onTap: () {
                counter.increment();
              },
              onLongPress: () {
                counter.reset();
              },
              borderRadius: BorderRadius.circular(250),
              child: Container(
                constraints: const BoxConstraints(
                  minWidth: 300,
                  minHeight: 300,
                  maxWidth: 300,
                  maxHeight: 300,
                ),
                decoration: BoxDecoration(
                  color: appColors.thirdAppColor.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(250),
                  boxShadow: [
                    BoxShadow(
                      blurStyle: BlurStyle.inner,
                      offset: const Offset(5, 5),
                      color: appColors.thirdAppColor.withOpacity(
                        0.25,
                      ),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.radio_button_checked,
                  color: appColors.thirdAppColor,
                  size: 250,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    counter.vibrateMode();
                  },
                  splashRadius: 1,
                  icon: Icon(
                    Icons.vibration,
                    size: 40,
                    color: counter.getIsVibrate
                        ? appColors.thirdAppColor
                        : Colors.grey,
                  ),
                ),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () {
                    counter.reset();
                  },
                  splashRadius: 1,
                  icon: Icon(
                    Icons.replay,
                    size: 40,
                    color: appColors.thirdAppColor,
                  ),
                ),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: () {
                    counter.clickMode();
                  },
                  splashRadius: 1,
                  icon: Icon(
                    Icons.volume_up_outlined,
                    size: 40,
                    color: counter.getIsClick
                        ? appColors.thirdAppColor
                        : Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: AppWidgetStyle.horizontalPaddingMini,
              child: Text(
                counter.getCountAllValue.toString(),
                style: const TextStyle(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }
}
