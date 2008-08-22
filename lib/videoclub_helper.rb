module LinkingPaths
  module Videoclub #:nodoc:
    module Helper #:nodoc:

      def video_embed_code(video, options={})
        options[:width]  ||= "452"
        options[:height] ||= "354"

        case video.source_url
        when /youtube/
          video.source_url =~ /v=([^&]+)/
          id = $1
          <<-EOS
          <object width="#{options[:width]}" height="#{options[:height]}">
            <param name="movie" value="http://www.youtube.com/v/#{id}&hl=es"></param>
            <param name="wmode" value="transparent"></param>
            <embed src="http://www.youtube.com/v/#{id}&hl=es" type="application/x-shockwave-flash" wmode="transparent" width="#{options[:width]}" height="#{options[:height]}"></embed>
          </object>
          EOS
        when /vimeo/
          video.source_url =~ /vimeo.com\/([^&]+)/
          id = $1
          <<-EOS
          <object type="application/x-shockwave-flash" width="#{options[:width]}" height="#{options[:height]}" data="http://www.vimeo.com/moogaloop.swf?clip_id=#{id}&amp;server=www.vimeo.com&amp;fullscreen=1&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=">
            <param name="quality" value="best" />
            <param name="allowfullscreen" value="true" />
            <param name="scale" value="showAll" />
            <param name="movie" value="http://www.vimeo.com/moogaloop.swf?clip_id=#{id}&amp;server=www.vimeo.com&amp;fullscreen=1&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=" />
          </object>
          EOS
        else
          "El servicio de video usado no está soportado aun por el sistema o la url es incorrecta."
        end
      end

    end
  end
end