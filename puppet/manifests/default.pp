node default {
  class { 'epel': }->
  class { 'hubot':
    adapter    => 'irc',
    scripts    => ['http-post-say.coffee', 'history.coffee' ],
    build_deps => [ 'git', 'libxml2-devel', 'gcc-c++' ],
    env_export           => {
      'HUBOT_LOG_LEVEL'  => 'DEBUG',
      'HUBOT_IRC_SERVER' => 'localhost',
      'HUBOT_IRC_ROOMS'  => '#office,#support,#projects',
      'HUBOT_IRC_NICK'   => 'hubot',
    },
    dependencies      => {
      'hubot'         => '~2.6.5',
      'hubot-scripts' => '~2.5.7',
      'hubot-irc'     => '~0.1.24',
    },
  }

}
