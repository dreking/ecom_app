import 'package:ecommerce/components/custom_button.dart';
import 'package:ecommerce/components/custom_dialog.dart';
import 'package:ecommerce/components/custom_loading_spinner.dart';
import 'package:ecommerce/components/dismiss_keyboard.dart';
import 'package:ecommerce/components/input_card.dart';
import 'package:ecommerce/components/signinup_footer.dart';
import 'package:ecommerce/configs/size_config.dart';
import 'package:ecommerce/models/server_response.dart';
import 'package:ecommerce/models/user.dart';
import 'package:ecommerce/providers/auth_logic.dart';
import 'package:ecommerce/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _isSignIn = true;

  User _user = User();

  void _saveForm() async {
    final _isValid = _formKey.currentState!.validate();
    if (!_isValid) return;

    _formKey.currentState!.save();

    setState(() {
      _isLoading = true;
    });

    ServerResponse response;
    if (_isSignIn)
      response = await Provider.of<AuthLogic>(
        context,
        listen: false,
      ).signIn(_user);
    else
      response = await Provider.of<AuthLogic>(
        context,
        listen: false,
      ).signUp(_user);

    setState(() {
      _isLoading = false;
    });

    await showDialog(
      context: context,
      builder: (context) => CustomDialog(
        title: 'Sign In Status',
        text: response.message,
        onTap: () => Navigator.of(context).pop(),
      ),
    );

    if (response.status!)
      Navigator.of(
        context,
      ).pushNamedAndRemoveUntil(MainScreen.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? CustomLoadingSpinner()
        : DismissKeyboard(
            child: SafeArea(
              child: Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.all(
                    getProportionateScreenWidth(20),
                  ),
                  children: [
                    SizedBox(height: SizeConfig.screenHeight * 0.2),
                    Text(
                      _isSignIn ? 'Sign In' : 'Sign Up',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(30),
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    CustomInputCard(
                      color: Theme.of(context).primaryColor,
                      child: TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: 'Username',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter username';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          setState(() {
                            _user.username = value;
                          });
                        },
                      ),
                    ),
                    CustomInputCard(
                      color: Theme.of(context).primaryColor,
                      child: TextFormField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          labelText: 'Password',
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter password';
                          } else if (value.length < 5) {
                            return 'Password is short. Must be atleast 5 characters';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          setState(() {
                            _user.password = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.08),
                    CustomButton(
                      onTap: _saveForm,
                      text: _isSignIn ? 'Sign In' : 'Sign Up',
                    ),
                    SignInUpFooter(
                      title: _isSignIn ? 'Sign Up' : 'Sign In',
                      text: _isSignIn
                          ? 'Dont have an account yet?'
                          : 'Already have an account?',
                      onTap: () {
                        setState(() {
                          _isSignIn = !_isSignIn;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
