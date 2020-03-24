abstract class ListPageState {}

class Waiting extends ListPageState{}

class Loading extends ListPageState {}

class Success extends ListPageState {
  final List result;

  Success(this.result);
}

class Error extends ListPageState {
  final error;

  Error(this.error);
}

