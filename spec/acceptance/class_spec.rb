require 'spec_helper_acceptance'

describe 'rpcbind class' do
  context 'rpcbind' do
    context 'with default values for all parameters' do
      context 'it should be idempotent' do
        if fact('osfamily') == 'Debian' and fact('operatingsystemrelease') == '16.04'
          before { skip("Ubuntu 16.04 has a systemd issue that makes setting the service enable not idempotent. Skipping test.") }
        end

        it 'should work with no errors' do
          pp = <<-EOS
          include rpcbind
          EOS

          # Run it twice and test for idempotency
          apply_manifest(pp, :catch_failures => true)
          apply_manifest(pp, :catch_changes  => true)
        end
      end

      context 'should contain resources' do

        pp = <<-EOS
        include rpcbind
        EOS

        apply_manifest(pp, :catch_failures => true)

        describe package('rpcbind') do
          it { is_expected.to be_installed }
        end

        describe service('rpcbind') do
          it { is_expected.to be_running }
          it { is_expected.to be_enabled }
        end
      end
    end
  end
end
