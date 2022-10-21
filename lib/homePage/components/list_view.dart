import 'package:azulatcg/provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cards/cardslist.dart';
import 'errors/errors_view.dart';

class ListCharacter extends StatelessWidget {
  const ListCharacter({super.key});

  @override
  Widget build(BuildContext context) {
    CharacterProvider provider = Provider.of<CharacterProvider>(context);
    return Builder(
      builder: ((context) {
        if (provider.apiStatus == ApiStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (provider.apiStatus == ApiStatus.error) {
          return const ErrorView();
        }

        return ListView.builder(
            controller: provider.controller,
            itemCount: provider.person.length,
            itemBuilder: ((context, index) {
              final user = provider.person[index];

              if (index + 2 < provider.person.length + 1) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed("/character", arguments: user);
                    },
                    child: CardsList(
                      user: user,
                    ),
                  ),
                );
              } else {
                return provider.apiStatus == ApiStatus.endDatos
                    ? const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(child: Text("No More Data")),
                      )
                    : const Padding(
                        padding: EdgeInsets.all(8),
                        child: Center(child: CircularProgressIndicator()));
              }
            }));
      }),
    );
  }
}
