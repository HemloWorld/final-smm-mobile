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
