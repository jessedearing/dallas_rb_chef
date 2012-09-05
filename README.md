Infrastructure as Code: Introduction to Chef
============================================

This repo contains all the code for the talk done at the Dallas Ruby Brigade talk on
[Infrastructure as Code: Introduction to Chef](https://speakerdeck.com/u/jessedearing/p/infrastructure-as-code-introduction-to-chef).

## Prerequisites
To use this repo, please install the following gems:
* `chef`
* `vagrant`
* [VirtualBox](https://www.virtualbox.org/)

## Getting Started
If you don't have the precise64 base box. Run
`vagrant box add precise64 http://files.vagrantup.com/precise64.box`

Run `vagrant up` to create the box and provision it with chef-solo.

Connect to [http://localhost:8080](http://localhost:8080) in your web browser to see the
demo page.
