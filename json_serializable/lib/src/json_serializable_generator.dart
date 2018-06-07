// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:analyzer/dart/element/element.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:source_gen/source_gen.dart';

import 'generator_helper.dart';
import 'type_helper.dart';
import 'type_helpers/convert_helper.dart';
import 'type_helpers/date_time_helper.dart';
import 'type_helpers/enum_helper.dart';
import 'type_helpers/iterable_helper.dart';
import 'type_helpers/json_helper.dart';
import 'type_helpers/map_helper.dart';
import 'type_helpers/uri_helper.dart';
import 'type_helpers/value_helper.dart';

Iterable<TypeHelper> allHelpersImpl(JsonSerializableGenerator generator) =>
    generator._allHelpers;

class JsonSerializableGenerator
    extends GeneratorForAnnotation<JsonSerializable> {
  static const _coreHelpers = const [
    const IterableHelper(),
    const MapHelper(),
    const EnumHelper(),
    const ValueHelper()
  ];

  static const _defaultHelpers = const [
    const JsonHelper(),
    const DateTimeHelper(),
    const UriHelper()
  ];

  final List<TypeHelper> _typeHelpers;

  Iterable<TypeHelper> get _allHelpers => const <TypeHelper>[
        const ConvertHelper()
      ].followedBy(_typeHelpers).followedBy(_coreHelpers);

  /// If `true`, wrappers are used to minimize the number of
  /// [Map] and [List] instances created during serialization.
  ///
  /// This will increase the code size, but it may improve runtime performance,
  /// especially for large object graphs.
  final bool useWrappers;

  /// If `true`, [Map] types are *not* assumed to be [Map<String, dynamic>]
  /// – which is the default type of [Map] instances return by JSON decode in
  /// `dart:convert`.
  ///
  /// This will increase the code size, but allows [Map] types returned
  /// from other sources, such as `package:yaml`.
  ///
  /// *Note: in many cases the key values are still assumed to be [String]*.
  final bool anyMap;

  /// If `true`, generated `fromJson` functions include extra checks to validate
  /// proper deserialization of types.
  ///
  /// If an exception is thrown during deserialization, a
  /// [CheckedFromJsonException] is thrown.
  final bool checked;

  /// If `true`, generated `toJson` methods will explicitly call `toJson` on
  /// nested objects.
  ///
  /// When using JSON encoding support in `dart:convert`, `toJson` is
  /// automatically called on objects, so the default behavior
  /// (`explicitToJson: false`) is to omit the `toJson` call.
  ///
  /// Example of `explicitToJson: false` (default)
  ///
  /// ```dart
  /// Map<String, dynamic> toJson() => {'child': child};
  /// ```
  ///
  /// Example of `explicitToJson: true`
  ///
  /// ```dart
  /// Map<String, dynamic> toJson() => {'child': child?.toJson()};
  /// ```
  final bool explicitToJson;

  /// Creates an instance of [JsonSerializableGenerator].
  ///
  /// If [typeHelpers] is not provided, three built-in helpers are used:
  /// [JsonHelper], [DateTimeHelper], and [UriHelper].
  const JsonSerializableGenerator({
    List<TypeHelper> typeHelpers,
    bool useWrappers: false,
    bool anyMap: false,
    bool checked: false,
    bool explicitToJson: false,
  })  : this.useWrappers = useWrappers ?? false,
        this.anyMap = anyMap ?? false,
        this.checked = checked ?? false,
        this.explicitToJson = explicitToJson ?? false,
        this._typeHelpers = typeHelpers ?? _defaultHelpers;

  /// Creates an instance of [JsonSerializableGenerator].
  ///
  /// [typeHelpers] provides a set of [TypeHelper] that will be used along with
  /// the built-in helpers:
  /// [JsonHelper], [DateTimeHelper], and [UriHelper].
  factory JsonSerializableGenerator.withDefaultHelpers(
          Iterable<TypeHelper> typeHelpers,
          {bool useWrappers: false,
          bool anyMap: false}) =>
      new JsonSerializableGenerator(
          useWrappers: useWrappers,
          anyMap: anyMap,
          typeHelpers:
              new List.unmodifiable(typeHelpers.followedBy(_defaultHelpers)));

  @override
  Future<String> generateForAnnotatedElement(
          Element element, ConstantReader annotation, _) =>
      generate(this, element, annotation);
}
