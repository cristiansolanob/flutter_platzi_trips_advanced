import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app_avanzado/Place/ui/screens/add_place_screen.dart';
import 'package:platzi_trips_app_avanzado/User/bloc/user_bloc.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {
  late UserBloc userBloc;
  ButtonsBar({super.key});

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: Row(
          children: [
            CircleButton(
              true,
              Icons.vpn_key,
              20.0,
              const Color.fromRGBO(255, 255, 255, 0.6),
              onPressed: () {},
            ),
            CircleButton(
              false,
              Icons.add,
              20.0,
              const Color.fromRGBO(255, 255, 255, 1),
              onPressed: () {
                dynamic image;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddPlaceScreen(image: image),
                    ));
              },
            ),
            CircleButton(
              true,
              Icons.exit_to_app,
              20.0,
              const Color.fromRGBO(255, 255, 255, 0.6),
              onPressed: () {
                userBloc.signOut();
              },
            ),
          ],
        ));
  }
}
