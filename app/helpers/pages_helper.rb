module PagesHelper
   def twitter_parser tweet
      KopanskiViewTool::RegexTools.wrap_url_with_href tweet
   end
end
