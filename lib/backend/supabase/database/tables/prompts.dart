import '../database.dart';

class PromptsTable extends SupabaseTable<PromptsRow> {
  @override
  String get tableName => 'prompts';

  @override
  PromptsRow createRow(Map<String, dynamic> data) => PromptsRow(data);
}

class PromptsRow extends SupabaseDataRow {
  PromptsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PromptsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);
}
