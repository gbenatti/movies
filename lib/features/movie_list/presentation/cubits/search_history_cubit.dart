import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'search_history_state.dart';

class SearchHistoryCubit extends Cubit<SearchHistoryState> {
  SearchHistoryCubit() : super(SearchHistoryInitial());

  static const historyLength = 5;
  final List<String> _searchHistory = [];
  List<String> filteredSearchHistory = [];
  String selectedTerm;

  List<String> filterSearchTerm({@required String filter}) {
    if (filter == null || filter.isEmpty) {
      return _searchHistory.reversed.toList();
    }

    return _searchHistory.reversed
        .where((term) => term.startsWith(filter))
        .toList();
  }

  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      putSearchTermFirst(term);
      return;
    }

    addTermAndTrimLength(term);
    updateFilteredSearchHistory();
  }

  void putSearchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  void addTermAndTrimLength(String term) {
    _searchHistory.add(term);
    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }
  }

  void updateFilteredSearchHistory() => filteredSearchHistory = filterSearchTerm(filter: null);

  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    updateFilteredSearchHistory();
  }
}

