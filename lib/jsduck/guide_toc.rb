require 'jsduck/util/html'

module JsDuck

  # Adds Table of Contents section to guide HTML.
  class GuideToc

    # Inserts table of contents at the top of guide HTML by looking
    # for <h2> elements.
    def self.inject(html, guide_name)
      toc = []
      new_html = []

      html.each_line do |line|
        if line =~ /^\s*<(h[1-6])>(.*?)<\/h[1-6]>$/
          tag = $1
          text = Util::HTML.strip_tags($2)
          id = guide_name + "-section-" + title_to_id(text)

          new_html << "<#{tag} id='#{id}'>#{text}</#{tag}>\n"

          if tag =~ /^h([2-4])$/
            toc.push({
              :title => "<a href='#!/guide/#{id}'>#{text}</a>",
              :level => $1.to_i - 2
            })
          end
        else
          new_html << line
        end
      end

      new_html.flatten!
      # Find index of the first heading
      h1_index = new_html.flatten.index { |html_frag| html_frag =~ /<h1/ }

      # Inject TOC below first heading if at least 2 items in TOC
      if toc.length >= 2
        new_html.insert( h1_index ? h1_index + 1 : 0, [
            "<div class='toc'>\n",
            "<p><strong>Contents</strong></p>\n",
            "<ol>\n",
            toc_to_html_list(toc),
            "</ol>\n",
            "</div>\n",
        ])
      end

      new_html.flatten.join
    end

    def self.title_to_id(title)
      CGI::escape(title.downcase.gsub(/ /, "-"))
    end

    def self.toc_to_html_list(toc)
      html = ["<li>"]
      prev_level = 0

      toc.each.with_index do |item, i|
        if prev_level < item[:level]
          html << ("<ol>\n<li>\n" * (item[:level] - prev_level))
        elsif prev_level > item[:level]
          html << ("</li>\n</ol>\n<li>\n" * (prev_level - item[:level]))
        elsif i > 0
          html << "</li>\n<li>\n"
        end

        html << item[:title]

        prev_level = item[:level]
      end

      html << "</li>"
      if prev_level > 0
        html << ("</ol>" * prev_level)
      end

      return html
    end

  end

end
