import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/shared/app_theme.dart';
import 'package:movie_app/shared/size_config.dart';
import 'package:movie_app/ui/landing/widgets/landing_view_mode.dart';
import 'package:movie_app/ui/landing/widgets/landing_movie_grid_view.dart';
import 'package:movie_app/ui/landing/widgets/landing_movie_list_view.dart';

class LandingBody extends StatefulWidget {
  final MovieListModel movieList;

  const LandingBody({@required this.movieList});

  @override
  _LandingBodyState createState() => _LandingBodyState();
}

class _LandingBodyState extends State<LandingBody> {
  static int selectedView = 0; //[ list:0, grid:1]

  handleIconClick(int value) {
    selectedView = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 1 * SizeConfig.heightMultiplier,
                horizontal: 2 * SizeConfig.widthMultiplier,
              ),
              child: Text(
                'Search Results: ${widget.movieList.totalResults}',
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: AppTheme.primaryColor,
                    ),
              ),
            ),
            ListGridMovieIconWidget(
              handleIconClick: handleIconClick,
              selectedView: selectedView,
            )
          ],
        ),
        selectedView == 0
            ? LandingMovieListView(movieList: widget.movieList)
            : LandingMovieGridView(movieList: widget.movieList)
      ],
    );
  }
}
