def platforms
  {
    'debian8' =>
      {
        :facts_hash => {
          :osfamily => 'Debian',
          :operatingsystem => 'Debian',
          :os => {
            'name' => 'Debian',
            'family' => 'Debian',
            'release' => {
              'full'  => '8.0',
              'major' => '8',
              'minor' => '0'
            },
          },
        },
        :package_name => 'rpcbind',
        :service_name => 'rpcbind',
      },
    'debian9' =>
      {
        :facts_hash => {
          :osfamily => 'Debian',
          :operatingsystem => 'Debian',
          :os => {
            'name' => 'Debian',
            'family' => 'Debian',
            'release' => {
              'full'  => '9.0',
              'major' => '9',
              'minor' => '0'
            },
          },
        },
        :package_name => 'rpcbind',
        :service_name => 'rpcbind',
      },
    'el6' =>
      {
        :facts_hash => {
          :osfamily => 'RedHat',
          :operatingsystem => 'RedHat',
          :operatingsystemmajrelease => '6',
          :os => {
            'name' => 'RedHat',
            'family' => 'RedHat',
            'release' => {
              'full'  => '6.5',
              'major' => '6',
              'minor' => '5'
            }
          },
        },
        :package_name => 'rpcbind',
        :service_name => 'rpcbind',
      },
    'el7' =>
      {
        :facts_hash => {
          :osfamily => 'RedHat',
          :operatingsystem => 'RedHat',
          :operatingsystemmajrelease => '7',
          :os => {
            :name => 'RedHat',
            :family => 'RedHat',
            :release => {
              :full  => '7.0.1406',
              :major => '7',
              :minor => '0'
            }
          },
        },
        :package_name => 'rpcbind',
        :service_name => 'rpcbind',
      },
    'suse11' =>
      {
        :facts_hash => {
          :osfamily => 'Suse',
          :operatingsystem => 'SLES',
          :operatingsystemmajrelease => '11',
          :os => {
            'name' => 'openSUSE',
            'family' => 'Suse',
            'release' => {
              'full'  => '11.1',
              'major' => '11',
              'minor' => '1'
            }
          },
        },
        :package_name => 'rpcbind',
        :service_name => 'rpcbind',
      },
    'suse12' =>
      {
        :facts_hash => {
          :osfamily => 'Suse',
          :operatingsystem => 'SLES',
          :operatingsystemmajrelease => '12',
          :os => {
            'name' => 'openSUSE',
            'family' => 'Suse',
            'release' => {
              'full'  => '12.1',
              'major' => '12',
              'minor' => '1'
            }
          },
        },
        :package_name => 'rpcbind',
        :service_name => 'rpcbind',
      },
    'suse15' =>
      {
        :facts_hash => {
          :osfamily => 'Suse',
          :operatingsystem => 'SLES',
          :operatingsystemmajrelease => '15',
          :os => {
            'name' => 'SLES',
            'family' => 'Suse',
            'release' => {
              'full'  => '15.1',
              'major' => '15',
              'minor' => '1'
            }
          },
        },
        :package_name => 'rpcbind',
        :service_name => 'rpcbind',
      },
    'ubuntu1404' =>
      {
        :facts_hash => {
          :osfamily => 'Debian',
          :operatingsystem => 'Ubuntu',
          :os => {
            'release' => {
              'full'  => '14.04',
              'major' => '14.04'
            },
            'name'   => 'Ubuntu',
            'family' => 'Debian'
          },
        },
        :package_name => 'rpcbind',
        :service_name => 'rpcbind',
      },
    'ubuntu1604' =>
      {
        :facts_hash => {
          :osfamily => 'Debian',
          :operatingsystem => 'Ubuntu',
          :os => {
            'release' => {
              'full'  => '16.04',
              'major' => '16.04'
            },
            'name'   => 'Ubuntu',
            'family' => 'Debian'
          },
        },
        :package_name => 'rpcbind',
        :service_name => 'rpcbind',
      },
    'ubuntu1804' =>
      {
        :facts_hash => {
          :osfamily => 'Debian',
          :operatingsystem => 'Ubuntu',
          :os => {
            'release' => {
              'full'  => '18.04',
              'major' => '18.04'
            },
            'name'   => 'Ubuntu',
            'family' => 'Debian'
          },
        },
        :package_name => 'rpcbind',
        :service_name => 'rpcbind',
      },
  }
end

def unsupported_platforms
  {
    'el5' =>
      {
        :facts_hash => {
          :osfamily => 'RedHat',
          :operatingsystem => 'RedHat',
          :operatingsystemmajrelease => '5',
          :os => {
            'name' => 'RedHat',
            'family' => 'RedHat',
            'release' => {
              'full'  => '5.10',
              'major' => '5',
              'minor' => '10'
            },
          },
        },
      },
    'debian6' =>
      {
        :facts_hash => {
          :osfamily => 'Debian',
          :operatingsystem => 'Debian',
          :os => {
            'name' => 'Debian',
            'family' => 'Debian',
            'release' => {
              'full'  => '6.0.10',
              'major' => '6',
              'minor' => '0'
            },
          },
        },
      },
    'suse10' =>
      {
        :facts_hash => {
          :osfamily => 'Suse',
          :operatingsystem => 'SLES',
          :operatingsystemmajrelease => '10',
          :os => {
            'name' => 'Suse',
            'family' => 'Suse',
            'release' => {
              'full'  => '10.1',
              'major' => '10',
              'minor' => '1'
            }
          },
        },
      },
    'ubuntu1204' =>
      {
        :facts_hash => {
          :osfamily => 'Debian',
          :operatingsystem => 'Ubuntu',
          :os => {
            'release' => {
              'full'  => '12.04',
              'major' => '12.04'
            },
            'name'   => 'Ubuntu',
            'family' => 'Debian'
          },
        },
      },
    'solaris8' =>
      {
        :facts_hash => {
          :osfamily => 'Solaris',
          :operatingsystem => 'Solaris',
          :kernelrelease => '5.8',
          :os => {
            'release' => {
              'full'  => '5.8',
              'major' => '5',
            },
            'name'   => 'Solaris',
            'family' => 'Solaris'
          },
        }
      },
  }
end
