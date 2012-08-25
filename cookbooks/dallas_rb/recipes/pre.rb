#
# Cookbook Name:: dallas_rb
# Recipe:: default
#

execute "/sbin/iptables -I INPUT 1 -p tcp --dport www -j ACCEPT" do
  not_if { `/sbin/iptables -L` =~ /dpt:www/ }
end

nginx_group = if platform?('ubuntu')
                'www-data'
              else
                'nginx'
              end

directory "/var/www/dallas_rb" do
  owner 'root'
  group nginx_group
  recursive true
end

file "/var/www/dallas_rb/index.html" do
  owner 'root'
  group nginx_group
  content <<-INDEX
  <!DOCTYPE html>
  <html>
    <head><title>What's up Dallas?</title></head>
    <body>
      <h1>You stay classy Dallas!</h1>
      <div>
        <img src="http://www.anchorman-quotes.info/wp-content/uploads/2010/10/Contact-us-anchorman-quotes.jpg" />
      </div>
      <h2>I'm Ron Burgandy?</h2>
    </body>
  </html>
  INDEX
end

cookbook_file "/etc/nginx/sites-available/dallas_rb"

if platform?('centos')
  execute 'mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.disabled' do
    only_if { File.exists?('/etc/nginx/conf.d/default.conf') }
  end
end

nginx_site "dallas_rb"
default_site = if platform?('ubuntu')
         'default'
       else
         '000-default'
       end
nginx_site default_site do
  enable false
end
