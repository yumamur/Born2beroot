# Born2beroot
<q font-size=30>If you see a command for the first time, I recommend to RTFM!</q>
## User, Sudo & SSH
**sudo** package is automatically installed. We can check it by `sudo -l`.<br />
If not, `dnf install sudo`

We only have a root user. Since the root user is authorized to do **anything**,
we should create a user to prevent some accidents.<br />(***user-name*** is referred to your intra.42 user name)
```
useradd user-name
```
Appearently, RedHat family creates and uses "**wheel**" group as **sudo**.
```
usermod -aG wheel user-name
passwd user-name
```
Set a simple, easy to type password, or else you will regret it. It can be changed later.

One might ask oneself 'Why is it, if sudo has root priviledges?'. Sudo has capability of being further configurated,
such as defining which files/commands can/can't the specified user/group access. So, sudo does not have to authorize
a user as root.

And also, there is SELinux. SELinux has more complicated, layered and, therefore, more secure configuration.
I would definitely recommend reading <a href="https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/using_selinux/getting-started-with-selinux_using-selinux">this article</a>
of RedHat. 

As you can do the config below in other ways, I've found that the easiest is:
```
dnf install python-policycoreutils setools
```
semanage port -a -t ssh_port_t -p tcp 4242

firewall-cmd --zone=public --add-port=4242/tcp

TO BE COUNTINUED...
