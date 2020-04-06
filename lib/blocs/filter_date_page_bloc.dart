import 'package:final_project/blocs/bloc_event.dart';
import 'package:final_project/blocs/bloc_state.dart';
import 'package:final_project/services/user_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterDatePageBloc extends Bloc<BlocEvent,BlocState> {
  @override
  // TODO: implement initialState
  BlocState get initialState => Waiting();

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    if(event is SearchPresenceByDate){
      yield Loading();
      try{
        final result = await UserService().fetchPresenceByDate(event.date);
        yield Success(result);
      } catch(e) {
        yield Error(e);
      }
    }
  }

}