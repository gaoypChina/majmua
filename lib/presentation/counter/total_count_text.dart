import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';
import 'package:majmua/presentation/state/app_counter_state.dart';
import 'package:provider/provider.dart';

class TotalCountText extends StatelessWidget {
  const TotalCountText({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return Consumer<AppCounterState>(
      builder: (BuildContext context, AppCounterState appCounterState, _) {
        return Padding(
          padding: AppStyles.mainMarding,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: appLocale!.totalValue,
                  style: TextStyle(
                    fontFamily: 'Nexa',
                    color: appColors.onSurface,
                  ),
                ),
                TextSpan(
                  text: appCounterState.getIsShow
                      ? appCounterState.getTotalCountValue.toString()
                      : '',
                  style: TextStyle(
                    color: appColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Bitter',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
