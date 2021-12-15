
import 'package:a_m_social_app/networking/social_cubit.dart';
import 'package:a_m_social_app/networking/social_states.dart';
import 'package:a_m_social_app/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

var nameController = TextEditingController();
var emailController = TextEditingController();
var passwordController = TextEditingController();
var phoneController = TextEditingController();
var validateKey = GlobalKey<FormState>();

class ScreenRegistration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
        listener: (BuildContext context, state) {
      // if (state is SocialErrorCreateState) {
      //   Fluttertoast.showToast(
      //       msg: state.error.toString(),
      //       toastLength: Toast.LENGTH_LONG,
      //       gravity: ToastGravity.BOTTOM,
      //       timeInSecForIosWeb: 1,
      //       backgroundColor: Colors.red,
      //       textColor: Colors.white,
      //       fontSize: 16.0);
      // }
      //
      // if (state is SocialCompleteCreateState) {
      //   Fluttertoast.showToast(
      //       msg: 'creation succeeded',
      //       toastLength: Toast.LENGTH_LONG,
      //       gravity: ToastGravity.BOTTOM,
      //       timeInSecForIosWeb: 1,
      //       backgroundColor: Colors.green,
      //       textColor: Colors.white,
      //       fontSize: 16.0);
      // }

      if (state is SocialErrorRegisterState) {
        Fluttertoast.showToast(
            msg: state.error.toString(),
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      if (state is SocialCompleteRegisterState) {
        Navigator.pop(
          context,
        );
        Fluttertoast.showToast(
            msg: "Registration succeeded",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }, builder: (BuildContext context, state) {
      SocialCubit socialCubit = SocialCubit.getShopCubit(context);
      return Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: validateKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                defaultFormField(
                  controller: nameController,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'name must not be empty';
                    }

                    return null;
                  },
                  label: 'Name',
                  prefix: Icons.person,
                ),
                SizedBox(
                  height: 20.0,
                ),
                defaultFormField(
                  controller: emailController,
                  type: TextInputType.emailAddress,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'email must not be empty';
                    }

                    return null;
                  },
                  label: 'Email Address',
                  prefix: Icons.email,
                ),
                SizedBox(
                  height: 20.0,
                ),
                defaultFormField(
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'email must not be empty';
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
                  height: 20.0,
                ),
                defaultFormField(
                  controller: phoneController,
                  type: TextInputType.phone,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'phone must not be empty';
                    }

                    return null;
                  },
                  label: 'Phone',
                  prefix: Icons.phone,
                ),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 300,
                  child: RaisedButton(
                    elevation: 20,
                    color: Colors.blue,
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (validateKey.currentState.validate()) {
                        socialCubit.cubitRegister(
                            email: emailController.text,
                            password: passwordController.text,
                            phone: phoneController.text,
                            name: nameController.text);

                        print('Validate');
                      } else {
                        print('Not Validate');
                      }
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('I have an account'),
                    FlatButton(
                      child: Text(
                        'Login Now',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ));
    });
  }
}
