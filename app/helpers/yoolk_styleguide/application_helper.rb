module YoolkStyleguide
  module ApplicationHelper
    def highlight(language = :html, code = nil, &block)
      code = highlight_code(language, capture(&block))
      "<div class='highlight'><pre><code class='#{language}'>#{code}</code></pre></div>".html_safe
    end
  end
end