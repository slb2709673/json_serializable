// GENERATED CODE - DO NOT MODIFY BY HAND

part of stats;

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Stats _$StatsFromJson(Map<String, dynamic> json) => new Stats(
    json['count'] as int,
    json['mean'] as num,
    json['median'] as num,
    json['max'] as num,
    json['min'] as num,
    json['standardDeviation'] as num);

abstract class _$StatsSerializerMixin implements JsonWriteMySelf {
  int get count;
  num get mean;
  num get median;
  num get max;
  num get min;
  num get standardDeviation;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'count': count,
        'mean': mean,
        'median': median,
        'max': max,
        'min': min,
        'standardDeviation': standardDeviation
      };

  @override
  bool writeJson(JsonWriter writer) {
    if (writer.isPretty) {
      writer.writeString('{\n');

      writer.increaseIndent();

      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('count');
      writer.writeString('": ');
      writer.writeObject(count);

      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('mean');
      writer.writeString('": ');
      writer.writeObject(mean);

      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('median');
      writer.writeString('": ');
      writer.writeObject(median);

      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('max');
      writer.writeString('": ');
      writer.writeObject(max);

      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('min');
      writer.writeString('": ');
      writer.writeObject(min);

      writer.writeString(',\n');
      writer.writeIndentation();
      writer.writeString('"');
      writer.writeStringContent('standardDeviation');
      writer.writeString('": ');
      writer.writeObject(standardDeviation);

      writer.writeString('\n');

      writer.decreaseIndent();

      writer.writeIndentation();
    } else {
      writer.writeString('{');
      writer.writeStringContent('count');
      writer.writeString('":');
      writer.writeObject(count);
      writer.writeString(',"');
      writer.writeStringContent('mean');
      writer.writeString('":');
      writer.writeObject(mean);
      writer.writeString(',"');
      writer.writeStringContent('median');
      writer.writeString('":');
      writer.writeObject(median);
      writer.writeString(',"');
      writer.writeStringContent('max');
      writer.writeString('":');
      writer.writeObject(max);
      writer.writeString(',"');
      writer.writeStringContent('min');
      writer.writeString('":');
      writer.writeObject(min);
      writer.writeString(',"');
      writer.writeStringContent('standardDeviation');
      writer.writeString('":');
      writer.writeObject(standardDeviation);
    }
    writer.writeString('}');

    return true;
  }
}
