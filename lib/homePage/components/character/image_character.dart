import 'package:flutter/material.dart';
import '../functions/api_functions.dart';

class ImageCharacter extends StatelessWidget {
  const ImageCharacter({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Person character;

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      width: screen.size.width / 1.05,
      height: 240,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [
                Color.fromARGB(26, 0, 0, 0),
                Color.fromARGB(255, 104, 202, 23),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.9]),
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
              image: NetworkImage(character.image!),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7), BlendMode.dstATop))),
    );
  }
}
