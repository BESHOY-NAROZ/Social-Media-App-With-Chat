import 'package:a_m_social_app/design_end/screen_chats_details.dart';
import 'package:a_m_social_app/networking/social_cubit.dart';
import 'package:a_m_social_app/networking/social_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        SocialCubit socialCubit = SocialCubit.getShopCubit(context);

        return Scaffold(
          body: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ScreenChatsDetails(
                      socialModel: socialCubit.allUsers[index],
                    );
                  }));
                },
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                            radius: 25.0,
                            backgroundImage: NetworkImage(
                                socialCubit.allUsers[index].image)),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          socialCubit.allUsers[index].name,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        // Icon(
                      ],
                    ),
                  ),
                ),
              );
            },
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: socialCubit.allUsers.length,
          ),
        );
      },
    );
  }
}
