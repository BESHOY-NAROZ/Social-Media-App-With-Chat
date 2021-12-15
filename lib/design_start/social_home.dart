import 'package:a_m_social_app/networking/social_cubit.dart';
import 'package:a_m_social_app/networking/social_states.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        SocialCubit socialCubit = SocialCubit.getShopCubit(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              socialCubit.titles[socialCubit.currentIndex],
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.notifications,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: socialCubit.screens[socialCubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.lightBlueAccent,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            currentIndex: socialCubit.currentIndex,
            onTap: (index) {
              socialCubit.changeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat,
                ),
                title: Text('Chats'),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                ),
                title: Text('Post'),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_taxi,
                ),
                title: Text('Users'),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                title: Text('Setting'),
              ),
            ],
          ),
        );
      },
    );
  }
}
