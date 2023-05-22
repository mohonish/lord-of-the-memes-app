import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '/backend/supabase/supabase.dart';

List<String>? addPlayerToGame(
  List<String>? existingPlayersList,
  String currentPlayerId,
) {
  // add currentPlayerId to existingPlayersList list
  if (existingPlayersList == null) {
    return [currentPlayerId];
  } else {
    return [...existingPlayersList, currentPlayerId];
  }
}

List<String> convertStringToList(String? inputString) {
  // convert string in parameter to list
  if (inputString == null) {
    return [];
  } else {
    return [inputString];
  }
}

int? getListLength(List<String>? joinedPlayers) {
  // return length of joinedPlayers list parameter
  if (joinedPlayers == null) {
    return 0;
  } else {
    return joinedPlayers.length;
  }
}

int? getExpectedRatingsCount(int playersCount) {
  // return the product of the parameter playersCount and playersCount - 1
  return playersCount * (playersCount - 1);
}
