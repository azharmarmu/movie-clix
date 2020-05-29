import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/auth/bloc.dart';
import 'package:movie_app/shared/app_routes.dart';
import 'package:movie_app/shared/app_theme.dart';
import 'package:movie_app/shared/navigation_service.dart';
import 'package:movie_app/shared/size_config.dart';
import 'package:movie_app/ui/landing/landing_page.dart';
import 'package:movie_app/ui/login/login_page.dart';
import 'package:movie_app/ui/shared/widgets/custom_loadingbar.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    print(error);
    super.onError(bloc, error, stacktrace);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: NavigationService.navigationKey,
              title: 'Movie CLIX',
              theme: AppTheme.appTheme,
              home: AuthCheckPage(),
              onGenerateRoute: RouteGenerator.generateRoute,
            );
          },
        );
      },
    );
  }
}

class AuthCheckPage extends StatelessWidget {
  final AuthBloc _authBloc = AuthBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => _authBloc,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (_, state) {
          if (state is AuthLoadingState) {
            loadingBar(context, barrierDismissible: false);
          } else if (state is AuthLoginFailureState) {
            Navigator.of(context).pop();
          } else if (state is AuthLoginSuccessState) {
            Navigator.of(context).pop();
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (_, state) {
            if (state is AuthInitialState) {
              _authBloc.add(AuthCheckEvent());
              return Container(color: AppTheme.primaryColor);
            } else if (state is AuthCheckSuccessState ||
                state is AuthLoginSuccessState) {
              return LandingPage();
            } else if (state is AuthLoginFailureState) {
              return LoginPage(
                email: state.email,
                password: state.password,
                error: state.message,
              );
            }
            return LoginPage();
          },
        ),
      ),
    );
  }
}
