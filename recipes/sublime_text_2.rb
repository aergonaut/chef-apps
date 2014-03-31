dmg_package "Sublime Text 2" do
  source "http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2.dmg"
  dmg_name "sublime_text_2"
end

link "/usr/local/bin/subl" do
  to "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl"
end
