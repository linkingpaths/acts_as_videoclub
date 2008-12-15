module LinkingPaths
  module Videoclub #:nodoc:
    module Helper #:nodoc:

      def video_embed_code(video, options={})
        options[:width]  ||= "425"
        options[:height] ||= "344"

        case video.source_url
        when /youtube/
          video.source_url =~ /v=([^&]+)/
          id = $1
          <<-EOS
          <object width="#{options[:width]}" height="#{options[:height]}">
            <param name="movie" value="http://www.youtube.com/v/#{id}&hl=es&fs=1"></param>
            <param name="allowFullScreen" value="true"></param>
            <param name="showsearch" value="0"></param>
            <param name="allowscriptaccess" value="always"></param>
            <embed src="http://www.youtube.com/v/#{id}&hl=es&fs=1" type="application/x-shockwave-flash" showsearch="0" allowscriptaccess="always" allowfullscreen="true" width="#{options[:width]}" height="#{options[:height]}"></embed>
          </object>
          EOS
        when /google/
          puts "---------------"
          puts "got google"
          puts "---------------"
          video.source_url =~ /docid=-([^&]+)/
          id = $1
          <<-EOS
          <embed id="VideoPlayback" src="http://video.google.com/googleplayer.swf?docid=-#{id}&hl=es&fs=true" style="width:#{options[:width]}px;height:#{options[:height]}px" allowFullScreen="true" allowScriptAccess="always" type="application/x-shockwave-flash"> </embed>
          EOS
        when /vimeo/
          video.source_url =~ /vimeo.com\/([^&]+)/
          id = $1
          <<-EOS
          <object type="application/x-shockwave-flash" width="#{options[:width]}" height="#{options[:height]}" data="http://www.vimeo.com/moogaloop.swf?clip_id=-#{id}&amp;server=www.vimeo.com&amp;fullscreen=1&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=">
            <param name="quality" value="best" />
            <param name="allowfullscreen" value="true" />
            <param name="scale" value="showAll" />
            <param name="movie" value="http://www.vimeo.com/moogaloop.swf?clip_id=-#{id}&amp;server=www.vimeo.com&amp;fullscreen=1&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=" />
          </object>
          EOS
        when /dailymotion/
          video.source_url =~ /video\/([^&]+)/
          id = $1
          <<-EOS
          <object width="#{options[:width]}" height="#{options[:height]}">
            <param name="movie" value="http://www.dailymotion.com/swf/#{id}&related=1"></param>
            <param name="allowFullScreen" value="true"></param>
            <param name="allowScriptAccess" value="always"></param>
            <embed src="http://www.dailymotion.com/swf/#{id}&related=1" type="application/x-shockwave-flash" width="#{options[:width]}" height="#{options[:height]}" allowFullScreen="true" allowScriptAccess="always"></embed>
          </object>
          EOS
        else
          "Video service is not supported or the URL is not valid. Only Google Videos, Vimeo, Dailymotion and youtube are supported (#{video.source_url})"
        end
      end

    end
  end
end