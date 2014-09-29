# encoding: utf-8

# Guardfile

guard 'rake', :task => 'lint' do
  watch(/^manifests\/.*$/)
  watch(/^templates\/.*$/)
end

guard 'rake', :task => 'spec' do
  watch(%r{^spec/(classes|defines)/.+_spec\.rb$})
  watch('spec/spec_helper.rb')
  watch(/^lib\/.*$/)
  watch(/^manifests\/.*$/)
  watch(/^templates\/.*$/)
end
