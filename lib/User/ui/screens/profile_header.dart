import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app_avanzado/User/bloc/user_bloc.dart';
import 'package:platzi_trips_app_avanzado/User/model/user_model.dart';
import 'package:platzi_trips_app_avanzado/User/ui/widgets/button_bar.dart';
import 'package:platzi_trips_app_avanzado/User/ui/widgets/user_info.dart';

class ProfileHeader extends StatelessWidget {
  late UserBloc userBloc;
  late UserModel userModel;
  ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of<UserBloc>(context);

    return StreamBuilder(
      stream: userBloc.streamFirebase,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            return showProfileData(snapshot);

          case ConnectionState.waiting:
            return const CircularProgressIndicator();

          case ConnectionState.none:
            return const CircularProgressIndicator();

          case ConnectionState.done:
            return showProfileData(snapshot);
        }
      },
    );
  }

  Widget showProfileData(AsyncSnapshot snapshot) {
    if (!snapshot.hasData || snapshot.hasError) {
      return Container(
        margin: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 50.0,
        ),
        child: Column(
          children: const [
            CircularProgressIndicator(),
            Text('No se pudo la información. Haz login.')
          ],
        ),
      );
    } else {
      userModel = UserModel(
          name: snapshot.data.displayName,
          email: snapshot.data.email,
          photoURL: snapshot.data.photoURL);

      const title = Text(
        'Profile',
        style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0),
      );

      return Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
        child: Column(
          children: <Widget>[
            Row(
              children: const [title],
            ),
            UserInfo(userModel: userModel),
            ButtonsBar()
          ],
        ),
      );
    }
  }
}
