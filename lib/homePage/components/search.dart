import 'package:azulatcg/homePage/components/app_bar_custom.dart';
import 'package:azulatcg/homePage/components/cards/cardslist.dart';
import 'package:azulatcg/homePage/components/errors/errors_view.dart';
import 'package:azulatcg/homePage/components/functions/api_functions.dart';

import 'package:azulatcg/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final CharacterProvider provider =
        Provider.of<CharacterProvider>(context, listen: false);

    final TextEditingController controller =
        TextEditingController(text: provider.value);

    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBarCustom(
            title: "Search",
            search: SizedBox(
              width: 200,
              height: 30,
              child: TextField(
                controller: controller,
                onChanged: provider.setValue,
                style: const TextStyle(color: Colors.black, fontSize: 13),
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 0.5, color: Colors.white)),
                    hintText: "Search",
                    suffixIcon: Icon(
                      Icons.search,
                      size: 16,
                      color: Colors.white,
                    )),
              ),
            ),
          )),
      body: const ListSearch(),
    );
  }
}

class ListSearch extends StatelessWidget {
  const ListSearch({super.key});
  @override
  Widget build(BuildContext context) {
    CharacterProvider provider = Provider.of<CharacterProvider>(context);

    return Builder(builder: ((context) {
      if (provider.apiStatusSearch == ApiStatus.loading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (provider.apiStatusSearch == ApiStatus.error) {
        return const ErrorView();
      }

      return provider.searchPerson.isEmpty
          ? const NotFound()
          : ListView.builder(
              controller: provider.controllerSearch,
              itemCount: provider.searchPerson.length,
              itemBuilder: ((context, index) {
                Person character = provider.searchPerson[index];
                if (index + 2 < provider.searchPerson.length + 1) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed("/character", arguments: character);
                      },
                      child: CardsList(
                        user: character,
                      ),
                    ),
                  );
                } else {
                  return provider.apiStatusSearch == ApiStatus.endDatos
                      ? const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(child: Text("No More Data")),
                        )
                      : const Padding(
                          padding: EdgeInsets.all(8),
                          child: Center(child: CircularProgressIndicator()));
                }
              }));
    }));
  }
}
