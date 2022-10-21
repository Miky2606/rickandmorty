import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../functions/api_functions.dart';

class DescriptionCharacter extends StatelessWidget {
  const DescriptionCharacter({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Person character;

  @override
  Widget build(BuildContext context) {
    DateTime createDate = DateTime.parse(character.created!);
    String created(DateTime date) => DateFormat("MMM d y").format(date);

    return Center(
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(20),
            mainAxisSpacing: 3,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            children: [
              ContainerNew(title: "Specie", text: character.species!),
              ContainerNew(title: "Gender", text: character.gender!),
              ContainerNew(title: "Created", text: created(createDate)),
              ContainerNew(
                  title: "Episodes", text: "${character.episodes.length}"),
            ]),
      ),
    );
  }
}

class ContainerNew extends StatelessWidget {
  const ContainerNew({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 120,
        height: 120,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.2),
                Colors.white.withOpacity(0),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.1, 0.9]),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(title,
              style: const TextStyle(fontSize: 25, color: Colors.green)),
          const SizedBox(
            height: 20,
          ),
          Text(
            text,
            style: const TextStyle(fontFamily: "Hack", fontSize: 20),
          ),
        ]));
  }
}
