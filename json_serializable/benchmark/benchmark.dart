import 'dart:math';

import 'package:json/json.dart';

import '../example/example.dart';
import 'stats.dart';

final _rnd = new Random(0);

bool _customWriter(Object source, JsonWriter writer) {
  List items;
  if (source is Person) {
    items = _itemsForPerson(source);
  } else if (source is Order) {
    items = _itemsForOrder(source);
  }

  if (items != null) {
    _writeItems(items, writer);
    return true;
  }

  return false;
}

List<Object> _itemsForPerson(Person person) => [
      'firstName',
      person.firstName,
      'middleName',
      person.middleName,
      'lastName',
      person.lastName,
      'date-of-birth',
      person.dateOfBirth.toIso8601String(),
      'last-order',
      person.dateOfBirth.toIso8601String(),
      'orders',
      person.orders,
      'related-people',
      person.relatedPeople
    ];

List<Object> _itemsForOrder(Order order) => [
      'count',
      order.count,
      'itemNumber',
      order.itemNumber,
      'isRushed',
      order.isRushed
    ];

void _writeItems(List keyValueList, JsonWriter writer) {
  if (writer.isPretty) {
    writer.writeString('{\n');

    writer.increaseIndent();

    String separator = "";
    for (int i = 0; i < keyValueList.length; i += 2) {
      writer.writeString(separator);
      separator = ",\n";
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent(keyValueList[i] as String);
      writer.writeString('": ');
      writer.writeObject(keyValueList[i + 1]);
    }
    writer.writeString('\n');

    writer.decreaseIndent();

    writer.writeIndentation();
    writer.writeString('}');
  } else {
    writer.writeString('{');
    String separator = '"';
    for (int i = 0; i < keyValueList.length; i += 2) {
      writer.writeString(separator);
      separator = ',"';
      writer.writeStringContent(keyValueList[i] as String);
      writer.writeString('":');
      writer.writeObject(keyValueList[i + 1]);
    }
    writer.writeString('}');
  }
}

String _convert(Object input) =>
    const JsonEncoder(null, _customWriter).convert(input);

String _convertIndented(Object input) =>
    const JsonEncoder.withIndent(' ', _customWriter).convert(input);

Order _randomOrder(int width) => new Order()
  ..itemNumber = _rnd.nextInt(100)
  ..count = _rnd.nextInt(width)
  ..isRushed = _rnd.nextBool();

final _theDate = new DateTime(1979, 8, 16);

Person _randomPerson(int width, int depth) => new Person(
    'kevin', 'moore', _theDate,
    middleName: 'Robert',
    lastOrder: _theDate,
    orders: new List<Order>.generate(width, (i) => _randomOrder(100)))
  ..relatedPeople = (depth < 1)
      ? null
      : new Map<String, Person>.fromIterable(new Iterable.generate(width),
          key: (i) => i.toString(),
          value: (_) => _randomPerson(width, depth - 1));

final _data = _randomPerson(10, 2);

void main() {
  try {
    // print sample
    print(_convertIndented(_data));
  } on JsonUnsupportedObjectError catch (e) {
    dynamic thing = e;
    while (thing is JsonUnsupportedObjectError) {
      print([thing.cause, thing.unsupportedObject]);
      thing = thing.cause;
    }
    print([e.runtimeType, e]);

    rethrow;
  }
  print('');

  // dry run
  var stats =
      new Stats.fromData(new Iterable<int>.generate(1000, (i) => run()));
  print('dry run count: ${stats.count}');

  stats = new Stats.fromData(new Iterable<int>.generate(5000, (i) => run()));

  print(_convertIndented(stats));
  print(stats.standardDeviation / stats.mean);
}

int run() {
  try {
    var timer = new Stopwatch()..start();
    var json = _convert(_data);
    timer.stop();
    assert(json.isNotEmpty);
    return timer.elapsedMicroseconds;
  } on JsonUnsupportedObjectError catch (e) {
    dynamic thing = e;
    while (thing is JsonUnsupportedObjectError) {
      print([thing.cause, thing.unsupportedObject]);
      thing = thing.cause;
    }

    print(thing);

    rethrow;
  }
}
