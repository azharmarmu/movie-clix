import 'package:flutter/material.dart';
import 'package:movie_app/shared/app_theme.dart';
import 'package:movie_app/shared/size_config.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final Color backgroundColor;
  final String text;
  final Color textColor;
  final Icon icon;
  final Color iconColor;
  final Color rippleColor;
  final Function onTap;

  const CustomButton({
    this.height = 6.5,
    this.backgroundColor = AppTheme.accentColor,
    @required this.text,
    this.textColor = AppTheme.primaryColor,
    this.icon,
    this.iconColor,
    this.rippleColor = AppTheme.accentColor,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height * SizeConfig.heightMultiplier,
        padding: EdgeInsets.symmetric(
          horizontal: 4 * SizeConfig.widthMultiplier,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              0.5 * SizeConfig.heightMultiplier,
            ),
          ),
        ),
        child: textWithIcon(
          context,
          text: text,
          textColor: textColor,
          icon: icon,
          iconColor: iconColor,
        ),
      ),
    );
  }
}

Row textWithIcon(
  context, {
  @required text,
  textColor,
  icon,
  iconColor,
}) =>
    Row(
      mainAxisAlignment: icon != null
          ? MainAxisAlignment.spaceBetween
          : MainAxisAlignment.center,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text.toUpperCase(),
              style: Theme.of(context).textTheme.button.copyWith(
                    color: textColor,
                  ),
            ),
          ],
        ),
        icon != null
            ? Container(
                padding: EdgeInsets.all(1 * SizeConfig.heightMultiplier),
                decoration: BoxDecoration(
                  color: AppTheme.hintColor.withOpacity(0.3),
                  borderRadius: BorderRadius.all(
                    Radius.circular(0.5 * SizeConfig.heightMultiplier),
                  ),
                ),
                child: Icon(
                  icon,
                  color: textColor,
                  size: 2.25 * SizeConfig.heightMultiplier,
                ),
              )
            : Container(),
      ],
    );
