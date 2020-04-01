import 'package:final_project/blocs/bloc_event.dart';
import 'package:final_project/blocs/bloc_state.dart';
import 'package:final_project/services/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPageBloc extends Bloc<BlocEvent, BlocState> {
  @override
  BlocState get initialState => Waiting();

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    if (event is SearchUserById) {
      yield Loading();
      try {
        final result = await UserService().fetchById(event.id, event.type);
        yield Success(result);
      } catch (e) {
        yield Error(e);
      }
    }
  }
}
