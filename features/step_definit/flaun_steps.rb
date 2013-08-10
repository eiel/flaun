def filename
  File.join(File.dirname(__FILE__), '..', 'fixture','config.flaun')
end

Given(/^should open "(.*?)"$/) do |uri|
  Launchy.should_receive(:open).with(uri) { puts "open browser #{uri}" }
end

Given(/^should ssh "(.*?)"$/) do |host|
  Net::SSH.should_receive(:start).with(host, 'bar') do |a,b, &block|
    ssh = double

    h = 'localhost'
    ssh.should_receive(:forward) { ssh }
    ssh.should_receive(:local).with(8010, h, 80) do |port, host, remote|
      puts "local fowarad #{port}:#{host}:#{remote}"
    end
    ssh.should_receive(:loop) { sleep 1 }

    block.call ssh
  end
end


When(/^I run "(.*?)"$/) do |target|
  Flaun.start target, filename
end

Given(/^config file:$/) do |string|
  open(filename,'w') { |io| io.write string }
end
