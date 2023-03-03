import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app_avanzado/User/bloc/user_bloc.dart';
import 'package:platzi_trips_app_avanzado/User/model/user_model.dart';
import 'package:platzi_trips_app_avanzado/platzi_trips_cupertino.dart';
import 'package:platzi_trips_app_avanzado/widgets/button_green.dart';
import 'package:platzi_trips_app_avanzado/widgets/gradient_back.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late UserBloc userBloc;
  late double screenWidth;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    screenWidth = MediaQuery.of(context).size.width;
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
        stream: userBloc.authStatus,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return signInGoogleIU();
          } else {
            return const PlatziTripsCupertino();
          }
        });
  }

  Widget signInGoogleIU() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack(
            height: 0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: SizedBox(
                  width: screenWidth,
                  child: const Text(
                    'Welcome \n This is your Travel App',
                    style: TextStyle(
                      fontSize: 37,
                      fontFamily: "Lato",
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              ButtonGreen(
                  text: 'Login with Gmail',
                  width: 300,
                  height: 50,
                  onPressed: () {
                    userBloc.signOut();
                    userBloc.signIn().then((User? user) {
                      userBloc.updateUserDate(UserModel(
                          uid: user!.uid,
                          name: user.displayName,
                          email: user.email,
                          photoURL: user.photoURL));
                    });
                  })
            ],
          )
        ],
      ),
    );
  }
}
