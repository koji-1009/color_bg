// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'color_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ColorValueTearOff {
  const _$ColorValueTearOff();

// ignore: unused_element
  _ColorValue call({int r, int g, int b}) {
    return _ColorValue(
      r: r,
      g: g,
      b: b,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ColorValue = _$ColorValueTearOff();

/// @nodoc
mixin _$ColorValue {
  int get r;
  int get g;
  int get b;

  $ColorValueCopyWith<ColorValue> get copyWith;
}

/// @nodoc
abstract class $ColorValueCopyWith<$Res> {
  factory $ColorValueCopyWith(
          ColorValue value, $Res Function(ColorValue) then) =
      _$ColorValueCopyWithImpl<$Res>;
  $Res call({int r, int g, int b});
}

/// @nodoc
class _$ColorValueCopyWithImpl<$Res> implements $ColorValueCopyWith<$Res> {
  _$ColorValueCopyWithImpl(this._value, this._then);

  final ColorValue _value;
  // ignore: unused_field
  final $Res Function(ColorValue) _then;

  @override
  $Res call({
    Object r = freezed,
    Object g = freezed,
    Object b = freezed,
  }) {
    return _then(_value.copyWith(
      r: r == freezed ? _value.r : r as int,
      g: g == freezed ? _value.g : g as int,
      b: b == freezed ? _value.b : b as int,
    ));
  }
}

/// @nodoc
abstract class _$ColorValueCopyWith<$Res> implements $ColorValueCopyWith<$Res> {
  factory _$ColorValueCopyWith(
          _ColorValue value, $Res Function(_ColorValue) then) =
      __$ColorValueCopyWithImpl<$Res>;
  @override
  $Res call({int r, int g, int b});
}

/// @nodoc
class __$ColorValueCopyWithImpl<$Res> extends _$ColorValueCopyWithImpl<$Res>
    implements _$ColorValueCopyWith<$Res> {
  __$ColorValueCopyWithImpl(
      _ColorValue _value, $Res Function(_ColorValue) _then)
      : super(_value, (v) => _then(v as _ColorValue));

  @override
  _ColorValue get _value => super._value as _ColorValue;

  @override
  $Res call({
    Object r = freezed,
    Object g = freezed,
    Object b = freezed,
  }) {
    return _then(_ColorValue(
      r: r == freezed ? _value.r : r as int,
      g: g == freezed ? _value.g : g as int,
      b: b == freezed ? _value.b : b as int,
    ));
  }
}

/// @nodoc
class _$_ColorValue implements _ColorValue {
  _$_ColorValue({this.r, this.g, this.b});

  @override
  final int r;
  @override
  final int g;
  @override
  final int b;

  @override
  String toString() {
    return 'ColorValue(r: $r, g: $g, b: $b)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ColorValue &&
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

  @override
  _$ColorValueCopyWith<_ColorValue> get copyWith =>
      __$ColorValueCopyWithImpl<_ColorValue>(this, _$identity);
}

abstract class _ColorValue implements ColorValue {
  factory _ColorValue({int r, int g, int b}) = _$_ColorValue;

  @override
  int get r;
  @override
  int get g;
  @override
  int get b;
  @override
  _$ColorValueCopyWith<_ColorValue> get copyWith;
}
