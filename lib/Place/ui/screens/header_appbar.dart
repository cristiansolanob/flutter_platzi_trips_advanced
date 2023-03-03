import 'package:flutter/material.dart';
import 'package:platzi_trips_app_avanzado/Place/ui/widgets/card_image_list.dart';
import '../../../widgets/gradient_back.dart';

class HeaderAppBar extends StatelessWidget {
  const HeaderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GradientBack(
          height: 250,
        ),
        const CardImageList()
      ],
    );
  }
}
