Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51221A939;
	Tue, 14 Mar 2023 20:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678825196; x=1710361196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iUCLvMWna6qsT040TVDLuyxjP9Pxncduxzor9TpTpiM=;
  b=Rjmrj9oEr9YNgv8Hz3oxng3RPvI1aTEmYilzL2I1XRwKylPAJ17ltmwW
   Q+mNHaZ3lvNtxrnKbVAmBBXQDpWLiImiQp0dEcsnJUjhOsRlFYzKPjaoL
   UGJvPOZqjmcPEjcKiFLJM/RHXLXV3Cm8+G02bidtDiqXO8agdrQl5MlBI
   ve3R/0qsOlj4rzbqCwo1YRffDu9cfb1+s2/KSsS8iF68/UOgIZ3VxRBUP
   12UriougfNJr5lVBdO9o16O5FY0LYilsFKtd2/6la+owJdzpzPlAJ5URv
   /25YkDBC3niNshWUH18bLalE6FZDnFGNS553N4j21tm7wR3/3FjO7bUaO
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="339075174"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="339075174"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 13:19:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="629181742"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="629181742"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 14 Mar 2023 13:19:51 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcB7e-0007Ag-1G;
	Tue, 14 Mar 2023 20:19:50 +0000
Date: Wed, 15 Mar 2023 04:19:22 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:pipe-list 35/39] net/tls/tls_main.c:939:26: error: no
 member named 'sendpage_locked' in 'struct proto_ops'; did you mean
 'sendmsg_locked'?
Message-ID: <202303150409.YJCQqAx5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git pipe-list
head:   04b41c19739aec7e0cae6cba28b4e317d703a614
commit: 16c1a5866002502b637ee10de3f53e4b6da13696 [35/39] sock: Remove ->sendpage*() in favour of sendmsg(MSG_SPLICE_PAGES)
config: i386-randconfig-a012-20230313 (https://download.01.org/0day-ci/archive/20230315/202303150409.YJCQqAx5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=16c1a5866002502b637ee10de3f53e4b6da13696
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs pipe-list
        git checkout 16c1a5866002502b637ee10de3f53e4b6da13696
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303150409.YJCQqAx5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/tls/tls_main.c:939:26: error: no member named 'sendpage_locked' in 'struct proto_ops'; did you mean 'sendmsg_locked'?
           ops[TLS_SW  ][TLS_BASE].sendpage_locked = tls_sw_sendpage_locked;
                                   ^~~~~~~~~~~~~~~
                                   sendmsg_locked
   include/linux/net.h:221:9: note: 'sendmsg_locked' declared here
           int             (*sendmsg_locked)(struct sock *sk, struct msghdr *msg,
                             ^
>> net/tls/tls_main.c:1007:25: error: no member named 'sendpage' in 'struct proto'
           prot[TLS_SW][TLS_BASE].sendpage         = tls_sw_sendpage;
           ~~~~~~~~~~~~~~~~~~~~~~ ^
   2 errors generated.
--
>> net/smc/af_smc.c:3143:8: error: implicit declaration of function 'kernel_sendpage' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   rc = kernel_sendpage(smc->clcsock, page, offset,
                        ^
   net/smc/af_smc.c:3143:8: note: did you mean 'kernel_sendmsg'?
   include/linux/net.h:324:5: note: 'kernel_sendmsg' declared here
   int kernel_sendmsg(struct socket *sock, struct msghdr *msg, struct kvec *vec,
       ^
>> net/smc/af_smc.c:3227:3: error: field designator 'sendpage' does not refer to any field in type 'const struct proto_ops'
           .sendpage       = smc_sendpage,
            ^
   2 errors generated.


vim +939 net/tls/tls_main.c

dd0bed1665d6ca Atul Gupta     2018-03-31   932  
f3911f73f51d15 Jakub Kicinski 2021-11-24   933  static void build_proto_ops(struct proto_ops ops[TLS_NUM_CONFIG][TLS_NUM_CONFIG],
f3911f73f51d15 Jakub Kicinski 2021-11-24   934  			    const struct proto_ops *base)
f3911f73f51d15 Jakub Kicinski 2021-11-24   935  {
f3911f73f51d15 Jakub Kicinski 2021-11-24   936  	ops[TLS_BASE][TLS_BASE] = *base;
f3911f73f51d15 Jakub Kicinski 2021-11-24   937  
f3911f73f51d15 Jakub Kicinski 2021-11-24   938  	ops[TLS_SW  ][TLS_BASE] = ops[TLS_BASE][TLS_BASE];
f3911f73f51d15 Jakub Kicinski 2021-11-24  @939  	ops[TLS_SW  ][TLS_BASE].sendpage_locked	= tls_sw_sendpage_locked;
f3911f73f51d15 Jakub Kicinski 2021-11-24   940  
f3911f73f51d15 Jakub Kicinski 2021-11-24   941  	ops[TLS_BASE][TLS_SW  ] = ops[TLS_BASE][TLS_BASE];
f3911f73f51d15 Jakub Kicinski 2021-11-24   942  	ops[TLS_BASE][TLS_SW  ].splice_read	= tls_sw_splice_read;
f3911f73f51d15 Jakub Kicinski 2021-11-24   943  
f3911f73f51d15 Jakub Kicinski 2021-11-24   944  	ops[TLS_SW  ][TLS_SW  ] = ops[TLS_SW  ][TLS_BASE];
f3911f73f51d15 Jakub Kicinski 2021-11-24   945  	ops[TLS_SW  ][TLS_SW  ].splice_read	= tls_sw_splice_read;
f3911f73f51d15 Jakub Kicinski 2021-11-24   946  
f3911f73f51d15 Jakub Kicinski 2021-11-24   947  #ifdef CONFIG_TLS_DEVICE
f3911f73f51d15 Jakub Kicinski 2021-11-24   948  	ops[TLS_HW  ][TLS_BASE] = ops[TLS_BASE][TLS_BASE];
f3911f73f51d15 Jakub Kicinski 2021-11-24   949  	ops[TLS_HW  ][TLS_BASE].sendpage_locked	= NULL;
f3911f73f51d15 Jakub Kicinski 2021-11-24   950  
f3911f73f51d15 Jakub Kicinski 2021-11-24   951  	ops[TLS_HW  ][TLS_SW  ] = ops[TLS_BASE][TLS_SW  ];
f3911f73f51d15 Jakub Kicinski 2021-11-24   952  	ops[TLS_HW  ][TLS_SW  ].sendpage_locked	= NULL;
f3911f73f51d15 Jakub Kicinski 2021-11-24   953  
f3911f73f51d15 Jakub Kicinski 2021-11-24   954  	ops[TLS_BASE][TLS_HW  ] = ops[TLS_BASE][TLS_SW  ];
f3911f73f51d15 Jakub Kicinski 2021-11-24   955  
f3911f73f51d15 Jakub Kicinski 2021-11-24   956  	ops[TLS_SW  ][TLS_HW  ] = ops[TLS_SW  ][TLS_SW  ];
f3911f73f51d15 Jakub Kicinski 2021-11-24   957  
f3911f73f51d15 Jakub Kicinski 2021-11-24   958  	ops[TLS_HW  ][TLS_HW  ] = ops[TLS_HW  ][TLS_SW  ];
f3911f73f51d15 Jakub Kicinski 2021-11-24   959  	ops[TLS_HW  ][TLS_HW  ].sendpage_locked	= NULL;
f3911f73f51d15 Jakub Kicinski 2021-11-24   960  #endif
f3911f73f51d15 Jakub Kicinski 2021-11-24   961  #ifdef CONFIG_TLS_TOE
f3911f73f51d15 Jakub Kicinski 2021-11-24   962  	ops[TLS_HW_RECORD][TLS_HW_RECORD] = *base;
f3911f73f51d15 Jakub Kicinski 2021-11-24   963  #endif
f3911f73f51d15 Jakub Kicinski 2021-11-24   964  }
f3911f73f51d15 Jakub Kicinski 2021-11-24   965  
63a6b3fee428ae Atul Gupta     2019-01-17   966  static void tls_build_proto(struct sock *sk)
63a6b3fee428ae Atul Gupta     2019-01-17   967  {
63a6b3fee428ae Atul Gupta     2019-01-17   968  	int ip_ver = sk->sk_family == AF_INET6 ? TLSV6 : TLSV4;
9a8939490d401f Will Deacon    2020-04-14   969  	struct proto *prot = READ_ONCE(sk->sk_prot);
63a6b3fee428ae Atul Gupta     2019-01-17   970  
63a6b3fee428ae Atul Gupta     2019-01-17   971  	/* Build IPv6 TLS whenever the address of tcpv6 _prot changes */
63a6b3fee428ae Atul Gupta     2019-01-17   972  	if (ip_ver == TLSV6 &&
5bb4c45d466cb2 Jakub Sitnicki 2020-03-17   973  	    unlikely(prot != smp_load_acquire(&saved_tcpv6_prot))) {
63a6b3fee428ae Atul Gupta     2019-01-17   974  		mutex_lock(&tcpv6_prot_mutex);
5bb4c45d466cb2 Jakub Sitnicki 2020-03-17   975  		if (likely(prot != saved_tcpv6_prot)) {
5bb4c45d466cb2 Jakub Sitnicki 2020-03-17   976  			build_protos(tls_prots[TLSV6], prot);
f3911f73f51d15 Jakub Kicinski 2021-11-24   977  			build_proto_ops(tls_proto_ops[TLSV6],
f3911f73f51d15 Jakub Kicinski 2021-11-24   978  					sk->sk_socket->ops);
5bb4c45d466cb2 Jakub Sitnicki 2020-03-17   979  			smp_store_release(&saved_tcpv6_prot, prot);
63a6b3fee428ae Atul Gupta     2019-01-17   980  		}
63a6b3fee428ae Atul Gupta     2019-01-17   981  		mutex_unlock(&tcpv6_prot_mutex);
63a6b3fee428ae Atul Gupta     2019-01-17   982  	}
63a6b3fee428ae Atul Gupta     2019-01-17   983  
63a6b3fee428ae Atul Gupta     2019-01-17   984  	if (ip_ver == TLSV4 &&
5bb4c45d466cb2 Jakub Sitnicki 2020-03-17   985  	    unlikely(prot != smp_load_acquire(&saved_tcpv4_prot))) {
63a6b3fee428ae Atul Gupta     2019-01-17   986  		mutex_lock(&tcpv4_prot_mutex);
5bb4c45d466cb2 Jakub Sitnicki 2020-03-17   987  		if (likely(prot != saved_tcpv4_prot)) {
5bb4c45d466cb2 Jakub Sitnicki 2020-03-17   988  			build_protos(tls_prots[TLSV4], prot);
f3911f73f51d15 Jakub Kicinski 2021-11-24   989  			build_proto_ops(tls_proto_ops[TLSV4],
f3911f73f51d15 Jakub Kicinski 2021-11-24   990  					sk->sk_socket->ops);
5bb4c45d466cb2 Jakub Sitnicki 2020-03-17   991  			smp_store_release(&saved_tcpv4_prot, prot);
63a6b3fee428ae Atul Gupta     2019-01-17   992  		}
63a6b3fee428ae Atul Gupta     2019-01-17   993  		mutex_unlock(&tcpv4_prot_mutex);
63a6b3fee428ae Atul Gupta     2019-01-17   994  	}
63a6b3fee428ae Atul Gupta     2019-01-17   995  }
63a6b3fee428ae Atul Gupta     2019-01-17   996  
f66de3ee2c161f Boris Pismenny 2018-04-30   997  static void build_protos(struct proto prot[TLS_NUM_CONFIG][TLS_NUM_CONFIG],
f13fe3e60c799e Jakub Sitnicki 2020-03-17   998  			 const struct proto *base)
c113187d38ff85 Boris Pismenny 2018-02-27   999  {
f66de3ee2c161f Boris Pismenny 2018-04-30  1000  	prot[TLS_BASE][TLS_BASE] = *base;
f66de3ee2c161f Boris Pismenny 2018-04-30  1001  	prot[TLS_BASE][TLS_BASE].setsockopt	= tls_setsockopt;
f66de3ee2c161f Boris Pismenny 2018-04-30  1002  	prot[TLS_BASE][TLS_BASE].getsockopt	= tls_getsockopt;
f66de3ee2c161f Boris Pismenny 2018-04-30  1003  	prot[TLS_BASE][TLS_BASE].close		= tls_sk_proto_close;
c113187d38ff85 Boris Pismenny 2018-02-27  1004  
f66de3ee2c161f Boris Pismenny 2018-04-30  1005  	prot[TLS_SW][TLS_BASE] = prot[TLS_BASE][TLS_BASE];
f66de3ee2c161f Boris Pismenny 2018-04-30  1006  	prot[TLS_SW][TLS_BASE].sendmsg		= tls_sw_sendmsg;
f66de3ee2c161f Boris Pismenny 2018-04-30 @1007  	prot[TLS_SW][TLS_BASE].sendpage		= tls_sw_sendpage;
c46234ebb4d1ee Dave Watson    2018-03-22  1008  
f66de3ee2c161f Boris Pismenny 2018-04-30  1009  	prot[TLS_BASE][TLS_SW] = prot[TLS_BASE][TLS_BASE];
f66de3ee2c161f Boris Pismenny 2018-04-30  1010  	prot[TLS_BASE][TLS_SW].recvmsg		  = tls_sw_recvmsg;
7b50ecfcc6cdfe Cong Wang      2021-10-08  1011  	prot[TLS_BASE][TLS_SW].sock_is_readable   = tls_sw_sock_is_readable;
f66de3ee2c161f Boris Pismenny 2018-04-30  1012  	prot[TLS_BASE][TLS_SW].close		  = tls_sk_proto_close;
c46234ebb4d1ee Dave Watson    2018-03-22  1013  
f66de3ee2c161f Boris Pismenny 2018-04-30  1014  	prot[TLS_SW][TLS_SW] = prot[TLS_SW][TLS_BASE];
f66de3ee2c161f Boris Pismenny 2018-04-30  1015  	prot[TLS_SW][TLS_SW].recvmsg		= tls_sw_recvmsg;
7b50ecfcc6cdfe Cong Wang      2021-10-08  1016  	prot[TLS_SW][TLS_SW].sock_is_readable   = tls_sw_sock_is_readable;
f66de3ee2c161f Boris Pismenny 2018-04-30  1017  	prot[TLS_SW][TLS_SW].close		= tls_sk_proto_close;
dd0bed1665d6ca Atul Gupta     2018-03-31  1018  

:::::: The code at line 939 was first introduced by commit
:::::: f3911f73f51d1534f4db70b516cc1fcb6be05bae tls: fix replacing proto_ops

:::::: TO: Jakub Kicinski <kuba@kernel.org>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
