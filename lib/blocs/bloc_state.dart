abstract class BlocState {}

class Waiting extends BlocState{}

class Loading extends BlocState {}

class Success extends BlocState {
  final result;

  Success(this.result);
}

class Error extends BlocState {
  final error;

  Error(this.error);
}

