function EventEmitter() constructor
{
	
	_events = {};
	_maxListeners = 10;
	
	static on = function(eventName, listener)
	{
		var event = _events[$ eventName];
		
		//make sure event has a array
		if (!is_array(event)) event = [];
		
		//max listeners reached
		if ( array_length(event) >= _maxListeners) return -1;
		
		array_push(event, listener);
		
		_events[$ eventName] = event;
		return 1; //success
	}
	
	static emit = function(eventName)
	{
		var event = _events[$ eventName];
			
		//event does not exist or there are no listeners
		if (!is_array(event)) return -1;
		var i = 0, _le = array_length(event);
		do
		{
			switch(argument_count)
					{
				case 1:
					event[i](argument[0]);
					break;
				case 2:
					event[i](argument[0], argument[1]);
					break;
				case 3:
					event[i](argument[0], argument[1], argument[2]);
					break;
				case 4:
					event[i](argument[0], argument[1], argument[2], argument[3]);
					break;
				case 5:
					event[i](argument[0], argument[1], argument[2], argument[3], argument[4]);
					break;
				case 6:
					event[i](argument[0], argument[1], argument[2], argument[3], argument[4], argument[5]);
					break;
				case 7:
					event[i](argument[0], argument[1], argument[2], argument[3], argument[4], argument[5], argument[6]);
					break;
			}
			i++;
		} until (i = _le)
		
		return 1; //success
	}
	
	static eventNames = function()
	{
		return variable_struct_get_names(_events);
	}
	
	static getMaxListeners = function()
	{
		return _maxListeners;
	}
	
	static setMaxListeners = function(n)
	{
		_maxListeners = n;
	}
	
	static listenerCount = function(eventName)
	{
		//event does not exist or there are no listeners
		if (!is_array(_events[$ eventName])) return -1;
		return array_length(_events[$ eventName]);
	}
	
	static rawListeners = function(eventName)
	{
		return _events[$ eventName];
	}
	
	static removeAllListeners = function(eventName)
	{
		_events[$ eventName] = [];
	}
	
	static removeListener = function(eventName, listener)
	{
		var event = _events[$ eventName];
		//event does not exist or there are no listeners
		if (!is_array(event)) return -1;
		
		for(var i = 0; i < array_length(event); i++)
		{
			if (event[i] = listener){
				array_delete(event, i, 1);
				return 1;
			} 
		}
		return -1;
	}
}
/// @hint new EventEmitter()
/// @hint EventEmitter.emit(eventName, ...args)
