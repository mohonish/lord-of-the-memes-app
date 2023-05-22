import '../database.dart';

class MemeSubmissionsTable extends SupabaseTable<MemeSubmissionsRow> {
  @override
  String get tableName => 'meme_submissions';

  @override
  MemeSubmissionsRow createRow(Map<String, dynamic> data) =>
      MemeSubmissionsRow(data);
}

class MemeSubmissionsRow extends SupabaseDataRow {
  MemeSubmissionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MemeSubmissionsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String get gameRoundId => getField<String>('game_round_id')!;
  set gameRoundId(String value) => setField<String>('game_round_id', value);

  String get playerId => getField<String>('player_id')!;
  set playerId(String value) => setField<String>('player_id', value);

  String get memeUrl => getField<String>('meme_url')!;
  set memeUrl(String value) => setField<String>('meme_url', value);
}
