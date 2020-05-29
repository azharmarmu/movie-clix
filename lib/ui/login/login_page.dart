import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/auth/auth_bloc.dart';
import 'package:movie_app/bloc/auth/auth_event.dart';
import 'package:movie_app/shared/app_theme.dart';
import 'package:movie_app/shared/size_config.dart';
import 'package:movie_app/ui/shared/widgets/custom_button.dart';
import 'package:movie_app/ui/shared/widgets/custom_errortext.dart';
import 'package:movie_app/ui/shared/widgets/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  final String email;
  final String password;
  final String error;

  const LoginPage({
    this.email = '',
    this.password = '',
    this.error = '',
  });

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _nameController;
  TextEditingController _passwordController = TextEditingController();

  String error;
  bool secure = true;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.email);
    _passwordController = TextEditingController(text: widget.password);
    error = widget.error;
    super.initState();
  }

  @override
  void didUpdateWidget(LoginPage oldWidget) {
    error = widget.error;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      appBar: AppBar(
        elevation: 0,
      ),
      body: _buildInitial(context),
    );
  }

  Widget _buildInitial(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 8 * SizeConfig.widthMultiplier,
      ),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          _loginText(context),
          SizedBox(height: 2 * SizeConfig.heightMultiplier),
          _loginLogo(context),
          SizedBox(height: 2 * SizeConfig.heightMultiplier),
          CustomErrorText(errorText: error),
          SizedBox(height: 2 * SizeConfig.heightMultiplier),
          _nameTextField(context),
          SizedBox(height: 2 * SizeConfig.heightMultiplier),
          _passwordTextField(context),
          SizedBox(height: 4 * SizeConfig.heightMultiplier),
          _loginButton(context),
          SizedBox(height: 4 * SizeConfig.heightMultiplier),
        ],
      ),
    );
  }

  _loginText(BuildContext context) {
    return Center(
      child: Text(
        'Login',
        style: Theme.of(context).textTheme.headline1.copyWith(
              color: AppTheme.accentColor,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }

  _loginLogo(BuildContext context) {
    return Center(
      child: Icon(
        Icons.local_activity,
        color: AppTheme.accentColor,
        size: 24 * SizeConfig.imageSizeMultiplier,
      ),
    );
  }

  _nameTextField(BuildContext context) {
    return CustomTextField(
      textEditingController: _nameController,
      hintText: 'Movie name',
      textCapitalization: TextCapitalization.words,
      autoFocus: true,
    );
  }

  _passwordTextField(BuildContext context) {
    return CustomTextField(
      textEditingController: _passwordController,
      hintText: 'Password',
      textInputType: TextInputType.number,
      obscureText: secure,
      showIcon: true,
      maxLength: 4,
      onIconPress: () => setState(() {
        secure = !secure;
      }),
    );
  }

  _loginButton(BuildContext context) {
    return CustomButton(
      text: 'Login',
      backgroundColor: AppTheme.accentColor,
      onTap: () => checkValidation(context),
    );
  }

  checkValidation(BuildContext context) async {
    String name = _nameController.text.toString().trim();
    String password = _passwordController.text.toString().trim();

    if (name.isEmpty) {
      error = 'Movie cannot be empty';
      setState(() {});
      return;
    } else if (password.isEmpty) {
      error = 'Password cannot be empty';
      setState(() {});
      return;
    }

    BlocProvider.of<AuthBloc>(context).add(AuthLoginInEvent(
      name: name,
      password: password,
    ));
  }
}
