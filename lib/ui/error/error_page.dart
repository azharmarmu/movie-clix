import 'package:flutter/material.dart';
import 'package:movie_app/shared/app_theme.dart';
import 'package:movie_app/shared/size_config.dart';

class ErrorPage extends StatelessWidget {
  final message;

  const ErrorPage({Key key, this.message = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ErrorContent(message: message),
    );
  }
}

class ErrorContent extends StatelessWidget {
  final message;

  const ErrorContent({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(4 * SizeConfig.heightMultiplier),
          padding: EdgeInsets.all(3 * SizeConfig.heightMultiplier),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(0.5 * SizeConfig.heightMultiplier),
            ),
          ),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.error_outline, color: AppTheme.accentColor),
                  SizedBox(width: 4 * SizeConfig.widthMultiplier),
                  Text(
                    'Error',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: AppTheme.accentColor,
                        ),
                  ),
                ],
              ),
              SizedBox(height: 2 * SizeConfig.heightMultiplier),
              Text(
                message,
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: AppTheme.accentColor,
                    fontSize: 2 * SizeConfig.textMultiplier),
              )
            ],
          ),
        ),
      ],
    );
  }
}
