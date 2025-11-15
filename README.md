<div align="middle">

<img src="git_assets/banner.png" align=""></img>

Godot 4.5 plugin to convert any Godot variant to raw JSON & back, with absolutely no data loss.

This plugin is under development & not fully ready for use. Suggestions & contributions are still welcome!

[![Release](https://img.shields.io/badge/Need_help%3F-gray?style=flat&logo=discord)](https://dsc.gg/sohp)

</div>

# Simple run-down:
This plugin can serialize absolutely any data type within Godot to raw readable JSON so long as the appropriate type handlers have been implemented. You can serialize any custom & built-in classes too, as long as they are listed in `A2J.object_registry`, most common objects are already registered by default, but custom classes & more obscure built-in classes need to be manually registered.

The original goal of this plugin was to have a way to serialize resources to independent JSON files (from within the editor) that can be stored on the disk with extreme flexibility when it comes to what & how things get converted.

# **Features:**
## Error logging:
There is a dedicated error logging system so you don't have to deal with obscure error messages or unexpected behavior when the plugin isn't used properly.
## Modular & extendable:
Everything is coded in GDScript across distinct classes & files, allowing for easy modification & extension.
## Editor-ready:
Unlike the most common alternatives, Any-JSON can work in the editor so it can be used within other editor tools.
A downside to `ResourceSaver` is that the resource path, UID, & other meta data are saved when used in the editor. This was one of the main drives for me to make Any-JSON, as this would not be viable for some of my purposes.
## Rulesets:
A "ruleset" can be supplied when converting to or from AJSON allowing fine control over serialization. Something you don't get with `var_to_str` & not as much with `ResourceSaver`.

**Basic rules:**
- `type_exclusions (in-dev)` (Array\[String\]): Types of variables/properties that will be discarded.
- `property_exclusions` (Dictionary\[String,Array\[String\]\]): Names of properties that will not be recognized for each object. Can be used to exclude for example `Resource` specific properties like `resource_path`.
- `convert_properties_to_references` (Dictionary[String,Array[String]]): Names of object properties that will be converted to a named reference when converting to JSON. Named values can be supplied during conversion back to the original item with `named_references`.
- `named_references` (Dictionary[String,Dictionary[String,Variant]]): Variants to replace named references with. See `convert_properties_to_references`.

**Advanced rules:**
- `midpoint (in-dev)` (Callable(item:Variant, ruleset:Dictionary) -> bool): Called right before conversion for every variable & property including nested ones. Returning `true` will permit conversion, returning `false` will discard the conversion for that item.

# **To-Do:**
- Add support for non string keys in dictionaries.
- Add more built-in type handlers for common types.
- Add more built-in objects in the object registry.
- Clean up code & add more descriptive comments.
