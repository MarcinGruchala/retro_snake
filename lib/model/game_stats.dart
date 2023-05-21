import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class GameStats extends Equatable {
  final int gamesPlayed;
  final int recordOverall;

  const GameStats({
    required this.gamesPlayed,
    required this.recordOverall,
  });

  @override
  List<Object?> get props => [];
}
