import '../database.dart';

class GameRoundsTable extends SupabaseTable<GameRoundsRow> {
  @override
  String get tableName => 'game_rounds';

  @override
  GameRoundsRow createRow(Map<String, dynamic> data) => GameRoundsRow(data);
}

class GameRoundsRow extends SupabaseDataRow {
  GameRoundsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GameRoundsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String get promptId => getField<String>('prompt_id')!;
  set promptId(String value) => setField<String>('prompt_id', value);

  List<String> get playerIds => getListField<String>('player_ids');
  set playerIds(List<String>? value) =>
      setListField<String>('player_ids', value);
}
