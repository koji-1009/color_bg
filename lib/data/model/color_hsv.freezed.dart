// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'color_hsv.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ColorHSVTearOff {
  const _$ColorHSVTearOff();

// ignore: unused_element
  _ColorHSV call({double h, double s, double v}) {
    return _ColorHSV(
      h: h,
      s: s,
      v: v,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ColorHSV = _$ColorHSVTearOff();

/// @nodoc
mixin _$ColorHSV {
  double get h;

  double get s;

  double get v;

  $ColorHSVCopyWith<ColorHSV> get copyWith;
}

/// @nodoc
abstract class $ColorHSVCopyWith<$Res> {
  factory $ColorHSVCopyWith(ColorHSV value, $Res Function(ColorHSV) then) =
      _$ColorHSVCopyWithImpl<$Res>;

  $Res call({double h, double s, double v});
}

/// @nodoc
class _$ColorHSVCopyWithImpl<$Res> implements $ColorHSVCopyWith<$Res> {
  _$ColorHSVCopyWithImpl(this._value, this._then);

  final ColorHSV _value;

  // ignore: unused_field
  final $Res Function(ColorHSV) _then;

  @override
  $Res call({
    Object h = freezed,
    Object s = freezed,
    Object v = freezed,
  }) {
    return _then(_value.copyWith(
      h: h == freezed ? _value.h : h as double,
      s: s == freezed ? _value.s : s as double,
      v: v == freezed ? _value.v : v as double,
    ));
  }
}

/// @nodoc
abstract class _$ColorHSVCopyWith<$Res> implements $ColorHSVCopyWith<$Res> {
  factory _$ColorHSVCopyWith(_ColorHSV value, $Res Function(_ColorHSV) then) =
      __$ColorHSVCopyWithImpl<$Res>;

  @override
  $Res call({double h, double s, double v});
}

/// @nodoc
class __$ColorHSVCopyWithImpl<$Res> extends _$ColorHSVCopyWithImpl<$Res>
    implements _$ColorHSVCopyWith<$Res> {
  __$ColorHSVCopyWithImpl(_ColorHSV _value, $Res Function(_ColorHSV) _then)
      : super(_value, (v) => _then(v as _ColorHSV));

  @override
  _ColorHSV get _value => super._value as _ColorHSV;

  @override
  $Res call({
    Object h = freezed,
    Object s = freezed,
    Object v = freezed,
  }) {
    return _then(_ColorHSV(
      h: h == freezed ? _value.h : h as double,
      s: s == freezed ? _value.s : s as double,
      v: v == freezed ? _value.v : v as double,
    ));
  }
}

/// @nodoc
class _$_ColorHSV implements _ColorHSV {
  _$_ColorHSV({this.h, this.s, this.v});

  @override
  final double h;
  @override
  final double s;
  @override
  final double v;

  @override
  String toString() {
    return 'ColorHSV(h: $h, s: $s, v: $v)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ColorHSV &&
            (identical(other.h, h) ||
                const DeepCollectionEquality().equals(other.h, h)) &&
            (identical(other.s, s) ||
                const DeepCollectionEquality().equals(other.s, s)) &&
            (identical(other.v, v) ||
                const DeepCollectionEquality().equals(other.v, v)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(h) ^
      const DeepCollectionEquality().hash(s) ^
      const DeepCollectionEquality().hash(v);

  @override
  _$ColorHSVCopyWith<_ColorHSV> get copyWith =>
      __$ColorHSVCopyWithImpl<_ColorHSV>(this, _$identity);
}

abstract class _ColorHSV implements ColorHSV {
  factory _ColorHSV({double h, double s, double v}) = _$_ColorHSV;

  @override
  double get h;

  @override
  double get s;

  @override
  double get v;

  @override
  _$ColorHSVCopyWith<_ColorHSV> get copyWith;
}
