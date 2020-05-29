import 'package:flutter/material.dart';
import 'package:movie_app/shared/app_theme.dart';
import 'package:movie_app/shared/size_config.dart';

class ListGridMovieIconWidget extends StatelessWidget {
  final int selectedView;
  final Function handleIconClick;

  const ListGridMovieIconWidget({
    @required this.selectedView,
    @required this.handleIconClick,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        iconWidget(Icons.list, 0),
        Container(
          height: 4 * SizeConfig.heightMultiplier,
          child: VerticalDivider(
            width: 0,
            thickness: 1,
            indent: 2,
            endIndent: 2,
            color: AppTheme.hintColor,
          ),
        ),
        iconWidget(Icons.grid_on, 1),
      ],
    );
  }


  IconButton iconWidget(IconData icon, int type) {
    return IconButton(
      icon: Icon(
        icon,
        color: type == selectedView
            ? AppTheme.primaryColor
            : AppTheme.hintColor,
      ),
      onPressed: () => handleIconClick(type),
    );
  }
}

