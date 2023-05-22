import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetGameSessionCall {
  static Future<ApiCallResponse> call({
    String? joinCode = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get game session',
      apiUrl: 'https://ijprftsxdhbootmyiaaq.supabase.co/rest/v1/game_sessions',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlqcHJmdHN4ZGhib290bXlpYWFxIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQ1NDgxNzUsImV4cCI6MjAwMDEyNDE3NX0.p4tv_R7Co-MMFxpaXeeHdGGFB5Ekm79ei4AicOZEn1s',
      },
      params: {
        'join_code': joinCode,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetRandomPromptCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'Get random prompt',
      apiUrl: 'https://ijprftsxdhbootmyiaaq.supabase.co/rest/v1/random_prompts',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlqcHJmdHN4ZGhib290bXlpYWFxIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQ1NDgxNzUsImV4cCI6MjAwMDEyNDE3NX0.p4tv_R7Co-MMFxpaXeeHdGGFB5Ekm79ei4AicOZEn1s',
      },
      params: {
        'limit': 1,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetGameRoundCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get game round',
      apiUrl: 'https://ijprftsxdhbootmyiaaq.supabase.co/rest/v1/game_rounds',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlqcHJmdHN4ZGhib290bXlpYWFxIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQ1NDgxNzUsImV4cCI6MjAwMDEyNDE3NX0.p4tv_R7Co-MMFxpaXeeHdGGFB5Ekm79ei4AicOZEn1s',
      },
      params: {
        'id': id,
        'limit': 1,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetPromptWithIdCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get prompt with id',
      apiUrl: 'https://ijprftsxdhbootmyiaaq.supabase.co/rest/v1/prompts',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlqcHJmdHN4ZGhib290bXlpYWFxIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQ1NDgxNzUsImV4cCI6MjAwMDEyNDE3NX0.p4tv_R7Co-MMFxpaXeeHdGGFB5Ekm79ei4AicOZEn1s',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TenorGifSearchCall {
  static Future<ApiCallResponse> call({
    String? q = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Tenor Gif Search',
      apiUrl: 'https://tenor.googleapis.com/v2/search',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'key': "AIzaSyBqhgip_UxUeGbgMDOy7sWUxbD_ZD97eqY",
        'q': q,
        'limit': 15,
        'contentfilter': "low",
        'media_filter': "gif,tinygif",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class TenorGifFetchCall {
  static Future<ApiCallResponse> call({
    String? ids = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Tenor Gif Fetch',
      apiUrl: 'https://tenor.googleapis.com/v2/posts',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'key': "AIzaSyBqhgip_UxUeGbgMDOy7sWUxbD_ZD97eqY",
        'media_filter': "gif",
        'ids': ids,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetSubmissionCountCall {
  static Future<ApiCallResponse> call({
    String? paramRoundId = '',
  }) {
    final body = '''
{
  "param_round_id": "${paramRoundId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get submission count',
      apiUrl:
          'https://ijprftsxdhbootmyiaaq.supabase.co/rest/v1/rpc/get_meme_submission_count',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlqcHJmdHN4ZGhib290bXlpYWFxIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQ1NDgxNzUsImV4cCI6MjAwMDEyNDE3NX0.p4tv_R7Co-MMFxpaXeeHdGGFB5Ekm79ei4AicOZEn1s',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetGameSessionWithIDCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get game session with ID',
      apiUrl: 'https://ijprftsxdhbootmyiaaq.supabase.co/rest/v1/game_sessions',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlqcHJmdHN4ZGhib290bXlpYWFxIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQ1NDgxNzUsImV4cCI6MjAwMDEyNDE3NX0.p4tv_R7Co-MMFxpaXeeHdGGFB5Ekm79ei4AicOZEn1s',
      },
      params: {
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetRatingsCountCall {
  static Future<ApiCallResponse> call({
    String? paramRoundId = '',
  }) {
    final body = '''
{
  "param_round_id": "${paramRoundId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get ratings count',
      apiUrl:
          'https://ijprftsxdhbootmyiaaq.supabase.co/rest/v1/rpc/get_ratings_count',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlqcHJmdHN4ZGhib290bXlpYWFxIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQ1NDgxNzUsImV4cCI6MjAwMDEyNDE3NX0.p4tv_R7Co-MMFxpaXeeHdGGFB5Ekm79ei4AicOZEn1s',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetWinnerCall {
  static Future<ApiCallResponse> call({
    String? paramRoundId = '',
  }) {
    final body = '''
{
  "param_round_id": "${paramRoundId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get winner',
      apiUrl: 'https://ijprftsxdhbootmyiaaq.supabase.co/rest/v1/rpc/get_winner',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlqcHJmdHN4ZGhib290bXlpYWFxIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQ1NDgxNzUsImV4cCI6MjAwMDEyNDE3NX0.p4tv_R7Co-MMFxpaXeeHdGGFB5Ekm79ei4AicOZEn1s',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetHappyPlayerCall {
  static Future<ApiCallResponse> call({
    String? paramRoundId = '',
  }) {
    final body = '''
{
  "param_round_id": "${paramRoundId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get happy player',
      apiUrl:
          'https://ijprftsxdhbootmyiaaq.supabase.co/rest/v1/rpc/get_happy_player',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlqcHJmdHN4ZGhib290bXlpYWFxIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQ1NDgxNzUsImV4cCI6MjAwMDEyNDE3NX0.p4tv_R7Co-MMFxpaXeeHdGGFB5Ekm79ei4AicOZEn1s',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetUnamusedPlayerCall {
  static Future<ApiCallResponse> call({
    String? paramRoundId = '',
  }) {
    final body = '''
{
  "param_round_id": "${paramRoundId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get unamused player',
      apiUrl:
          'https://ijprftsxdhbootmyiaaq.supabase.co/rest/v1/rpc/get_unimpressed_player',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlqcHJmdHN4ZGhib290bXlpYWFxIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQ1NDgxNzUsImV4cCI6MjAwMDEyNDE3NX0.p4tv_R7Co-MMFxpaXeeHdGGFB5Ekm79ei4AicOZEn1s',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
