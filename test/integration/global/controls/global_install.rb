# frozen_string_literal: true
global_ruby = '2.4.1'

control 'Rbenv should be installed' do
  title 'Rbenv should be installed globally'

  desc "Can set global Ruby version to #{global_ruby}"
  describe bash('source /etc/profile.d/rbenv.sh && rbenv versions --bare') do
    its('exit_status') { should eq 0 }
    its('stdout') { should include(global_ruby) }
  end
end

control 'Path' do
  impact 1
  title 'rbenv should be on the path'
  desc 'rbenv bin and shims should be on the path'

  describe bash('source /etc/profile.d/rbenv.sh && echo $PATH') do
    its('stdout') { should match /shims/ }
    its('stdout') { should match %r{.rbenv/bin} }
  end
end
