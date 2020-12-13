EventGML
by: @soVesDev

based on node.js events: https://nodejs.org/api/events.html

REFERENCE:

---- new EventEmitter(); ----
	creates a new emitter
	
	``
	emitter = new EventEmitter();
	
	``

---- emitter.on(eventName, listener) ----
	adds a new event listener to emitter
	
	``
	emitter.on("message", function(message){
		show_message(message);
	});
	
	``
	
---- emitter.emit(eventName, ...args) ----
	calls all event listeners with provided arguments
	
	``
	emitter.emit("message", "Hello World!");
	
	``
	
---- emitter.eventNames() ----
	returns a array of the event names
	
	``
	var names = emitter.eventNames();
	show_message(names);
	
	``

---- emitter.getMaxListeners() ----
	gets maximum amount of listeners for all events
	
	``
	var count = emitter.getMaxListeners();
	show_message(count);
	
	``
	
---- emitter.setMaxListeners() ----
	sets maximum amount of listeners for all events
	default: 10
	
	``
	emitter.setMaxListeners(20);
	
	``
	
---- emitter.listenerCount(eventName) ----
	gets the amount of listeners for a given event
	
	``
	var count = emitter.listenerCount("message");
	show_message(count);
	
	``
	
---- emitter.rawListeners(eventName) ----
	returns raw listeners of event, including wrappers like "once" provides
	

---- emitter.once(eventName, listener) ----
	adds a new event listener to emitter that can only be called once
	gets removed after being called
	
	``
	emitter.once("message", function(message){
		show_message(message);
	});
	
	``

---- emitter.removeAllListeners(eventName) ----
	removes all listeners of a event
	
	``
	emitter.removeAllListeners("message")
	
	``
	
---- emitter.removeListener(eventName, listener) ----
	removes a listener from a event
	
	``
	var listener = function(message){
		show_message(message);
	};
	emitter.on("message", listener);
	
	emitter.removeListener("message", listener)
	
	``