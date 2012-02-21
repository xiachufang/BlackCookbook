# -*- coding: utf-8 -*-
#现在是 2012-02-21 Tue 15:11 ，刚刚我在根目录下执行如下代码，为每个子目录生成了
#一个空的 README.md

Dir['**'].each { |f| exec "touch #{f}/README.md" if File.directory?f}
