abstract class HistoryTabStates{}
class HistoryTabLoadingState extends HistoryTabStates{}
class HistoryTabSuccessState extends HistoryTabStates{}
class HistoryTabEmptyState extends HistoryTabStates{}
class HistoryTabErrorState extends HistoryTabStates{
  String errorMessage;
  HistoryTabErrorState({required this.errorMessage});
}
class HistoryTabInitialState extends HistoryTabStates{}
class WatchListGetTokenState extends HistoryTabStates{}