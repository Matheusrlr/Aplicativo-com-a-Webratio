function createStubs() {
    
    var audioContext = (function() {
        // Determine if the Audio API is supported by this browser
        var AudioApi = window.AudioContext;
        if (!AudioApi) {
            AudioApi = window.webkitAudioContext;
        }
        
        if (AudioApi) {
            // The Audio API is supported, so create a singleton instance of the
            // AudioContext
            return new AudioApi();
        }
        
        return undefined;
    }());
    
    function log() {
        var args = [].slice.call(arguments, 0);
        args.unshift("[notification]");
        console.log.apply(console, args);
    }
    
    return {
        Notification : {
            prompt : function(message, title, buttonLabels, defaultText) {
                if (title) {
                    message = title + "\n" + message;
                }
                var result = window.prompt(message, defaultText || '');
                
                if (result === null) {
                    return {
                        buttonIndex : 2,
                                input1 : ''
                    }; // Cancel
                } else {
                    return {
                        buttonIndex : 1,
                        input1 : result
                    }; // OK
                }
                
            },
            
            progressStart : function(title, message) {
                log("progressStart");
            },
            
            progressStop : function() {
                log("progressStop");
            },
            
            progressValue : function(value) {
                log("progressValue");
            },
            
            vibrate : function(success, error, args) {
                log("vibrate");
            },
            
            beep : function(times) {
                if (times > 0) {
                    var BEEP_DURATION = 700;
                    var BEEP_INTERVAL = 300;
                    
                    if (audioContext) {
                        // Start a beep, using the Audio API
                        var osc = audioContext.createOscillator();
                        osc.type = 0; // sounds like a "beep"
                        osc.connect(audioContext.destination);
                        osc.start(0);
                        
                        setTimeout(function() {
                            // Stop the beep after the BEEP_DURATION
                            osc.stop(0);
                            
                            if (--times > 0) {
                                // Beep again, after a pause
                                setTimeout(function() {
                                    navigator.notification.beep(times);
                                }, BEEP_INTERVAL);
                            }
                            
                        }, BEEP_DURATION);
                    } else if (typeof (console) !== 'undefined'
                            && typeof (console.log) === 'function') {
                        // Audio API isn't supported, so just write `beep` to
                        // the console
                        for (var i = 0; i < times; i++) {
                            log('Beep!');
                        }
                    }
                }
            }
        }
    };
};
