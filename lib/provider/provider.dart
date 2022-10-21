import 'package:azulatcg/homePage/components/functions/api_functions.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

enum ApiStatus { init, loading, loaded, error, endDatos }

class CharacterProvider extends ChangeNotifier {
  ScrollController controller = ScrollController();
  ScrollController controllerSearch = ScrollController();
  CharacterProvider() {
    getPerson();
    controller.addListener(loadMore);
    controllerSearch.addListener(loadMoreSearch);
  }

  ApiStatus _apiStatus = ApiStatus.init;
  ApiStatus _apiStatusSearch = ApiStatus.init;
  List<Person> person = [];
  List<Person> searchPerson = [];
  int _page = 1;
  int get page => _page;
  int pagesCount = 0;
  int get _pagesCount => pagesCount;

  // ignore: prefer_final_fields
  int _pageSearch = 1;
  int get pageSearch => _pageSearch;

  String _value = "";
  String get value => _value;
  ApiStatus get apiStatus => _apiStatus;

  ApiStatus get apiStatusSearch => _apiStatusSearch;

  setValue(String value) {
    _value = value;
    getSearch();
  }

  void loadMore() async {
    if (controller.position.atEdge) {
      final top = controller.position.pixels == 0;

      if (!top) {
        _page++;

        getPerson();
      }
    }
  }

  void loadMoreSearch() async {
    if (controllerSearch.position.atEdge) {
      final top = controllerSearch.position.pixels == 0;

      if (!top) {
        _pageSearch++;
        print(_pageSearch);
        getSearch();
      }
    }
  }

  Future<void> getSearch() async {
    _apiStatusSearch = ApiStatus.loading;

    try {
      _apiStatusSearch = ApiStatus.loaded;
      final ResponseData search = await Api().getSearch(value, pageSearch);

      if (value.isEmpty) {
        searchPerson = [];
        _pageSearch = 1;
      } else {
        if (pageSearch > 1) {
          searchPerson.addAll(search.person!);
        } else {
          searchPerson = search.person!;
        }
      }
    } catch (e) {
      if (e is DioError) {
        if (e.message == "Http status error [404]") {
          _apiStatusSearch = ApiStatus.endDatos;
        } else {
          print("Error : ${e.toString()} :::::");
          _apiStatusSearch = ApiStatus.error;
        }
      }
    }

    notifyListeners();
  }

  Future<void> getPerson() async {
    _apiStatus = ApiStatus.loading;

    try {
      final List<Person> data =
          await Future.delayed(const Duration(seconds: 2), () {
        return Api().getApi(page);
      });
      person.addAll(data);

      _apiStatus = ApiStatus.loaded;
    } catch (e) {
      if (e is DioError) {
        if (e.message == "Http status error [404]") {
          _apiStatus = ApiStatus.endDatos;
        } else {
          _apiStatus = ApiStatus.error;
        }
      }
    }

    notifyListeners();
  }
}
