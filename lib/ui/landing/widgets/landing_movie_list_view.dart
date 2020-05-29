import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/shared/app_theme.dart';
import 'package:movie_app/shared/size_config.dart';
import 'package:movie_app/ui/shared/widgets/custom_rating.dart';

class LandingMovieListView extends StatelessWidget {
  final MovieListModel movieList;

  const LandingMovieListView({@required this.movieList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: movieList.movieItem.length,
        itemBuilder: (_, index) => MovieListItem(movieList.movieItem[index]),
        separatorBuilder: (_, index) => Container(
          child: SizedBox(
            height: 1 * SizeConfig.heightMultiplier,
          ),
        ),
      ),
    );
  }
}

class MovieListItem extends StatelessWidget {
  final MovieItemModel movieItem;

  const MovieListItem(this.movieItem);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 2 * SizeConfig.widthMultiplier,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      ),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 24 * SizeConfig.widthMultiplier,
                  height: 12 * SizeConfig.heightMultiplier,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                    ),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/poster-placeholder.jpg',
                      image: '${movieItem.poster}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 2 * SizeConfig.widthMultiplier),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 1 * SizeConfig.heightMultiplier),
                      Text(
                        movieItem.title,
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: AppTheme.primaryColor,
                              fontSize: 2 * SizeConfig.textMultiplier,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 1 * SizeConfig.heightMultiplier),
                      Text(
                        'Released: ${movieItem.year}',
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                              color: AppTheme.hintColor,
                            ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 0.5 * SizeConfig.heightMultiplier),
                      CustomRating(rating: 5),
                      SizedBox(height: 1 * SizeConfig.heightMultiplier),
                    ],
                  ),
                ),
                SizedBox(width: 1 * SizeConfig.widthMultiplier),
              ],
            )
          ],
        ),
      ),
    );
  }
}
