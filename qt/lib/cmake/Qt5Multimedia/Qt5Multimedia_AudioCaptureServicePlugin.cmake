
add_library(Qt5::AudioCaptureServicePlugin MODULE IMPORTED)

_populate_Multimedia_plugin_properties(AudioCaptureServicePlugin RELEASE "mediaservice/qtmedia_audioengine.dll")
#_populate_Multimedia_plugin_properties(AudioCaptureServicePlugin DEBUG "mediaservice/qtmedia_audioengined.dll")

list(APPEND Qt5Multimedia_PLUGINS Qt5::AudioCaptureServicePlugin)
