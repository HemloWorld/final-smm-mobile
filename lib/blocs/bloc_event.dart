abstract class BlocEvent {}

class SearchUserById extends BlocEvent {
  final String id;
  final String type;

  SearchUserById(this.id, this.type);
}

class SearchPresenceByUserId extends BlocEvent {
  final String userId;
  final int page;

  SearchPresenceByUserId(this.userId, this.page);
}

class SubmitAttendance extends BlocEvent{
  final String userId;
  final String date;
  final String time;

  SubmitAttendance(this.userId,this.date,this.time);
}

class Login extends BlocEvent {
  final String email;

  Login(this.email);
}
