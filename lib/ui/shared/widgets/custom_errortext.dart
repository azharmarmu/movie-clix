import 'package:flutter/material.dart';
import 'package:movie_app/shared/app_theme.dart';
import 'package:movie_app/shared/size_config.dart';

class CustomErrorText extends StatelessWidget {
  final String errorText;
  final Color color;

  const CustomErrorText({
    @required this.errorText,
    this.color = AppTheme.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          errorText.isNotEmpty ? '*$errorText' : '',
          style: Theme.of(context).textTheme.bodyText2.copyWith(
                fontWeight: FontWeight.w700,
                color: color,
                fontSize: 1.5 * SizeConfig.textMultiplier,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
