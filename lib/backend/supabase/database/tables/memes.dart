import '../database.dart';

class MemesTable extends SupabaseTable<MemesRow> {
  @override
  String get tableName => 'memes';

  @override
  MemesRow createRow(Map<String, dynamic> data) => MemesRow(data);
}

class MemesRow extends SupabaseDataRow {
  MemesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MemesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get contentType => getField<String>('content_type')!;
  set contentType(String value) => setField<String>('content_type', value);

  String get path => getField<String>('path')!;
  set path(String value) => setField<String>('path', value);
}
