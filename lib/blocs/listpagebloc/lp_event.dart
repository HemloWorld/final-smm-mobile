abstract class ListPageEvent {}

class SearchByName extends ListPageEvent {
  final String name;

  SearchByName(this.name);
}

class SearchByQrId extends ListPageEvent  {
  final String id;

  SearchByQrId(this.id);
}

class SearchByNfcId extends ListPageEvent {
  final String id;

  SearchByNfcId(this.id);
}