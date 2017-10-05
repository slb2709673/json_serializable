// GENERATED CODE - DO NOT MODIFY BY HAND

part of json_serializable.test.bathtub;

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Bathtub _$BathtubFromJson(Map<String, dynamic> json) => new Bathtub(
    iterable: json['iterable'] as List,
    dynamicIterable: json['dynamicIterable'] as List,
    objectIterable: json['objectIterable'] as List,
    intIterable: (json['intIterable'] as List).map((e) => e as int),
    dateTimeIterable: (json['datetime-iterable'] as List)
        .map((e) => DateTime.parse(e as String)))
  ..dateTime = DateTime.parse(json['dateTime'] as String)
  ..list = json['list'] as List
  ..dynamicList = json['dynamicList'] as List
  ..objectList = json['objectList'] as List
  ..intList = (json['intList'] as List).map((e) => e as int).toList()
  ..dateTimeList = (json['dateTimeList'] as List)
      .map((e) => DateTime.parse(e as String))
      .toList()
  ..map = json['map'] as Map<String, dynamic>
  ..stringStringMap =
      new Map<String, String>.from(json['stringStringMap'] as Map)
  ..stringIntMap = new Map<String, int>.from(json['stringIntMap'] as Map)
  ..stringDateTimeMap = new Map<String, DateTime>.fromIterables(
      (json['stringDateTimeMap'] as Map<String, dynamic>).keys,
      (json['stringDateTimeMap'] as Map)
          .values
          .map((e) => DateTime.parse(e as String)))
  ..crazyComplex = (json['crazyComplex'] as List)
      .map((e) => new Map<String, Map<String, List<List<DateTime>>>>.fromIterables(
          (e as Map<String, dynamic>).keys,
          (e as Map).values.map((e) =>
              new Map<String, List<List<DateTime>>>.fromIterables((e as Map<String, dynamic>).keys, (e as Map).values.map((e) => (e as List).map((e) => (e as List).map((e) => DateTime.parse(e as String)).toList()).toList())))))
      .toList()
  ..val = new Map<String, bool>.from(json['val'] as Map)
  ..writeNotNull = json['writeNotNull'] as bool
  ..string = json[r'$string'] as String;

abstract class _$BathtubSerializerMixin implements JsonWriteMySelf {
  DateTime get dateTime;
  Iterable<dynamic> get iterable;
  Iterable<dynamic> get dynamicIterable;
  Iterable<Object> get objectIterable;
  Iterable<int> get intIterable;
  Iterable<DateTime> get dateTimeIterable;
  List<dynamic> get list;
  List<dynamic> get dynamicList;
  List<Object> get objectList;
  List<int> get intList;
  List<DateTime> get dateTimeList;
  Map<dynamic, dynamic> get map;
  Map<String, String> get stringStringMap;
  Map<String, int> get stringIntMap;
  Map<String, DateTime> get stringDateTimeMap;
  List<Map<String, Map<String, List<List<DateTime>>>>> get crazyComplex;
  Map<String, bool> get val;
  bool get writeNotNull;
  String get string;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'dateTime': dateTime.toIso8601String(),
      'iterable': iterable.toList(),
      'dynamicIterable': dynamicIterable.toList(),
      'objectIterable': objectIterable.toList(),
      'intIterable': intIterable.toList(),
      'datetime-iterable':
          dateTimeIterable.map((e) => e.toIso8601String()).toList(),
      'list': list,
      'dynamicList': dynamicList,
      'objectList': objectList,
      'intList': intList,
      'dateTimeList': dateTimeList.map((e) => e.toIso8601String()).toList(),
      'map': map,
      'stringStringMap': stringStringMap,
      'stringIntMap': stringIntMap,
      'stringDateTimeMap': new Map<String, dynamic>.fromIterables(
          stringDateTimeMap.keys,
          stringDateTimeMap.values.map((e) => e.toIso8601String())),
      'crazyComplex': crazyComplex
          .map((e) => new Map<String, dynamic>.fromIterables(
              e.keys,
              e.values.map((e) => new Map<String, dynamic>.fromIterables(
                  e.keys,
                  e.values.map((e) => e
                      .map((e) => e.map((e) => e.toIso8601String()).toList())
                      .toList())))))
          .toList(),
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('val', this.val);
    val['writeNotNull'] = this.writeNotNull;
    val[r'$string'] = string;
    return val;
  }

  @override
  bool writeJson(JsonWriter writer) {
    if (writer.isPretty) {
      writer.writeString('{\n');

      writer.increaseIndent();

      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('dateTime');
      writer.writeString('": ');
      writer.writeObject(dateTime.toIso8601String());

      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('iterable');
      writer.writeString('": ');
      writer.writeObject(iterable.toList());

      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('dynamicIterable');
      writer.writeString('": ');
      writer.writeObject(dynamicIterable.toList());

      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('objectIterable');
      writer.writeString('": ');
      writer.writeObject(objectIterable.toList());

      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('intIterable');
      writer.writeString('": ');
      writer.writeObject(intIterable.toList());

      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('datetime-iterable');
      writer.writeString('": ');
      writer.writeObject(
          dateTimeIterable.map((e) => e.toIso8601String()).toList());

      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('list');
      writer.writeString('": ');
      writer.writeObject(list);

      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('dynamicList');
      writer.writeString('": ');
      writer.writeObject(dynamicList);

      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('objectList');
      writer.writeString('": ');
      writer.writeObject(objectList);

      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('intList');
      writer.writeString('": ');
      writer.writeObject(intList);

      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('dateTimeList');
      writer.writeString('": ');
      writer.writeObject(dateTimeList.map((e) => e.toIso8601String()).toList());

      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('map');
      writer.writeString('": ');
      writer.writeObject(map);

      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('stringStringMap');
      writer.writeString('": ');
      writer.writeObject(stringStringMap);

      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('stringIntMap');
      writer.writeString('": ');
      writer.writeObject(stringIntMap);

      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('stringDateTimeMap');
      writer.writeString('": ');
      writer.writeObject(new Map<String, dynamic>.fromIterables(
          stringDateTimeMap.keys,
          stringDateTimeMap.values.map((e) => e.toIso8601String())));

      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('crazyComplex');
      writer.writeString('": ');
      writer.writeObject(crazyComplex
          .map((e) => new Map<String, dynamic>.fromIterables(
              e.keys,
              e.values.map((e) => new Map<String, dynamic>.fromIterables(
                  e.keys,
                  e.values.map((e) => e
                      .map((e) => e.map((e) => e.toIso8601String()).toList())
                      .toList())))))
          .toList());

      if (val != null) {
        writer.writeString(',\n');
        writer.writeIndentation();
        writer.writeString('"');
        writer.writeStringContent('val');
        writer.writeString('": ');
        writer.writeObject(val);
      }
      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('writeNotNull');
      writer.writeString('": ');
      writer.writeObject(writeNotNull);

      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent(r'$string');
      writer.writeString('": ');
      writer.writeObject(string);

      writer.writeString('\n');

      writer.decreaseIndent();

      writer.writeIndentation();
    } else {
      writer.writeString('{');
      writer.writeStringContent('dateTime');
      writer.writeString('":');
      writer.writeObject(dateTime.toIso8601String());
      writer.writeString(',"');
      writer.writeStringContent('iterable');
      writer.writeString('":');
      writer.writeObject(iterable.toList());
      writer.writeString(',"');
      writer.writeStringContent('dynamicIterable');
      writer.writeString('":');
      writer.writeObject(dynamicIterable.toList());
      writer.writeString(',"');
      writer.writeStringContent('objectIterable');
      writer.writeString('":');
      writer.writeObject(objectIterable.toList());
      writer.writeString(',"');
      writer.writeStringContent('intIterable');
      writer.writeString('":');
      writer.writeObject(intIterable.toList());
      writer.writeString(',"');
      writer.writeStringContent('datetime-iterable');
      writer.writeString('":');
      writer.writeObject(
          dateTimeIterable.map((e) => e.toIso8601String()).toList());
      writer.writeString(',"');
      writer.writeStringContent('list');
      writer.writeString('":');
      writer.writeObject(list);
      writer.writeString(',"');
      writer.writeStringContent('dynamicList');
      writer.writeString('":');
      writer.writeObject(dynamicList);
      writer.writeString(',"');
      writer.writeStringContent('objectList');
      writer.writeString('":');
      writer.writeObject(objectList);
      writer.writeString(',"');
      writer.writeStringContent('intList');
      writer.writeString('":');
      writer.writeObject(intList);
      writer.writeString(',"');
      writer.writeStringContent('dateTimeList');
      writer.writeString('":');
      writer.writeObject(dateTimeList.map((e) => e.toIso8601String()).toList());
      writer.writeString(',"');
      writer.writeStringContent('map');
      writer.writeString('":');
      writer.writeObject(map);
      writer.writeString(',"');
      writer.writeStringContent('stringStringMap');
      writer.writeString('":');
      writer.writeObject(stringStringMap);
      writer.writeString(',"');
      writer.writeStringContent('stringIntMap');
      writer.writeString('":');
      writer.writeObject(stringIntMap);
      writer.writeString(',"');
      writer.writeStringContent('stringDateTimeMap');
      writer.writeString('":');
      writer.writeObject(new Map<String, dynamic>.fromIterables(
          stringDateTimeMap.keys,
          stringDateTimeMap.values.map((e) => e.toIso8601String())));
      writer.writeString(',"');
      writer.writeStringContent('crazyComplex');
      writer.writeString('":');
      writer.writeObject(crazyComplex
          .map((e) => new Map<String, dynamic>.fromIterables(
              e.keys,
              e.values.map((e) => new Map<String, dynamic>.fromIterables(
                  e.keys,
                  e.values.map((e) => e
                      .map((e) => e.map((e) => e.toIso8601String()).toList())
                      .toList())))))
          .toList());
      if (val != null) {
        writer.writeString(',"');
        writer.writeStringContent('val');
        writer.writeString('":');
        writer.writeObject(val);
      }
      writer.writeString(',"');
      writer.writeStringContent('writeNotNull');
      writer.writeString('":');
      writer.writeObject(writeNotNull);
      writer.writeString(',"');
      writer.writeStringContent(r'$string');
      writer.writeString('":');
      writer.writeObject(string);
    }
    writer.writeString('}');

    return true;
  }
}
