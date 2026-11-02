extends Node

var stt = await NobodyWhoSpeechToText.create("hf://onnx-community/whisper-base", {})

func _ready() -> void:
    var text: String = await stt.transcribe_file("res://recording.mp3")
    print(text)