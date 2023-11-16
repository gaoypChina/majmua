import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:majmua/core/styles/app_styles.dart';
import 'package:majmua/core/themes/app_themes.dart';

class FridaySunnahsTile extends StatelessWidget {
  const FridaySunnahsTile({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final AppLocalizations? appLocale = AppLocalizations.of(context);
    return ListTile(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: appColors.surface,
          builder: (context) => Container(),
        );
      },
      visualDensity: const VisualDensity(vertical: -2),
      shape: RoundedRectangleBorder(
        borderRadius: AppStyles.mainBorderRadius,
        side: BorderSide(
          width: 1.5,
          color: appColors.quaternaryColor,
        ),
      ),
      title: Text(appLocale!.fridaySunnahs),
      tileColor: appColors.glass,
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 20,
        color: appColors.primaryColor,
      ),
    );
  }
}
