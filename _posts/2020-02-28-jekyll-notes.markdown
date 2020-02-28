---
layout: post
title: "jekyll notes"
date: "2020-02-28 22:57:36 +0800"
---
# 1. wsl 
- install wsl
- update apt-get

    ```bash
    sudo apt-get update -y && sudo apt-get upgrade -y
    ```

# 2. ruby
- install ruby

    ```bash
    sudo apt-add-repository ppa:brightbox/ruby-ng
    sudo apt-get update
    sudo apt-get install ruby2.5 ruby2.5-dev build-essential dh-autoreconf
    ```
    
- update gem

    ```bash
    gem update
    ```

# 3. jekyll
- install bundler & jekyll

    ```bash
    gem install jekyll bundler
    ```
    
- update .bashrc

    ```bash
    # Ruby exports
    export GEM_HOME=$HOME/gems
    export PATH=$HOME/gems/bin:$PATH
    ```
- start a new post

    ```bash
    nickkfwong.github.io> jekyll new .
    ```

- build jekyll

    ```bash
    nickkfwong.github.io> bundle exec jekyll build
    ```
    *a new folder named _site will be created for the compiled website*

- build jekyll, watch change for rebuild, run local web server

    ```bash
    nickkfwong.github.io> bundle exec jekyll serve
    ```

# Resource
[https://jekyllrb.com/docs/installation/windows/](https://jekyllrb.com/docs/installation/windows/)
[https://jekyllrb.com/docs/troubleshooting/#no-sudo](https://jekyllrb.com/docs/troubleshooting/#no-sudo)
