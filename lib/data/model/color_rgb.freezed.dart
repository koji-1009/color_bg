// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'color_rgb.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ColorRGBTearOff {
  const _$ColorRGBTearOff();

  _ColorRGB call({required int r, required int g, required int b}) {
    return _ColorRGB(
      r: r,
      g: g,
      b: b,
    );
  }
}

/// @nodoc
const $ColorRGB = _$ColorRGBTearOff();

/// @nodoc
mixin _$ColorRGB {
  int get r => throw _privateConstructorUsedError;
  int get g => throw _privateConstructorUsedError;
  int get b => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ColorRGBCopyWith<ColorRGB> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorRGBCopyWith<$Res> {
  factory $ColorRGBCopyWith(ColorRGB value, $Res Function(ColorRGB) then) =
      _$ColorRGBCopyWithImpl<$Res>;
  $Res call({int r, int g, int b});
}

/// @nodoc
class _$ColorRGBCopyWithImpl<$Res> implements $ColorRGBCopyWith<$Res> {
  _$ColorRGBCopyWithImpl(this._value, this._then);

  final ColorRGB _value;
  // ignore: unused_field
  final $Res Function(ColorRGB) _then;

  @override
  $Res call({
    Object? r = freezed,
    Object? g = freezed,
    Object? b = freezed,
  }) {
    return _then(_value.copyWith(
      r: r == freezed
          ? _value.r
          : r // ignore: cast_nullable_to_non_nullable
              as int,
      g: g == freezed
          ? _value.g
          : g // ignore: cast_nullable_to_non_nullable
              as int,
      b: b == freezed
          ? _value.b
          : b // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$ColorRGBCopyWith<$Res> implements $ColorRGBCopyWith<$Res> {
  factory _$ColorRGBCopyWith(_ColorRGB value, $Res Function(_ColorRGB) then) =
      __$ColorRGBCopyWithImpl<$Res>;
  @override
  $Res call({int r, int g, int b});
}

/// @nodoc
class __$ColorRGBCopyWithImpl<$Res> extends _$ColorRGBCopyWithImpl<$Res>
    implements _$ColorRGBCopyWith<$Res> {
  __$ColorRGBCopyWithImpl(_ColorRGB _value, $Res Function(_ColorRGB) _then)
      : super(_value, (v) => _then(v as _ColorRGB));

  @override
  _ColorRGB get _value => super._value as _ColorRGB;

  @override
  $Res call({
    Object? r = freezed,
    Object? g = freezed,
    Object? b = freezed,
  }) {
    return _then(_ColorRGB(
      r: r == freezed
          ? _value.r
          : r // ignore: cast_nullable_to_non_nullable
              as int,
      g: g == freezed
          ? _value.g
          : g // ignore: cast_nullable_to_non_nullable
              as int,
      b: b == freezed
          ? _value.b
          : b // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ColorRGB with DiagnosticableTreeMixin implements _ColorRGB {
  _$_ColorRGB({required this.r, required this.g, required this.b});

  @override
  final int r;
  @override
  final int g;
  @override
  final int b;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ColorRGB(r: $r, g: $g, b: $b)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ColorRGB'))
      ..add(DiagnosticsProperty('r', r))
      ..add(DiagnosticsProperty('g', g))
      ..add(DiagnosticsProperty('b', b));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ColorRGB &&
            (identical(other.r, r) ||
                const DeepCollectionEquality().equals(other.r, r)) &&
            (identical(other.g, g) ||
                const DeepCollectionEquality().equals(other.g, g)) &&
            (identical(other.b, b) ||
                const DeepCollectionEquality().equals(other.b, b)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(r) ^
      const DeepCollectionEquality().hash(g) ^
      const DeepCollectionEquality().hash(b);

  @JsonKey(ignore: true)
  @override
  _$ColorRGBCopyWith<_ColorRGB> get copyWith =>
      __$ColorRGBCopyWithImpl<_ColorRGB>(this, _$identity);
}

abstract class _ColorRGB implements ColorRGB {
  factory _ColorRGB({required int r, required int g, required int b}) =
      _$_ColorRGB;

  @override
  int get r => throw _privateConstructorUsedError;
  @override
  int get g => throw _privateConstructorUsedError;
  @override
  int get b => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ColorRGBCopyWith<_ColorRGB> get copyWith =>
      throw _privateConstructorUsedError;
}
