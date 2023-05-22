import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

export 'database/database.dart';

const _kSupabaseUrl = 'https://ijprftsxdhbootmyiaaq.supabase.co';
const _kSupabaseAnonKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlqcHJmdHN4ZGhib290bXlpYWFxIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQ1NDgxNzUsImV4cCI6MjAwMDEyNDE3NX0.p4tv_R7Co-MMFxpaXeeHdGGFB5Ekm79ei4AicOZEn1s';

class SupaFlow {
  SupaFlow._();

  static SupaFlow? _instance;
  static SupaFlow get instance => _instance ??= SupaFlow._();

  final _supabase = Supabase.instance.client;
  static SupabaseClient get client => instance._supabase;

  static Future initialize() => Supabase.initialize(
        url: _kSupabaseUrl,
        anonKey: _kSupabaseAnonKey,
      );
}
