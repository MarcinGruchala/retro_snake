// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_board_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameBoardState {
  Snake get snake => throw _privateConstructorUsedError;
  Food get food => throw _privateConstructorUsedError;
  List<Portal> get portals => throw _privateConstructorUsedError;
  GameSession get gameSession => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameBoardStateCopyWith<GameBoardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameBoardStateCopyWith<$Res> {
  factory $GameBoardStateCopyWith(
          GameBoardState value, $Res Function(GameBoardState) then) =
      _$GameBoardStateCopyWithImpl<$Res, GameBoardState>;
  @useResult
  $Res call(
      {Snake snake, Food food, List<Portal> portals, GameSession gameSession});
}

/// @nodoc
class _$GameBoardStateCopyWithImpl<$Res, $Val extends GameBoardState>
    implements $GameBoardStateCopyWith<$Res> {
  _$GameBoardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? snake = null,
    Object? food = null,
    Object? portals = null,
    Object? gameSession = null,
  }) {
    return _then(_value.copyWith(
      snake: null == snake
          ? _value.snake
          : snake // ignore: cast_nullable_to_non_nullable
              as Snake,
      food: null == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as Food,
      portals: null == portals
          ? _value.portals
          : portals // ignore: cast_nullable_to_non_nullable
              as List<Portal>,
      gameSession: null == gameSession
          ? _value.gameSession
          : gameSession // ignore: cast_nullable_to_non_nullable
              as GameSession,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameBoardStateImplCopyWith<$Res>
    implements $GameBoardStateCopyWith<$Res> {
  factory _$$GameBoardStateImplCopyWith(_$GameBoardStateImpl value,
          $Res Function(_$GameBoardStateImpl) then) =
      __$$GameBoardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Snake snake, Food food, List<Portal> portals, GameSession gameSession});
}

/// @nodoc
class __$$GameBoardStateImplCopyWithImpl<$Res>
    extends _$GameBoardStateCopyWithImpl<$Res, _$GameBoardStateImpl>
    implements _$$GameBoardStateImplCopyWith<$Res> {
  __$$GameBoardStateImplCopyWithImpl(
      _$GameBoardStateImpl _value, $Res Function(_$GameBoardStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? snake = null,
    Object? food = null,
    Object? portals = null,
    Object? gameSession = null,
  }) {
    return _then(_$GameBoardStateImpl(
      snake: null == snake
          ? _value.snake
          : snake // ignore: cast_nullable_to_non_nullable
              as Snake,
      food: null == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as Food,
      portals: null == portals
          ? _value._portals
          : portals // ignore: cast_nullable_to_non_nullable
              as List<Portal>,
      gameSession: null == gameSession
          ? _value.gameSession
          : gameSession // ignore: cast_nullable_to_non_nullable
              as GameSession,
    ));
  }
}

/// @nodoc

class _$GameBoardStateImpl
    with DiagnosticableTreeMixin
    implements _GameBoardState {
  const _$GameBoardStateImpl(
      {required this.snake,
      required this.food,
      required final List<Portal> portals,
      required this.gameSession})
      : _portals = portals;

  @override
  final Snake snake;
  @override
  final Food food;
  final List<Portal> _portals;
  @override
  List<Portal> get portals {
    if (_portals is EqualUnmodifiableListView) return _portals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_portals);
  }

  @override
  final GameSession gameSession;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GameBoardState(snake: $snake, food: $food, portals: $portals, gameSession: $gameSession)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GameBoardState'))
      ..add(DiagnosticsProperty('snake', snake))
      ..add(DiagnosticsProperty('food', food))
      ..add(DiagnosticsProperty('portals', portals))
      ..add(DiagnosticsProperty('gameSession', gameSession));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameBoardStateImpl &&
            (identical(other.snake, snake) || other.snake == snake) &&
            (identical(other.food, food) || other.food == food) &&
            const DeepCollectionEquality().equals(other._portals, _portals) &&
            (identical(other.gameSession, gameSession) ||
                other.gameSession == gameSession));
  }

  @override
  int get hashCode => Object.hash(runtimeType, snake, food,
      const DeepCollectionEquality().hash(_portals), gameSession);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GameBoardStateImplCopyWith<_$GameBoardStateImpl> get copyWith =>
      __$$GameBoardStateImplCopyWithImpl<_$GameBoardStateImpl>(
          this, _$identity);
}

abstract class _GameBoardState implements GameBoardState {
  const factory _GameBoardState(
      {required final Snake snake,
      required final Food food,
      required final List<Portal> portals,
      required final GameSession gameSession}) = _$GameBoardStateImpl;

  @override
  Snake get snake;
  @override
  Food get food;
  @override
  List<Portal> get portals;
  @override
  GameSession get gameSession;
  @override
  @JsonKey(ignore: true)
  _$$GameBoardStateImplCopyWith<_$GameBoardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
