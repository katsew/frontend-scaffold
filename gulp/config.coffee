paths =
  src:
    jade: 'assets/jade'
    stylus: 'assets/stylus'
    coffee: 'assets/coffee'
    image: 'assets/image'
    spec: 'test/spec'
    fixture: 'test/fixture/jade'
    public: 'public'

  dest:
    css: 'public/css'
    bower: 'public/vendor'
    js: 'public/js'
    image: 'public/image'
    fixture: 'test/fixture'
    html: 'public/html'
    sprite:
      css: 'assets/stylus/sprite'
      image: 'public/image/sprite'

  tmp:
    js: 'tmp/js'


module.exports =
  paths: paths
