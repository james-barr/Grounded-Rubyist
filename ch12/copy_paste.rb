require 'fileutils'

FileUtils.cp("baker.rb", "baker.rb.back")

FileUtils.mkdir("backup")

FileUtils.cp(["ensure.rb", "super.rb"], "backup")

Dir["backup/*"]

FileUtils.mv("baker.rb.back", "backup")

p Dir["backup/*"]
p File.exist?("backup/super.rb")
FileUtils.rm("./backup/super.rb")
p File.exist?("backup/super.rb")

FileUtils.rm_rf("backup")
p File.exist?("backup")

p FileUtils::DryRun.rm_rf("backup")
p FileUtils::DryRun.ln_s("backup", "bakup_link")
puts " --- "
p FileUtils::NoWrite.rm("backup/super.rb")
p File.exist?("backup/super.rb")
