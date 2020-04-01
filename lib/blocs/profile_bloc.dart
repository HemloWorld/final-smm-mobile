import 'package:final_project/blocs/bloc_event.dart';
import 'package:final_project/blocs/bloc_state.dart';
import 'package:final_project/services/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<BlocEvent, BlocState> {
  @override
  // TODO: implement initialState
  BlocState get initialState => Waiting();

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    if (event is SearchUserById) {
      yield Loading();
      try {
        final result = await UserService().fetchById(event.id, event.type);

        yield Success(result);
      } catch (e) {
        print(e);
      }
    } else if (event is SearchPresenceByUserId) {
      yield Loading();
      try {
        final result = await UserService()
            .fetchPresenceByUserId(event.userId, event.page);

        yield Success(result);
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
