import 'package:flutter/material.dart';
import 'package:majmua/application/strings/app_strings.dart';
import 'package:majmua/application/styles/app_widget_style.dart';
import 'package:majmua/application/themes/app_theme.dart';

class AddCityButton extends StatelessWidget {
  const AddCityButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appColor = Theme.of(context).colorScheme;
    return MaterialButton(
      onPressed: () {},
      shape: AppWidgetStyle.mainRectangleBorderMini,
      color: appColor.firstAppColor,
      child: const Text(
        AppString.addCity,
        style: TextStyle(
          fontSize: 17,
          color: Colors.white,
        ),
      ),
    );
  }
}
