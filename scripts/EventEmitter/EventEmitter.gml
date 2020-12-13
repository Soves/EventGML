function EventEmitter() constructor
{
	
	_events = {};
	_maxListeners = 10;

	static _getEventStatus = function(eventName)
	{
		var event = _events[$ eventName];
		if (!is_array(event)) return -1;
		return 1;
	}
	
	static _setEvent = function(eventName, eventArray)
	{
		_events[$ eventName] = eventArray;
	}
	
	static on = function(eventName, listener)
	{
		var s = _getEventStatus(eventName);
		
		//make sure event has a array
		if (s = -1) _events[$ eventName] = [];
		var event = _events[$ eventName];
		
		//max listeners reached
		if ( array_length(event) >= _maxListeners) return -1;
		
		array_push(event, listener);
		
		return 1; //success
	}
	
	
	static emit = function(eventName)
	{
		var s = _getEventStatus(eventName);
			
		//event does not exist or there are no listeners
		if (s = -1) return -1;
		var event = _events[$ eventName];
		
		var args = array_create(argument_count);
		for (var i = 0; i < argument_count; i++) args[i] = argument[i];
		
		for(var i = 0; i < array_length(event); i++)
		{
			if (is_struct(event[i])){
				//this is a wrapper so unwrap it
				if (event[i].once = true){ //this is a one time listener
					script_execute_ext(method_get_index(event[i].listener), args, 1, argument_count-1);
					array_delete(event, i, 1);
				}
			}
			else
			{
				script_execute_ext(method_get_index(event[i]), args, 1, argument_count-1);
			}
			
		}
		
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
		var s = _getEventStatus(eventName);
		//event does not exist or there are no listeners
		if (s = -1) return -1;
		return array_length(_events[$ eventName]);
	}
	
	static rawListeners = function(eventName)
	{
		return _events[$ eventName];
	}
	
	static once = function(eventName, listener)
	{
		var s = _getEventStatus(eventName);
		//event does not exist or there are no listeners
		if (s = -1) _events[$ eventName] = [];
		var event = _events[$ eventName];
		
		//max listeners reached
		if ( array_length(s) >= _maxListeners) return -1;
		
		var _wrapper = {
			listener: listener,
			once: true
		}
		
		array_push(event, _wrapper);
		
		return 1; //success
	}
	
	static removeAllListeners = function(eventName)
	{
		_events[$ eventName] = [];
	}
	
	static removeListener = function(eventName, listener)
	{
		var s = _getEventStatus(eventName);
		//event does not exist or there are no listeners
		if (s = -1) return -1;
		var event = _events[$ eventName];
		
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
