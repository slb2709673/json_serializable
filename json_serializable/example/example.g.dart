// GENERATED CODE - DO NOT MODIFY BY HAND

part of json_serializable.example;

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => new Person(
    json['firstName'] as String,
    json['lastName'] as String,
    DateTime.parse(json['date-of-birth'] as String),
    middleName: json['middleName'] as String,
    lastOrder: json['last-order'] == null
        ? null
        : DateTime.parse(json['last-order'] as String),
    orders: (json['orders'] as List)
        .map((e) => new Order.fromJson(e as Map<String, dynamic>))
        .toList())
  ..relatedPeople = json['related-people'] == null
      ? null
      : new Map<String, Person>.fromIterables(
          (json['related-people'] as Map<String, dynamic>).keys,
          (json['related-people'] as Map).values.map((e) => e == null
              ? null
              : new Person.fromJson(e as Map<String, dynamic>)));

abstract class _$PersonSerializerMixin implements JsonWriteMySelf {
  String get firstName;
  String get middleName;
  String get lastName;
  DateTime get dateOfBirth;
  DateTime get lastOrder;
  List<Order> get orders;
  Map<String, Person> get relatedPeople;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{
      'firstName': firstName,
    };

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('middleName', middleName);
    val['lastName'] = lastName;
    val['date-of-birth'] = dateOfBirth.toIso8601String();
    val['last-order'] = lastOrder?.toIso8601String();
    val['orders'] = orders;
    val['related-people'] = relatedPeople;
    return val;
  }

  @override
  bool writeJson(JsonWriter writer) {
    if (writer.isPretty) {
      writer.writeString('{\n');

      writer.increaseIndent();

      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('firstName');
      writer.writeString('": ');
      writer.writeObject(firstName);

      if (middleName != null) {
        writer.writeString(',\n');
        writer.writeIndentation();
        writer.writeString('"');
        writer.writeStringContent('middleName');
        writer.writeString('": ');
        writer.writeObject(middleName);
      }
      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('lastName');
      writer.writeString('": ');
      writer.writeObject(lastName);

      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('date-of-birth');
      writer.writeString('": ');
      writer.writeObject(dateOfBirth.toIso8601String());

      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('last-order');
      writer.writeString('": ');
      writer.writeObject(lastOrder?.toIso8601String());

      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('orders');
      writer.writeString('": ');
      writer.writeObject(orders);

      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('related-people');
      writer.writeString('": ');
      writer.writeObject(relatedPeople);

      writer.writeString('\n');

      writer.decreaseIndent();

      writer.writeIndentation();
    } else {
      writer.writeString('{');
      writer.writeStringContent('firstName');
      writer.writeString('":');
      writer.writeObject(firstName);
      if (middleName != null) {
        writer.writeString(',"');
        writer.writeStringContent('middleName');
        writer.writeString('":');
        writer.writeObject(middleName);
      }
      writer.writeString(',"');
      writer.writeStringContent('lastName');
      writer.writeString('":');
      writer.writeObject(lastName);
      writer.writeString(',"');
      writer.writeStringContent('date-of-birth');
      writer.writeString('":');
      writer.writeObject(dateOfBirth.toIso8601String());
      writer.writeString(',"');
      writer.writeStringContent('last-order');
      writer.writeString('":');
      writer.writeObject(lastOrder?.toIso8601String());
      writer.writeString(',"');
      writer.writeStringContent('orders');
      writer.writeString('":');
      writer.writeObject(orders);
      writer.writeString(',"');
      writer.writeStringContent('related-people');
      writer.writeString('":');
      writer.writeObject(relatedPeople);
    }
    writer.writeString('}');

    return true;
  }
}

Order _$OrderFromJson(Map<String, dynamic> json) => new Order()
  ..count = json['count'] as int
  ..itemNumber = json['itemNumber'] as int
  ..isRushed = json['isRushed'] as bool
  ..item = json['item'] == null
      ? null
      : new Item.fromJson(json['item'] as Map<String, dynamic>);

abstract class _$OrderSerializerMixin implements JsonWriteMySelf {
  int get count;
  int get itemNumber;
  bool get isRushed;
  Item get item;
  Map<String, dynamic> toJson() {
    var val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('count', count);
    writeNotNull('itemNumber', itemNumber);
    writeNotNull('isRushed', isRushed);
    writeNotNull('item', item);
    return val;
  }

  @override
  bool writeJson(JsonWriter writer) {
    if (writer.isPretty) {
      writer.writeString('{\n');

      writer.increaseIndent();

      var first = true;
      if (count != null) {
        if (first) {
          first = false;
        } else {
          writer.writeString(',\n');
        }
        writer.writeIndentation();
        writer.writeString('"');
        writer.writeStringContent('count');
        writer.writeString('": ');
        writer.writeObject(count);
      }
      if (itemNumber != null) {
        if (first) {
          first = false;
        } else {
          writer.writeString(',\n');
        }
        writer.writeIndentation();
        writer.writeString('"');
        writer.writeStringContent('itemNumber');
        writer.writeString('": ');
        writer.writeObject(itemNumber);
      }
      if (isRushed != null) {
        if (first) {
          first = false;
        } else {
          writer.writeString(',\n');
        }
        writer.writeIndentation();
        writer.writeString('"');
        writer.writeStringContent('isRushed');
        writer.writeString('": ');
        writer.writeObject(isRushed);
      }
      if (item != null) {
        if (first) {
          first = false;
        } else {
          writer.writeString(',\n');
        }
        writer.writeIndentation();
        writer.writeString('"');
        writer.writeStringContent('item');
        writer.writeString('": ');
        writer.writeObject(item);
      }

      writer.writeString('\n');

      writer.decreaseIndent();

      writer.writeIndentation();
    } else {
      writer.writeString('{');
      var first = true;
      if (count != null) {
        if (first) {
          first = false;
        } else {
          writer.writeString(',"');
        }
        writer.writeStringContent('count');
        writer.writeString('":');
        writer.writeObject(count);
      }
      if (itemNumber != null) {
        if (first) {
          first = false;
        } else {
          writer.writeString(',"');
        }
        writer.writeStringContent('itemNumber');
        writer.writeString('":');
        writer.writeObject(itemNumber);
      }
      if (isRushed != null) {
        if (first) {
          first = false;
        } else {
          writer.writeString(',"');
        }
        writer.writeStringContent('isRushed');
        writer.writeString('":');
        writer.writeObject(isRushed);
      }
      if (item != null) {
        if (first) {
          first = false;
        } else {
          writer.writeString(',"');
        }
        writer.writeStringContent('item');
        writer.writeString('":');
        writer.writeObject(item);
      }
    }
    writer.writeString('}');

    return true;
  }
}

Item _$ItemFromJson(Map<String, dynamic> json) => new Item()
  ..count = json['count'] as int
  ..itemNumber = json['itemNumber'] as int
  ..isRushed = json['isRushed'] as bool;

// **************************************************************************
// Generator: JsonLiteralGenerator
// **************************************************************************

final _$glossaryDataJsonLiteral = {
  'glossary': {
    'title': 'example glossary',
    'GlossDiv': {
      'title': 'S',
      'GlossList': {
        'GlossEntry': {
          'ID': 'SGML',
          'SortAs': 'SGML',
          'GlossTerm': 'Standard Generalized Markup Language',
          'Acronym': 'SGML',
          'Abbrev': 'ISO 8879:1986',
          'GlossDef': {
            'para':
                'A meta-markup language, used to create markup languages such as DocBook.',
            'GlossSeeAlso': ['GML', 'XML']
          },
          'GlossSee': 'markup'
        }
      }
    }
  }
};
