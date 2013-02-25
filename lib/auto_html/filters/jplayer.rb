AutoHtml.add_filter(:jplayer).with({}) do |text, options|
  text.gsub(/https?:\/\/.+?\.(mp3|ogg|wav|mp4|webm|flv)(\?\S+)?/i) do |match|
    jplayer = "

            <div id='jquery_jplayer_1' class='jp-jplayer'></div>
            <div class='jp-type-single'>        
                <div class='jp-gui jp-interface'>
                    <ul class='jp-controls'>
                        <li><a href='javascript:;' class='jp-play' tabindex='1'>play</a></li>
                        <li><a href='javascript:;' class='jp-pause' tabindex='1'>pause</a></li>
                        <li><a href='javascript:;' class='jp-stop' tabindex='1'>stop</a></li>
                        <li><a href='javascript:;' class='jp-mute' tabindex='1' title='mute'>mute</a></li>
                        <li><a href='javascript:;' class='jp-unmute' tabindex='1' title='unmute'>unmute</a></li>
                        <li><a href='javascript:;' class='jp-volume-max' tabindex='1' title='max volume'>max volume</a></li>
                    </ul>
                    <div class='jp-progress'>
                        <div class='jp-seek-bar'>
                            <div class='jp-play-bar'></div>
                        </div>
                     </div>
                    <div class='jp-volume-bar'>
                        <div class='jp-volume-bar-value'></div>
                    </div>
                    <div class='jp-current-time'></div>
                    <div class='jp-duration'></div>
                         <ul class='jp-toggles'>
                           <li><a href='javascript:;' class='jp-repeat' tabindex='1' title='repeat'>repeat</a></li>
                           <li><a href='javascript:;' class='jp-repeat-off' tabindex='1' title='repeat off'>repeat off</a></li>
                         </ul>
                </div>
            </div>
            <div class='jp-title'>
                <!-- 
                <ul>
                    <li></li>
                </ul>
                 -->
            </div>
            <div class='jp-no-solution'>
                    <span>Update Required</span>
                    To play the media you will need to either update your browser to a recent version or update your <a href='http://get.adobe.com/flashplayer/' target='_blank'>Flash plugin</a>.
            </div>    
    "
        
    jplayer_end = "<script>window.onload = function() {
					    $('#jquery_jplayer_1').jPlayer({
					        ready: function(event) {
					            $(this).jPlayer('setMedia', {"
	supplied = ""
	jplayer_end, supplied = jplayer_end + "mp3: '#{match}',", supplied + "mp3," if text.include? "mp3"
	jplayer_end, supplied = jplayer_end + "ogg: '#{match}',", supplied + "ogg," if text.include? "ogg"
	jplayer_end, supplied = jplayer_end + "wav: '#{match}',", supplied + "wav," if text.include? "wav"
	jplayer_end, supplied = jplayer_end + "flv: '#{match}',", supplied + "flav," if text.include? "flv"		
	jplayer_end, supplied = jplayer_end + "mp4: '#{match}',", supplied + "mp4," if text.include? "mp4"
	jplayer_end, supplied = jplayer_end + "webm: '#{match}',", supplied + "webm," if text.include? "webm"			
	jplayer_end += "			});
					        },
					        swfPath: 'http://www.jplayer.org/2.1.0/js',
					        supplied: '#{supplied}',
                            wmode: 'window'
					    });
					};</script>"
    %{#{jplayer_end}#{jplayer}}
  end
end

