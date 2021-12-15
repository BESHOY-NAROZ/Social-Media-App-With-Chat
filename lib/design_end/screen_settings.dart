
import 'package:a_m_social_app/additional_design/screen_editing.dart';
import 'package:a_m_social_app/networking/social_cubit.dart';
import 'package:a_m_social_app/networking/social_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        SocialCubit socialCubit = SocialCubit.getShopCubit(context);
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 190,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image(
                            fit: BoxFit.fill,
                            height: 150,
                            width: double.infinity,
                            image: NetworkImage(
                                //    'https://image.freepik.com/free-photo/family-with-child-dog-spending-time-together_23-2148728197.jpg'
                                socialCubit.socialModel2.cover),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 53,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundImage: NetworkImage(
                              //    'https://image.freepik.com/free-photo/full-shot-kid-dog-park_23-2149048110.jpg'
                              socialCubit.socialModel2.image),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  socialCubit.socialModel2.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 15),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  socialCubit.socialModel2.bio,
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(fontSize: 15),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: <Widget>[
                            Text(
                              '100',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Text(
                              'Post',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: <Widget>[
                            Text(
                              '100',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Text(
                              'Post',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: <Widget>[
                            Text(
                              '100',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Text(
                              'Post',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: <Widget>[
                            Text(
                              '100',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            Text(
                              'Post',
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: OutlineButton(
                          onPressed: () {},
                          child: Text(
                            'Add  Photos',
                            style: TextStyle(
                                letterSpacing: 3,
                                fontSize: 18,
                                color: Colors.lightBlue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      OutlineButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScreenEditing()));
                          },
                          child: Icon(
                            Icons.edit,
                            color: Colors.lightBlue,
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
