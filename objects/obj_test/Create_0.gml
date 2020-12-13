emitter = new EventEmitter();

emitter.on("ping", function(){
	show_message("pong");
})

emitter.emit("ping");