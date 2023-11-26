// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Portal {
  CellPosition get positionOne => throw _privateConstructorUsedError;
  CellPosition get positionTwo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PortalCopyWith<Portal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortalCopyWith<$Res> {
  factory $PortalCopyWith(Portal value, $Res Function(Portal) then) =
      _$PortalCopyWithImpl<$Res, Portal>;
  @useResult
  $Res call({CellPosition positionOne, CellPosition positionTwo});
}

/// @nodoc
class _$PortalCopyWithImpl<$Res, $Val extends Portal>
    implements $PortalCopyWith<$Res> {
  _$PortalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? positionOne = null,
    Object? positionTwo = null,
  }) {
    return _then(_value.copyWith(
      positionOne: null == positionOne
          ? _value.positionOne
          : positionOne // ignore: cast_nullable_to_non_nullable
              as CellPosition,
      positionTwo: null == positionTwo
          ? _value.positionTwo
          : positionTwo // ignore: cast_nullable_to_non_nullable
              as CellPosition,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PortalImplCopyWith<$Res> implements $PortalCopyWith<$Res> {
  factory _$$PortalImplCopyWith(
          _$PortalImpl value, $Res Function(_$PortalImpl) then) =
      __$$PortalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({CellPosition positionOne, CellPosition positionTwo});
}

/// @nodoc
class __$$PortalImplCopyWithImpl<$Res>
    extends _$PortalCopyWithImpl<$Res, _$PortalImpl>
    implements _$$PortalImplCopyWith<$Res> {
  __$$PortalImplCopyWithImpl(
      _$PortalImpl _value, $Res Function(_$PortalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? positionOne = null,
    Object? positionTwo = null,
  }) {
    return _then(_$PortalImpl(
      positionOne: null == positionOne
          ? _value.positionOne
          : positionOne // ignore: cast_nullable_to_non_nullable
              as CellPosition,
      positionTwo: null == positionTwo
          ? _value.positionTwo
          : positionTwo // ignore: cast_nullable_to_non_nullable
              as CellPosition,
    ));
  }
}

/// @nodoc

class _$PortalImpl implements _Portal {
  const _$PortalImpl({required this.positionOne, required this.positionTwo});

  @override
  final CellPosition positionOne;
  @override
  final CellPosition positionTwo;

  @override
  String toString() {
    return 'Portal(positionOne: $positionOne, positionTwo: $positionTwo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PortalImpl &&
            (identical(other.positionOne, positionOne) ||
                other.positionOne == positionOne) &&
            (identical(other.positionTwo, positionTwo) ||
                other.positionTwo == positionTwo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, positionOne, positionTwo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PortalImplCopyWith<_$PortalImpl> get copyWith =>
      __$$PortalImplCopyWithImpl<_$PortalImpl>(this, _$identity);
}

abstract class _Portal implements Portal {
  const factory _Portal(
      {required final CellPosition positionOne,
      required final CellPosition positionTwo}) = _$PortalImpl;

  @override
  CellPosition get positionOne;
  @override
  CellPosition get positionTwo;
  @override
  @JsonKey(ignore: true)
  _$$PortalImplCopyWith<_$PortalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
