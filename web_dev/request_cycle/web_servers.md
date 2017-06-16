RELEASE 1  

Key Design Philosophies of the Linux operating system.  
    I find that when it is all boiled down, there are just two top tier philosophies unique to Linux. 
        1.  USER RESPECT: linux assumes and allows users full access to the power of the operating system.  Unlike so many GUI interfaces, o
        
        2.  EASE OF ACCESS:  open sourced, long history, low cost, and a matching mindset by its users.   Its free, it has tons of free code libraries and user maintained support sites.  Everything about Linux, (from its cost to its rich code base for both clients and servers), serves to increase the ease of access.
What is VPS?
    A VPS (virtual private server) is a virtual server (i.e. software) that exists as a smaller piece of a larger, partitioned server.   The advantages of a VPS are many, and include, cost, ease of configuring and reconfiguring on the fly, the ability to have multiple OS versions partitioned into their own virtual machines, security advantages, and the general ability of having one real machine host many, many virtual servers. 

Why is it considered bad to run program as the root user on a Linux system?
    Primarily, it comes down to security, whether from malware or from user error or user maliciousness.  root users have full administrative powers, and any program you run as "root" also has full administrative powers.  While a non-admin account can't delete the OS out from under itself (and it can't delete another user's files), a root user can do both.  Additionally, destructive viruses gain more power if exploited under a root account as opposed to a basic user account. 

