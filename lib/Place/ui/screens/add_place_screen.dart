import 'package:flutter/material.dart';
import 'package:platzi_trips_app_avanzado/widgets/gradient_back.dart';
import 'package:platzi_trips_app_avanzado/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {
  final dynamic image;

  const AddPlaceScreen({super.key, required this.image});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          GradientBack(height: 250),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 25, left: 5),
                child: SizedBox(
                  height: 45,
                  width: 45,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                        size: 45,
                      )),
                ),
              ),
              Flexible(
                child: SizedBox(
                  width: screenWidth,
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 45, left: 20, right: 10),
                    child: const TitleHeader(title: 'Add a new Place'),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
