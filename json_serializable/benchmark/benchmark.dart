import 'dart:convert';
import 'dart:io';
import 'dart:math';

import '../example/example.dart';
import 'stats.dart';

final _rnd = new Random();

Order _randomOrder() => new Order()
  ..itemNumber = _rnd.nextInt(100)
  ..count = _rnd.nextInt(100)
  ..isRushed = _rnd.nextBool();

final _data = new Person('kevin', 'moore', new DateTime.now(),
    middleName: 'Robert',
    lastOrder: new DateTime.now(),
    orders: new List<Order>.generate(100, (i) => _randomOrder()));

void main() {
  for (var i = 10; i < 100000; i*=10) {
    var items = new List<int>.generate(i, (i) => run());

    var file = new File('data_$i.txt');
    file.writeAsStringSync(items.join('\n'));
  }
}

int run() {
  var timer = new Stopwatch();

  String json;
  Person data;
  try {
    timer.start();
    json = JSON.encode(_data);
    data = new Person.fromJson(JSON.decode(json) as Map<String, dynamic>);
    return timer.elapsedMicroseconds;
  } on JsonUnsupportedObjectError catch (e) {
    dynamic thing = e;
    while (thing is JsonUnsupportedObjectError) {
      print([thing.cause, thing.unsupportedObject]);
      thing = thing.cause;
    }

    print(thing);

    rethrow;
  } finally {
    assert(json == null || JSON.encode(data) == json);
  }
}
