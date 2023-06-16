Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1CB19930;
	Fri, 16 Jun 2023 13:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686923312; x=1718459312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DbASQlzZ71aLt8w4TWh3pXUInLvlcqUaLm1T8q5SPDk=;
  b=Q9KqR+QXoRy2Oo2ZIde0UAJ0yys16zOQFNgakOKEVWSfRHjkM/jfakJ6
   7UeWrhSVw8ppyk08oaYRoH8tdbhRyxBYPBUTrJB+t0J/2DZVcr1eS723E
   1B133hfs5BXri+CCImkQLPylxhuX30VVym1m0Tb8B4fVUPzEBiAEJIeqX
   oCqkWEKnQSp33uMaJq9GjY1006ncq2dFGqCciKxb5vGqaaeKQM7pArv6O
   jYrsZkB2As09lUG8i2t3RDIiQwEbCu49ZSBQiQFZD5hEMWfbX9qJu87mY
   ae9aq0CzwT++qiXXifoKyDSkS0/9YjS9thx1LmghKtmqd1lep6sfG/QuA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="339545585"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="339545585"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 06:48:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="1043099972"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="1043099972"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 16 Jun 2023 06:48:29 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qA9oT-0001I4-0m;
	Fri, 16 Jun 2023 13:48:29 +0000
Date: Fri, 16 Jun 2023 21:47:43 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Granados <j.granados@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joelgranados:jag/sysctl-testing-for-0day 14/20]
 net/core/sysctl_net_core.c:715:65: error: too few arguments to function
 call, expected 4, have 3
Message-ID: <202306162138.tAhS2PnR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Joelgranados/linux.git jag/sysctl-testing-for-0day
head:   669cf696035fa888754f34d948b9488c2206dd7d
commit: 88e548722da320e210dc084d6ac3ffbea4162984 [14/20] sysctl: add size to the regsiter_net_sysctl function
config: x86_64-randconfig-r022-20230615 (https://download.01.org/0day-ci/archive/20230616/202306162138.tAhS2PnR-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230616/202306162138.tAhS2PnR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306162138.tAhS2PnR-lkp@intel.com/

Note: the joelgranados/jag/sysctl-testing-for-0day HEAD 669cf696035fa888754f34d948b9488c2206dd7d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> net/core/sysctl_net_core.c:715:65: error: too few arguments to function call, expected 4, have 3
           net->core.sysctl_hdr = register_net_sysctl(net, "net/core", tbl);
                                  ~~~~~~~~~~~~~~~~~~~                     ^
   include/net/net_namespace.h:474:26: note: 'register_net_sysctl' declared here
   struct ctl_table_header *register_net_sysctl(struct net *net, const char *path,
                            ^
   net/core/sysctl_net_core.c:748:59: error: too few arguments to function call, expected 4, have 3
           register_net_sysctl(&init_net, "net/core", net_core_table);
           ~~~~~~~~~~~~~~~~~~~                                      ^
   include/net/net_namespace.h:474:26: note: 'register_net_sysctl' declared here
   struct ctl_table_header *register_net_sysctl(struct net *net, const char *path,
                            ^
   2 errors generated.
--
>> net/core/neighbour.c:3845:68: error: too few arguments to function call, expected 4, have 3
                   register_net_sysctl(neigh_parms_net(p), neigh_path, t->neigh_vars);
                   ~~~~~~~~~~~~~~~~~~~                                              ^
   include/net/net_namespace.h:474:26: note: 'register_net_sysctl' declared here
   struct ctl_table_header *register_net_sysctl(struct net *net, const char *path,
                            ^
   1 error generated.
--
>> net/ipv4/ip_fragment.c:618:50: error: too few arguments to function call, expected 4, have 3
           hdr = register_net_sysctl(net, "net/ipv4", table);
                 ~~~~~~~~~~~~~~~~~~~                       ^
   include/net/net_namespace.h:474:26: note: 'register_net_sysctl' declared here
   struct ctl_table_header *register_net_sysctl(struct net *net, const char *path,
                            ^
   net/ipv4/ip_fragment.c:643:64: error: too few arguments to function call, expected 4, have 3
           register_net_sysctl(&init_net, "net/ipv4", ip4_frags_ctl_table);
           ~~~~~~~~~~~~~~~~~~~                                           ^
   include/net/net_namespace.h:474:26: note: 'register_net_sysctl' declared here
   struct ctl_table_header *register_net_sysctl(struct net *net, const char *path,
                            ^
   2 errors generated.
--
>> net/ipv4/devinet.c:2590:67: error: too few arguments to function call, expected 4, have 3
           t->sysctl_header = register_net_sysctl(net, path, t->devinet_vars);
                              ~~~~~~~~~~~~~~~~~~~                           ^
   include/net/net_namespace.h:474:26: note: 'register_net_sysctl' declared here
   struct ctl_table_header *register_net_sysctl(struct net *net, const char *path,
                            ^
   net/ipv4/devinet.c:2723:53: error: too few arguments to function call, expected 4, have 3
           forw_hdr = register_net_sysctl(net, "net/ipv4", tbl);
                      ~~~~~~~~~~~~~~~~~~~                     ^
   include/net/net_namespace.h:474:26: note: 'register_net_sysctl' declared here
   struct ctl_table_header *register_net_sysctl(struct net *net, const char *path,
                            ^
   2 errors generated.
--
>> net/ipv4/sysctl_net_ipv4.c:1503:65: error: too few arguments to function call, expected 4, have 3
           net->ipv4.ipv4_hdr = register_net_sysctl(net, "net/ipv4", table);
                                ~~~~~~~~~~~~~~~~~~~                       ^
   include/net/net_namespace.h:474:26: note: 'register_net_sysctl' declared here
   struct ctl_table_header *register_net_sysctl(struct net *net, const char *path,
                            ^
   net/ipv4/sysctl_net_ipv4.c:1541:61: error: too few arguments to function call, expected 4, have 3
           hdr = register_net_sysctl(&init_net, "net/ipv4", ipv4_table);
                 ~~~~~~~~~~~~~~~~~~~                                  ^
   include/net/net_namespace.h:474:26: note: 'register_net_sysctl' declared here
   struct ctl_table_header *register_net_sysctl(struct net *net, const char *path,
                            ^
   2 errors generated.
--
   net/ipv4/route.c:880:6: warning: variable 'log_martians' set but not used [-Wunused-but-set-variable]
           int log_martians;
               ^
>> net/ipv4/route.c:3618:70: error: too few arguments to function call, expected 4, have 3
           net->ipv4.route_hdr = register_net_sysctl(net, "net/ipv4/route", tbl);
                                 ~~~~~~~~~~~~~~~~~~~                           ^
   include/net/net_namespace.h:474:26: note: 'register_net_sysctl' declared here
   struct ctl_table_header *register_net_sysctl(struct net *net, const char *path,
                            ^
   net/ipv4/route.c:3778:67: error: too few arguments to function call, expected 4, have 3
           register_net_sysctl(&init_net, "net/ipv4/route", ipv4_route_table);
           ~~~~~~~~~~~~~~~~~~~                                              ^
   include/net/net_namespace.h:474:26: note: 'register_net_sysctl' declared here
   struct ctl_table_header *register_net_sysctl(struct net *net, const char *path,
                            ^
   1 warning and 2 errors generated.
--
>> net/unix/sysctl_net_unix.c:39:59: error: too few arguments to function call, expected 4, have 3
           net->unx.ctl = register_net_sysctl(net, "net/unix", table);
                          ~~~~~~~~~~~~~~~~~~~                       ^
   include/net/net_namespace.h:474:26: note: 'register_net_sysctl' declared here
   struct ctl_table_header *register_net_sysctl(struct net *net, const char *path,
                            ^
   1 error generated.
--
>> net/ipv6/addrconf.c:7089:57: error: too few arguments to function call, expected 4, have 3
           p->sysctl_header = register_net_sysctl(net, path, table);
                              ~~~~~~~~~~~~~~~~~~~                 ^
   include/net/net_namespace.h:474:26: note: 'register_net_sysctl' declared here
   struct ctl_table_header *register_net_sysctl(struct net *net, const char *path,
                            ^
   1 error generated.
--
>> net/ipv6/reassembly.c:473:50: error: too few arguments to function call, expected 4, have 3
           hdr = register_net_sysctl(net, "net/ipv6", table);
                 ~~~~~~~~~~~~~~~~~~~                       ^
   include/net/net_namespace.h:474:26: note: 'register_net_sysctl' declared here
   struct ctl_table_header *register_net_sysctl(struct net *net, const char *path,
                            ^
   net/ipv6/reassembly.c:502:23: error: too few arguments to function call, expected 4, have 3
                           ip6_frags_ctl_table);
                                              ^
   include/net/net_namespace.h:474:26: note: 'register_net_sysctl' declared here
   struct ctl_table_header *register_net_sysctl(struct net *net, const char *path,
                            ^
   2 errors generated.
--
>> net/ipv6/sysctl_net_ipv6.c:278:72: error: too few arguments to function call, expected 4, have 3
           net->ipv6.sysctl.hdr = register_net_sysctl(net, "net/ipv6", ipv6_table);
                                  ~~~~~~~~~~~~~~~~~~~                            ^
   include/net/net_namespace.h:474:26: note: 'register_net_sysctl' declared here
   struct ctl_table_header *register_net_sysctl(struct net *net, const char *path,
                            ^
   net/ipv6/sysctl_net_ipv6.c:283:62: error: too few arguments to function call, expected 4, have 3
                   register_net_sysctl(net, "net/ipv6/route", ipv6_route_table);
                   ~~~~~~~~~~~~~~~~~~~                                        ^
   include/net/net_namespace.h:474:26: note: 'register_net_sysctl' declared here
   struct ctl_table_header *register_net_sysctl(struct net *net, const char *path,
                            ^
   net/ipv6/sysctl_net_ipv6.c:288:60: error: too few arguments to function call, expected 4, have 3
                   register_net_sysctl(net, "net/ipv6/icmp", ipv6_icmp_table);
                   ~~~~~~~~~~~~~~~~~~~                                      ^
   include/net/net_namespace.h:474:26: note: 'register_net_sysctl' declared here
   struct ctl_table_header *register_net_sysctl(struct net *net, const char *path,
                            ^
   net/ipv6/sysctl_net_ipv6.c:338:70: error: too few arguments to function call, expected 4, have 3
           ip6_header = register_net_sysctl(&init_net, "net/ipv6", ipv6_rotable);
                        ~~~~~~~~~~~~~~~~~~~                                    ^
   include/net/net_namespace.h:474:26: note: 'register_net_sysctl' declared here
   struct ctl_table_header *register_net_sysctl(struct net *net, const char *path,
                            ^
   4 errors generated.


vim +715 net/core/sysctl_net_core.c

316cdaa1158af1 Mahesh Bandewar   2020-08-26  700  
024626e36d75fc Pavel Emelyanov   2007-12-08  701  static __net_init int sysctl_core_net_init(struct net *net)
024626e36d75fc Pavel Emelyanov   2007-12-08  702  {
e187013abeb4c2 Akhmat Karakotov  2022-01-31  703  	struct ctl_table *tbl, *tmp;
024626e36d75fc Pavel Emelyanov   2007-12-08  704  
d5a4502e9efa53 Pavel Emelyanov   2008-05-19  705  	tbl = netns_core_table;
09ad9bc752519c Octavian Purdila  2009-11-25  706  	if (!net_eq(net, &init_net)) {
d5a4502e9efa53 Pavel Emelyanov   2008-05-19  707  		tbl = kmemdup(tbl, sizeof(netns_core_table), GFP_KERNEL);
024626e36d75fc Pavel Emelyanov   2007-12-08  708  		if (tbl == NULL)
024626e36d75fc Pavel Emelyanov   2007-12-08  709  			goto err_dup;
024626e36d75fc Pavel Emelyanov   2007-12-08  710  
e187013abeb4c2 Akhmat Karakotov  2022-01-31  711  		for (tmp = tbl; tmp->procname; tmp++)
e187013abeb4c2 Akhmat Karakotov  2022-01-31  712  			tmp->data += (char *)net - (char *)&init_net;
790a35328991b0 Pavel Emelyanov   2007-12-08  713  	}
024626e36d75fc Pavel Emelyanov   2007-12-08  714  
ec8f23ce0f4005 Eric W. Biederman 2012-04-19 @715  	net->core.sysctl_hdr = register_net_sysctl(net, "net/core", tbl);
8efa6e93cb2666 Pavel Emelyanov   2008-03-31  716  	if (net->core.sysctl_hdr == NULL)
024626e36d75fc Pavel Emelyanov   2007-12-08  717  		goto err_reg;
024626e36d75fc Pavel Emelyanov   2007-12-08  718  
024626e36d75fc Pavel Emelyanov   2007-12-08  719  	return 0;
024626e36d75fc Pavel Emelyanov   2007-12-08  720  
024626e36d75fc Pavel Emelyanov   2007-12-08  721  err_reg:
d5a4502e9efa53 Pavel Emelyanov   2008-05-19  722  	if (tbl != netns_core_table)
024626e36d75fc Pavel Emelyanov   2007-12-08  723  		kfree(tbl);
024626e36d75fc Pavel Emelyanov   2007-12-08  724  err_dup:
024626e36d75fc Pavel Emelyanov   2007-12-08  725  	return -ENOMEM;
024626e36d75fc Pavel Emelyanov   2007-12-08  726  }
024626e36d75fc Pavel Emelyanov   2007-12-08  727  

:::::: The code at line 715 was first introduced by commit
:::::: ec8f23ce0f4005b74013d4d122e0d540397a93c9 net: Convert all sysctl registrations to register_net_sysctl

:::::: TO: Eric W. Biederman <ebiederm@xmission.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
