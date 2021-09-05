require 'spec_helper'
describe 'rpcbind' do
  platforms.sort.each do |os, v|
    context "with default values for parameters on OS #{os}" do
      let(:facts) { v[:facts_hash] }
        it {
          should contain_package('rpcbind_package').with({
            'ensure' => 'installed',
            'name'   => v[:package_name],
          })
        }

        it {
          should contain_service('rpcbind_service').with({
            'ensure' => 'running',
            'name'   => v[:service_name],
            'enable' => true,
            'require' => 'Package[rpcbind_package]',
          })
        }
    end
  end

  describe 'with package_ensure absent' do
    let(:facts) { platforms['el7'][:facts_hash] }
    let(:params) { { :package_ensure => 'absent' } }

    it {
      should contain_package('rpcbind_package').with({
        'ensure' => 'absent',
      })
    }
  end

  describe 'with package_name specified' do
    let(:facts) { platforms['el7'][:facts_hash] }
    let(:params) { { :package_name => 'my_rpcbind' } }

    it {
      should contain_package('rpcbind_package').with({
        'ensure' => 'installed',
        'name'   => 'my_rpcbind',
      })
    }
  end

  describe 'with service_ensure stopped' do
    let(:facts) { platforms['el7'][:facts_hash] }
    let(:params) { { :service_ensure => 'stopped' } }

    it {
      should contain_service('rpcbind_service').with({
        'ensure' => 'stopped',
      })
    }
  end

  describe 'with service_name specified' do
    let(:facts) { platforms['el7'][:facts_hash] }
    let(:params) { { :service_name => 'my_rpcbind' } }

    it {
      should contain_service('rpcbind_service').with({
        'name' => 'my_rpcbind',
      })
    }
  end

  describe 'with service_enable false' do
    let(:facts) { platforms['el7'][:facts_hash] }
    let(:params) { { :service_enable => false } }

    it {
      should contain_service('rpcbind_service').with({
        'enable' => false,
      })
    }
  end

  describe 'variable data type and content validations' do
    let(:facts) { platforms['el7'][:facts_hash] }

    validations = {
      'boolean' => {
        :name    => ['service_enable'],
        :valid   => [true, false],
        :invalid => ['string', ['array'], { 'ha' => 'sh' }, 3, 2.42, 'false'],
        :message => 'expects a Boolean value', # Puppet 4 & 5
      },
      'string' => {
        :name    => ['package_name', 'service_name'],
        :valid   => ['string'],
        :invalid => [['array'], { 'ha' => 'sh' }, 3, 2.42, false],
        :message => 'expects a String value', # Puppet 4 & 5
      },
      'string_service_ensure' => {
        :name    => ['service_ensure'],
        :valid   => ['running'],
        :invalid => [['array'], { 'ha' => 'sh' }, 3, 2.42, false],
        :message => 'expects a String value', # Puppet 4 & 5
      },
      'string_package_ensure' => {
        :name    => ['package_ensure'],
        :valid   => ['installed'],
        :invalid => [['array'], { 'ha' => 'sh' }, 3, 2.42, false],
        :message => 'expects a String value', # Puppet 4 & 5
      },
    }

    validations.sort.each do |type, var|
      mandatory_params = {} if mandatory_params.nil?
      var[:name].each do |var_name|
        var[:params] = {} if var[:params].nil?
        var[:valid].each do |valid|
          context "when #{var_name} (#{type}) is set to valid #{valid} (as #{valid.class})" do
            let(:facts) { [mandatory_facts, var[:facts]].reduce(:merge) } if ! var[:facts].nil?
            let(:params) { [mandatory_params, var[:params], { :"#{var_name}" => valid }].reduce(:merge) }
            it { should compile }
          end
        end

        var[:invalid].each do |invalid|
          context "when #{var_name} (#{type}) is set to invalid #{invalid} (as #{invalid.class})" do
            let(:params) { [mandatory_params, var[:params], { :"#{var_name}" => invalid }].reduce(:merge) }
            it 'should fail' do
              expect { should contain_class(subject) }.to raise_error(Puppet::Error, /#{var[:message]}/)
            end
          end
        end
      end # var[:name].each
    end # validations.sort.each
  end # describe 'variable type and content validations'
end
