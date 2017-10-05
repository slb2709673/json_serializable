![numbers](https://raw.githubusercontent.com/dart-lang/json_serializable/experiment.custom_json_writer/json_serializable/numbers.png)

## Initial
Using my own copy of `JsonEncoder` and friends – no changes from `dart:convert`.

##custom writer
Instead of generating a generic `Map` for each call to `toJson` return
an instance of a custom `JsonMapWrapper` class specialized for the target type. This custom map
looks like an immutable map, except that it only corresponds to the target instance.

**~24% improvement. Nice!**

## remove default checks dart:convert checks
Removed 2 checks from my copy of `JsonEncoder`.

1 - Removed checks for circular object graphs. Thes was a `List` that stored all visited objects. Each time a new instance is visited in a serialization tree, it's checked against the `List`. If an object is seen again, you get an exception.

Nice to avoid accidental out-of-memory errors, but it can get expensive if your object hierachy is large.

Pondering: perhaps a more simple "max depth" check would provide around the same assurance more cheaply.*

2 - string key check in Map serialization. Before any value for a map is written, all of the keys and values are added to an array – while constantly checking that all keys are `String`. If any of the of the keys of the Map are not a String, the attempt is aborted and the Map instance is passed along to (perhaps) be handled by a custom encoder.

Obviously, this check costs a short-lived array allocation (thankfully fixed length, to avoid resizing).

I ditched this check. If any key `is! String` I throw.

**Additional 4.7% faster**

**29% faster overall**

## Direct write the JSON output
As suggested by [luisvt](https://github.com/luisvt), I tried skipping intermediate representations and went dirrect-to-buffer.

This involved hacking my `JsonEncoder` copy further to support passing in a custom writer.

The [generated code is not super pretty](https://github.com/dart-lang/json_serializable/blob/47347cc94023cca9b2ce251ccbd49b3020a3e959/json_serializable/example/example.g.dart#L57),
but it works.

*Note: I'm not a big fan of bolting on the poorly named `JsonWriteMySelf` to every generated class.
It was just the easiest thing to do w/ the current source_gen structure of my app.*

**Additional speed-up: 6.9%**

**35.9% overall speedup**

# next steps

* Update my harness to support testing with dart2js. VM speeds are great, but many folks want to use this on the web.

* Figure out the best way to ship it.

  * Easy: ship a one-off `JsonEncoder`-like library with support.
  * Harder: Work this into the SDK.

* Ponderin if the `toJson`/`fromJson` of data classes is the right idea. It might be cleaner/easier (in many cases) to generate custom encoders/decoders for a set of types. We could keep the annotations, but ditch the crazy part file w/ the factory constructors and the weird mixins.
