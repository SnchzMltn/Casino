extends Node

var socket = WebSocketPeer.new()
var last_state = WebSocketPeer.STATE_CLOSED

func _ready():
	# Initiate connection to the given URL.
	var err = socket.connect_to_url(Constants.WEBSOCKET_URL)
	if err != OK:
			print("Unable to connect", err)

func _process(_delta) -> void:
	var state = socket.get_ready_state()

	if state != last_state:
		socket.poll()

	if state == WebSocketPeer.STATE_OPEN:
		while socket.get_available_packet_count():
			print("Packet: ", socket.get_packet())
	elif state == WebSocketPeer.STATE_CLOSING:
		# Keep polling to achieve proper close.
		pass
	elif state == WebSocketPeer.STATE_CLOSED:
		var code = socket.get_close_code()
		var reason = socket.get_close_reason()
		print("WebSocket closed with code: %d, reason %s. Clean: %s" % [code, reason, code != -1])
		set_process(false) # Stop processing.
