import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/auth/bloc.dart';
import 'package:movie_app/bloc/landing/bloc.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/shared/app_theme.dart';
import 'package:movie_app/shared/size_config.dart';
import 'package:movie_app/ui/landing/widgets/landing_body.dart';
import 'package:movie_app/ui/shared/widgets/custom_search_box.dart';

class LandingPage extends StatelessWidget {
  final LandingBloc _landingBloc = LandingBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _searchBox(context),
        actions: <Widget>[_logoutActionWidget(context)],
      ),
      body: BlocProvider<LandingBloc>(
        create: (context) => _landingBloc,
        child: BlocBuilder<LandingBloc, LandingState>(
          builder: (_, state) {
            if (state is LandingInitialState) {
              return _buildCommonWidget(
                context,
                'Provide valid movie name',
                'Try with min 2+ character',
              );
            } else if (state is LandingLoadingState) {
              return _buildCommonWidget(context, '', 'Loading...');
            } else if (state is LandingSearchSuccessState) {
              return _buildSuccessWidget(context, state.movieList);
            } else if (state is LandingSearchFailureState) {
              return _buildCommonWidget(context, state.title, state.message);
            }
            return Container();
          },
        ),
      ),
    );
  }

  _searchBox(BuildContext context) {
    return CustomSearchBox(
      onChanged: (String text) {
        if (text.length > 0) {
          _landingBloc.add(LandingSearchEvent(searchKey: text));
        } else {
          _landingBloc.add(LandingInitialEvent());
        }
      },
    );
  }

  _logoutActionWidget(BuildContext context) {
    return GestureDetector(
      onTap: () => BlocProvider.of<AuthBloc>(context).add(AuthLogoutEvent()),
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: 4 * SizeConfig.widthMultiplier),
        alignment: Alignment.center,
        child: Text(
          'LOGOUT',
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }

  _buildSuccessWidget(BuildContext context, MovieListModel movieList) {
    return LandingBody(movieList: movieList);
  }

  Widget _buildCommonWidget(
    BuildContext context,
    String title,
    String message,
  ) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: 4 * SizeConfig.widthMultiplier,
        vertical: 2 * SizeConfig.heightMultiplier,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 4 * SizeConfig.heightMultiplier),
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primaryColor,
                ),
          ),
          SizedBox(height: 2 * SizeConfig.heightMultiplier),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: AppTheme.primaryColor.withOpacity(0.7),
                ),
          ),
        ],
      ),
    );
  }
}
