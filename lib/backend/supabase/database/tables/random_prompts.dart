import '../database.dart';

class RandomPromptsTable extends SupabaseTable<RandomPromptsRow> {
  @override
  String get tableName => 'random_prompts';

  @override
  RandomPromptsRow createRow(Map<String, dynamic> data) =>
      RandomPromptsRow(data);
}

class RandomPromptsRow extends SupabaseDataRow {
  RandomPromptsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RandomPromptsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);
}
