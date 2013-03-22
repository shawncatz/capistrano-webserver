require "bundler/gem_tasks"

def changelog(last=nil, single=false)
  command="git --no-pager log --format='%an::::%h::::%s'"

  list = `git tag`

  puts "# Changelog"
  puts

  ordered = list.lines.sort_by {|e| (a,b,c) = e.gsub(/^v/,"").split("."); "%3d%3d%3d" % [a, b, c]}

  ordered.reject{|e| (a,b,c,d) = e.split("."); !d.nil?}.reverse_each do |t|
    tag = t.chomp

    if last
      check = { }
      out   = []
      log   = `#{command} #{last}...#{tag}`
      log.lines.each do |line|
        (who, hash, msg) = line.split('::::')
        unless check[msg]
          unless msg =~ /^Merge branch/ || msg =~ /CHANGELOG/ || msg =~ /^(v|version|changes for|preparing|ready for release|ready to release|bump version)*\s*(v|version)*\d+\.\d+\.\d+/
            msg.gsub(" *", "\n*").gsub(/^\*\*/, "  *").lines.each do |l|
              line = l =~ /^(\s+)*\*/ ? l : "* #{l}"
              out << line
            end
            check[msg] = hash
          end
        end
      end
      puts "## #{last}:"
      out.each { |e| puts e }
      #puts log
      puts
    end

    last = tag
    exit if single
  end
end

desc "generate changelog output"
task :changelog do
  changelog
end

desc "show current changes (changelog output from HEAD to most recent tag)"
task :current do
  changelog("HEAD",true)
end