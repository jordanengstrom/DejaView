function reddit_get_base_url() {
	static _domain = undefined;
	
	if (!is_undefined(_domain)) return _domain;
	_domain = url_get_domain();
	if (_domain == "localhost") {
		var _info = os_get_info();
		var _href = ds_map_find_value(_info, "window.location.href");
		ds_map_destroy(_info);
		if (is_undefined(_href)) return _domain;
		
		var _cutoff = string_pos("index.html", _href);
		if (_cutoff == 0) {
			_cutoff = string_pos("runner.html", _href);	 
			if (_cutoff == 0) return _domain;
		}
		_domain = string_delete(_href, _cutoff - 1 /* remove trailing '/' */, string_length(_href));
	}
	else {
		var _info = os_get_info();
		var _protocol = ds_map_find_value(_info, "window.location.protocol");
		ds_map_destroy(_info);
		
		_protocol ??= "https:";
		_domain = $"{_protocol}//{_domain}";
	}

	return _domain;
}

function reddit_get_token() {
    static _token = undefined;
    
    if (!is_undefined(_token)) return _token;
    
    _token = "noone";
    
    for (var _i = 0; _i < parameter_count(); ++_i) {
        var _param = parameter_string(_i);
        
        if (string_starts_with(_param, "token=")) {
            _token = string_delete(_param, 1, 6);
            break;
        }

        if (string_starts_with(_param, "webbit_token=")) {
            _token = string_delete(_param, 1, 13);
            break;
        }
    }
    
    return _token;
}