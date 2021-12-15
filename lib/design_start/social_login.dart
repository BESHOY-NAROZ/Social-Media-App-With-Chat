import 'package:a_m_social_app/design_start/social_home.dart';
import 'package:a_m_social_app/design_start/social_registeration.dart';
import 'package:a_m_social_app/networking/social_cubit.dart';
import 'package:a_m_social_app/networking/social_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../text_form_field.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
var validateKey = GlobalKey<FormState>();

class ScreenLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (BuildContext context, state) {
        if (state is SocialErrorLoginState) {
          Fluttertoast.showToast(
              msg: state.error.toString(),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        if (state is SocialCompleteLoginState) {
          Fluttertoast.showToast(
              msg: 'login succeeded',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ScreenHome()));
        }
      },
      builder: (BuildContext context, state) {
        SocialCubit socialCubit = SocialCubit.getShopCubit(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Center(
            child: Container(
              padding: EdgeInsets.all(12),
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Form(
                  key: validateKey,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'LOGIN',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text(
                        'login now to browse our offers',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      defaultFormField(
                        validate: (String value) {
                          if (value.isEmpty) {
                            return ('email must not be empty');
                          }
                          return null;
                        },
                        type: TextInputType.emailAddress,
                        controller: emailController,
                        prefix: Icons.mail_outline,
                        label: 'Email Address',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      defaultFormField(
                          validate: (String value) {
                            if (value.isEmpty) {
                              return ('password must not be empty');
                            }
                            return null;
                          },
                          isPassword: socialCubit.isPassword,
                          controller: passwordController,
                          prefix: Icons.lock_outline,
                          label: 'Password',
                          suffix: socialCubit.suffixIcon,
                          suffixPressed: () {
                            socialCubit.changePasswordVisibility();
                          }),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: 300,
                        child: RaisedButton(
                          elevation: 20,
                          color: Colors.blue,
                          onPressed: () {
                            if (validateKey.currentState.validate()) {
                              socialCubit.cubitLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                              print('Validate');
                            } else {
                              print('Not Validate');
                            }
                          },
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Don\'t have an account'),
                          FlatButton(
                            child: Text(
                              'Register Now',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ScreenRegistration()));
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
