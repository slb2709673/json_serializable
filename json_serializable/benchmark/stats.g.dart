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

abstract class _$StatsSerializerMixin {
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
}
