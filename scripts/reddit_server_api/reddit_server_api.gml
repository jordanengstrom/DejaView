function api_get_http_manager() {
	with (o_http_manager) return self;
	return instance_create_depth(0, 0, 0, o_http_manager);
}

function api_register_request(_req, _callback) {
	var _manager = api_get_http_manager();
	_manager.register(_req, _callback);
}

function api_save_state(_level, _data, _callback) {
    var _url = reddit_get_base_url() + "/api/state";
    var _headers = ds_map_create();
    ds_map_add(_headers, "Content-Type", "application/json");
    ds_map_add(_headers, "Authorization", $"Bearer {reddit_get_token()}");

    var _body = {};
    if (is_real(_level)) _body.level = _level;
    if (is_struct(_data)) _body.data = _data;
	
    var _json = json_stringify(_body);
    var _req = http_request(_url, "POST", _headers, _json);

    ds_map_destroy(_headers);

	if (is_callable(_callback)) api_register_request(_req, _callback);

	return _req;
}

function api_load_state(_callback) {
    var _url = reddit_get_base_url() + "/api/state";
    var _headers = ds_map_create();
	ds_map_add(_headers, "Authorization", $"Bearer {reddit_get_token()}");
    var _req = http_request(_url, "GET", _headers, "");
	ds_map_destroy(_headers);
	if (is_callable(_callback)) api_register_request(_req, _callback);
    return _req;
}

function api_submit_score(_score, _callback) {
	if (!is_real(_score) || _score <= 0) {
        if (is_callable(_callback)) _callback(undefined);
        return;
    }
	
    var _url = reddit_get_base_url() + "/api/score";
    var _headers = ds_map_create();
    ds_map_add(_headers, "Content-Type", "application/json");
	ds_map_add(_headers, "Authorization", $"Bearer {reddit_get_token()}");

    var _body = {};
	if (is_real(_score)) _body.score = _score;

    var _json = json_stringify(_body);
    var _req = http_request(_url, "POST", _headers, _json);

    ds_map_destroy(_headers);

	if (is_callable(_callback)) api_register_request(_req, _callback);

	return _req;
}

function api_get_leaderboard(_limit, _callback) {
    if (!is_real(_limit)) _limit = 10;
	var _url = reddit_get_base_url() + "/api/leaderboard?limit=" + string(_limit);

    var _headers = ds_map_create();
	ds_map_add(_headers, "Authorization", $"Bearer {reddit_get_token()}");

    var _req = http_request(_url, "GET", _headers, "");

	ds_map_destroy(_headers);

	if (is_callable(_callback)) api_register_request(_req, _callback);

    return _req;
}