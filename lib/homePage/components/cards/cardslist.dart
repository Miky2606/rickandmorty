import 'package:azulatcg/homePage/components/styles/styles.dart';
import 'package:flutter/material.dart';

import '../functions/api_functions.dart';

class CardsList extends StatelessWidget {
  const CardsList({Key? key, required this.user}) : super(key: key);

  final Person user;

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    return Stack(
      alignment: Alignment.center,
      children: [
        WastedView(screen: screen, view: user.status == "Dead" ? true : false),
        Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.red.withOpacity(0.2), width: 1.0),
                gradient: user.status! == "Dead" ? deadGradient : normal,
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            width: screen.size.width,
            height: 100,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            CircleAvatar(backgroundImage: NetworkImage(user.image!)),
            Flexible(
              child: Text(
                user.name!,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: screen.size.width / 20,
                    fontFamily: "Hack",
                    color: Colors.black,
                    shadows: const [
                      Shadow(
                          color: Color.fromARGB(255, 221, 213, 213),
                          offset: Offset(0, 2),
                          blurRadius: 0.3),
                    ]),
              ),
            ),
          ]),
        )
      ],
    );
  }
}

// Wasted View If the character is dead

class WastedView extends StatelessWidget {
  const WastedView({super.key, required this.screen, required this.view});
  final MediaQueryData screen;
  final bool view;

  @override
  Widget build(BuildContext context) {
    return !view
        ? Container()
        : Image.asset(
            "images/wasted.png",
            width: screen.size.width,
            height: 100,
          );
  }
}
