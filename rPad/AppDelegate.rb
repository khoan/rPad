#
#  AppDelegate.rb
#  rPad
#
#  Created by khoa nguyen on 11/04/11.
#  Copyright 2011 __MyCompanyName__. All rights reserved.
#

class AppDelegate
    attr_accessor :window
    attr_accessor :r_pad
    
    def applicationDidFinishLaunching(a_notification)
        voice_type = "com.apple.speech.synthesis.voice.Alex"
        @voice = NSSpeechSynthesizer.alloc.initWithVoice(voice_type)
        @voice.delegate = self
        @didFinishSpeaking = true
    end
    
    def play_pause(sender)
        if @voice.isSpeaking
            @voice.pauseSpeakingAtBoundary NSSpeechWordBoundary
            @didFinishSpeaking = false
        elsif @didFinishSpeaking
            @voice.startSpeakingString r_pad.stringValue
        else
            @voice.continueSpeaking
        end
    end
    
    def speechSynthesizer(sender, didFinishSpeaking: success)
        @didFinishSpeaking = success
    end
end
