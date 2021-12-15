
import 'package:a_m_social_app/networking/social_cubit.dart';
import 'package:a_m_social_app/networking/social_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        SocialCubit socialCubit = SocialCubit.getShopCubit(context);
        return Scaffold();
      },
    );
  }
}
