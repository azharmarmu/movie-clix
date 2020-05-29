import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/shared/app_theme.dart';
import 'package:movie_app/shared/size_config.dart';
import 'package:movie_app/ui/shared/widgets/custom_rating.dart';

class LandingMovieGridView extends StatelessWidget {
  final MovieListModel movieList;

  const LandingMovieGridView({@required this.movieList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: movieList.movieItem.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (_, index) => MovieGridItem(movieList.movieItem[index]),
      ),
    );
  }
}

class MovieGridItem extends StatelessWidget {
  final MovieItemModel movieItem;

  const MovieGridItem(this.movieItem);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 2 * SizeConfig.widthMultiplier,
        vertical: 1 * SizeConfig.heightMultiplier,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/poster-placeholder.jpg',
                image: '${movieItem.poster}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 2 * SizeConfig.widthMultiplier,
                vertical: 1 * SizeConfig.heightMultiplier,
              ),
              color: AppTheme.primaryColor.withOpacity(0.7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    movieItem.title,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: AppTheme.secondaryColor,
                          fontSize: 1.5 * SizeConfig.textMultiplier,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 1 * SizeConfig.heightMultiplier),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Released: ${movieItem.year}',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                color: AppTheme.secondaryColor,
                                fontSize: 1.25 * SizeConfig.textMultiplier,
                              ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 2 * SizeConfig.widthMultiplier),
                      CustomRating(rating: 5),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
