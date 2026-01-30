/// @function                   get_random_sprites_from_tag(_tag, _count)
/// @description                Returns an array of random sprite IDs from a given tag
/// @param {string} _tag        The tag name to search for
/// @param {real}   _count      The number of sprites to return
function get_random_objects_from_tag(_tag, _count) {
	var _all_assets = tag_get_asset_ids(_tag, asset_object);
	randomize();
    var _shuffled = array_shuffle(_all_assets);
    
    var _subset = array_create(_count);
    array_copy(_subset, 0, _shuffled, 0, _count);
    
    return _subset;
}