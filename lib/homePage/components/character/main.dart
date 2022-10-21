import 'package:azulatcg/homePage/components/app_bar_custom.dart';
import 'package:azulatcg/homePage/components/functions/api_functions.dart';
import 'package:azulatcg/homePage/components/styles/styles.dart';

import 'package:flutter/material.dart';

import 'description_character.dart';
import 'image_character.dart';

class Character extends StatelessWidget {
  const Character({super.key});

  static const routes = "/character";

  @override
  Widget build(BuildContext context) {
    final character = ModalRoute.of(context)?.settings.arguments as Person;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBarCustom(
            title: character.name!,
          )),
      body: Container(
        padding: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: character.status == "Dead" ? deadGradient : normal,
        ),
        child: Column(
          children: [
            ImageCharacter(character: character),
            const SizedBox(
              height: 20,
            ),
            Flexible(child: DescriptionCharacter(character: character)),
          ],
        ),
      ),
    );
  }
}
