// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// **DEPRECATED** Helper function used in generated code when
/// `JsonSerializable.disallowUnrecognizedKeys` is `true`.
///
/// Should not be used directly.
@Deprecated('Code generated with the latest `json_serializable` will use '
    '`\$checkKeys` instead. This function will be removed in the next major '
    'release.')
void $checkAllowedKeys(Map map, Iterable<String> allowedKeys) {
  $checkKeys(map, allowedKeys: allowedKeys?.toList());
}

/// Helper function used in generated `fromJson` code when
/// `JsonSerializable.disallowUnrecognizedKeys` is true for an annotated type or
/// `JsonKey.required` is `true` for any annotated fields.
///
/// Should not be used directly.
void $checkKeys(Map map,
    {List<String> allowedKeys,
    List<String> requiredKeys,
    List<String> disallowNullValues}) {
  if (map != null && allowedKeys != null) {
    var invalidKeys =
        map.keys.cast<String>().where((k) => !allowedKeys.contains(k)).toList();
    if (invalidKeys.isNotEmpty) {
      throw new UnrecognizedKeysException(invalidKeys, map, allowedKeys);
    }
  }

  if (requiredKeys != null) {
    var missingKeys = requiredKeys.where((k) => !map.keys.contains(k)).toList();
    if (missingKeys.isNotEmpty) {
      throw new MissingRequiredKeysException(missingKeys, map);
    }
  }

  if (map != null && disallowNullValues != null) {
    var nullValuedKeys = map.entries
        .where((entry) =>
            disallowNullValues.contains(entry.key) && entry.value == null)
        .map((entry) => entry.key as String)
        .toList();

    if (nullValuedKeys.isNotEmpty) {
      throw new DisallowedNullValueException(nullValuedKeys, map);
    }
  }
}

/// A base class for exceptions thrown when decoding JSON.
abstract class BadKeyException implements Exception {
  BadKeyException._(this.map);

  /// The source [Map] that the unrecognized keys were found in.
  final Map map;

  /// A human-readable message corresponding to the error.
  String get message;
}

/// Exception thrown if there are unrecognized keys in a JSON map that was
/// provided during deserialization.
class UnrecognizedKeysException extends BadKeyException {
  /// The allowed keys for [map].
  final List<String> allowedKeys;

  /// The keys from [map] that were unrecognized.
  final List<String> unrecognizedKeys;

  @override
  String get message =>
      'Unrecognized keys: [${unrecognizedKeys.join(', ')}]; supported keys: '
      '[${allowedKeys.join(', ')}]';

  UnrecognizedKeysException(this.unrecognizedKeys, Map map, this.allowedKeys)
      : super._(map);
}

/// Exception thrown if there are missing required keys in a JSON map that was
/// provided during deserialization.
class MissingRequiredKeysException extends BadKeyException {
  /// The keys that [map] is missing.
  final List<String> missingKeys;

  @override
  String get message => 'Required keys are missing: ${missingKeys.join(', ')}.';

  MissingRequiredKeysException(this.missingKeys, Map map)
      : assert(missingKeys.isNotEmpty),
        super._(map);
}

/// Exception thrown if there are keys with disallowed `null` values in a JSON
/// map that was provided during deserialization.
class DisallowedNullValueException extends BadKeyException {
  final List<String> keysWithNullValues;

  DisallowedNullValueException(this.keysWithNullValues, Map map) : super._(map);

  @override
  String get message => 'These keys had `null` values, '
      'which is not allowed: $keysWithNullValues';
}
