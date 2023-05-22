import '../database.dart';

class PlayersTable extends SupabaseTable<PlayersRow> {
  @override
  String get tableName => 'players';

  @override
  PlayersRow createRow(Map<String, dynamic> data) => PlayersRow(data);
}

class PlayersRow extends SupabaseDataRow {
  PlayersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PlayersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  int get score => getField<int>('score')!;
  set score(int value) => setField<int>('score', value);

  List<String> get memesList => getListField<String>('memes_list');
  set memesList(List<String>? value) =>
      setListField<String>('memes_list', value);
}
