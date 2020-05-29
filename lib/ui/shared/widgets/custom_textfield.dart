import 'package:flutter/material.dart';
import 'package:movie_app/shared/app_theme.dart';
import 'package:movie_app/shared/size_config.dart';

class CustomTextField extends StatelessWidget {
  final double height;
  final double borderWidth;
  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final Color borderColor;
  final Brightness keyboardAppearance;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final FocusNode focusNode;
  final bool autoFocus;
  final bool showIcon;
  final Function onIconPress;
  final int maxLength;

  const CustomTextField({
    this.height = 6.5,
    this.borderWidth = 2,
    @required this.hintText,
    @required this.textEditingController,
    this.textInputType = TextInputType.text,
    this.borderColor = AppTheme.accentColor,
    this.keyboardAppearance,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.focusNode,
    this.autoFocus = false,
    this.showIcon = false,
    this.onIconPress,
    this.maxLength = 128,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * SizeConfig.heightMultiplier,
      padding: EdgeInsets.symmetric(
        horizontal: 4 * SizeConfig.widthMultiplier,
      ),
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            0.5 * SizeConfig.heightMultiplier,
          ),
        ),
      ),
      child: Stack(
        children: <Widget>[
          TextFormField(
            controller: textEditingController,
            keyboardType: textInputType,
            obscureText: obscureText,
            textCapitalization: textCapitalization,
            autofocus: autoFocus,
            maxLength: maxLength,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: AppTheme.hintColor,
                  ),
              border: InputBorder.none,
              counterText: '',
            ),
            style: Theme.of(context).textTheme.subtitle2.copyWith(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 2 * SizeConfig.textMultiplier,
                ),
          ),
          showIcon
              ? Positioned(
                  right: 0.0,
                  child: IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: onIconPress,
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
