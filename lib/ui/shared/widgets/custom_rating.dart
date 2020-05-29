import 'package:flutter/material.dart';
import 'package:movie_app/shared/app_theme.dart';
import 'package:movie_app/shared/size_config.dart';

class CustomRating extends StatelessWidget {
  final double rating;
  final double size;
  final Color color;

  const CustomRating({
    this.rating = 4.5,
    this.size = 3,
    this.color = AppTheme.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    bool hasDecimal = rating % 1 == 0;
    int extendedValue = rating.floor();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < extendedValue) {
          return Icon(
            Icons.star,
            color: color,
            size: size * SizeConfig.imageSizeMultiplier,
          );
        } else {
          if (!hasDecimal) {
            hasDecimal = true;
            return Icon(
              Icons.star_half,
              color: color,
              size: size * SizeConfig.imageSizeMultiplier,
            );
          } else {
            return Icon(
              Icons.star_border,
              color: color,
              size: size * SizeConfig.imageSizeMultiplier,
            );
          }
        }
      }),
    );
  }
}
