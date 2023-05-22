import '../database.dart';

class RatingsTable extends SupabaseTable<RatingsRow> {
  @override
  String get tableName => 'ratings';

  @override
  RatingsRow createRow(Map<String, dynamic> data) => RatingsRow(data);
}

class RatingsRow extends SupabaseDataRow {
  RatingsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RatingsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String get gameRoundId => getField<String>('game_round_id')!;
  set gameRoundId(String value) => setField<String>('game_round_id', value);

  String get memeSubmissionId => getField<String>('meme_submission_id')!;
  set memeSubmissionId(String value) =>
      setField<String>('meme_submission_id', value);

  String get fromPlayerId => getField<String>('from_player_id')!;
  set fromPlayerId(String value) => setField<String>('from_player_id', value);

  int get value => getField<int>('value')!;
  set value(int value) => setField<int>('value', value);
}
