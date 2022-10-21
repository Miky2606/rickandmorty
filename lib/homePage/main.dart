import 'package:flutter/material.dart';

import 'components/app_bar_custom.dart';
import 'components/list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBarCustom(
              title: "Rick & Morty",
              button: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/search");
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 18,
                  )),
            )),
        body: const ListCharacter());
  }
}

    //,