// Libraries
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:touch/util/size_config.dart';
import 'package:touch/util/app_constant.dart';
import 'package:touch/util/app_localizations.dart';

// Components
import 'components/body.dart';

// Sign In Screen
class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    AppLocalizations.of(context);
    // Portrait Mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.getString(AppConstant.kSignInText)),
      ),
      body: Body(),
      // Sticky or Fixed Layout
      // Don't have an account
      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(15.0), // 8
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                AppLocalizations.getString(AppConstant.kNoAccountText),
              ),
              // Sign Up Page router
              GestureDetector(
                onTap: () => {
                  Navigator.pushNamed(context, AppConstant.pageSignUp),
                },
                child: Text(
                  AppLocalizations.getString(AppConstant.kSignUpText),
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      fontWeight: FontWeight.w600,
                      color: AppConstant.kPrimaryColor),
                ),
              ),
            ],
          )),
    );
  }
}
