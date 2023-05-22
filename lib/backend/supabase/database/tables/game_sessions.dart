import '../database.dart';

class GameSessionsTable extends SupabaseTable<GameSessionsRow> {
  @override
  String get tableName => 'game_sessions';

  @override
  GameSessionsRow createRow(Map<String, dynamic> data) => GameSessionsRow(data);
}

class GameSessionsRow extends SupabaseDataRow {
  GameSessionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GameSessionsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String get joinCode => getField<String>('join_code')!;
  set joinCode(String value) => setField<String>('join_code', value);

  List<String> get joinedPlayers => getListField<String>('joined_players');
  set joinedPlayers(List<String>? value) =>
      setListField<String>('joined_players', value);

  String get hostPlayerId => getField<String>('host_player_id')!;
  set hostPlayerId(String value) => setField<String>('host_player_id', value);

  String? get currentRound => getField<String>('current_round');
  set currentRound(String? value) => setField<String>('current_round', value);
}
