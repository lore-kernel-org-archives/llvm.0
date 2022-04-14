Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FC728F5
	for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 13:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649943245; x=1681479245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UNppWNaeAIa10Dki/dKqomPYngkMUhRRYFw1rQFeEto=;
  b=MKcN6L23TZ6mswotDEagbiJBQfYc2utbLGv1nTT3KDM3YouY70w5vuxg
   f8M+gOhwdfxC1FgEtLxx7NoZnaqQTFfl9ta2GmK4VxSb5B+iwE/FFl5Bv
   EskT4S/XDfI63AlGhPFT0zXGmOubrw3E/ctBstiWg5VG5N3q+1/I0gYdm
   YC/6BMYSDTfroKH4MLbFv0VT/ZMaqtuIZv6emOA6gqXlrYnvxyHAhoTQA
   WD16GfoOloa9yOgEuvOsdbEyHu3OVOxjWFeHMzQhovujQA4XyMLmZ9bSj
   yIYnRE7dfp/agVKT6b/MdiK3TPxUhMU8oMtVaN9ewtUSDAIdOjjCHyZl1
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="260525468"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; 
   d="scan'208";a="260525468"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2022 06:34:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; 
   d="scan'208";a="508406979"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 14 Apr 2022 06:34:03 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nezbm-0000zx-Cz;
	Thu, 14 Apr 2022 13:34:02 +0000
Date: Thu, 14 Apr 2022 21:33:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [axboe-block:sock-nolock.2 5/5] net/mptcp/subflow.c:1796:20: error:
 too few arguments to function call, expected 2, have 1
Message-ID: <202204142114.rOCzHB7d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git sock-nolock.2
head:   95f2e3bd27b30244f79deacbc1aac49d294bd854
commit: 95f2e3bd27b30244f79deacbc1aac49d294bd854 [5/5] net: allow sk_prot->release_cb() without sock lock held
config: hexagon-randconfig-r041-20220414 (https://download.01.org/0day-ci/archive/20220414/202204142114.rOCzHB7d-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b7e6ea489f6dd45a9b0da9ac20871560917b9b0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=95f2e3bd27b30244f79deacbc1aac49d294bd854
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block sock-nolock.2
        git checkout 95f2e3bd27b30244f79deacbc1aac49d294bd854
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash net/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> net/mptcp/subflow.c:1796:20: error: too few arguments to function call, expected 2, have 1
           tcp_release_cb(ssk);
           ~~~~~~~~~~~~~~    ^
   include/net/tcp.h:337:6: note: 'tcp_release_cb' declared here
   void tcp_release_cb(struct sock *sk, bool locked);
        ^
>> net/mptcp/subflow.c:1841:31: error: incompatible function pointer types assigning to 'void (*)(struct sock *, bool)' (aka 'void (*)(struct sock *, _Bool)') from 'void (struct sock *)' [-Werror,-Wincompatible-function-pointer-types]
           tcp_prot_override.release_cb = tcp_release_cb_override;
                                        ^ ~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +1796 net/mptcp/subflow.c

cec37a6e41aae7 Peter Krystad    2020-01-21  1788  
b19bc2945b40b9 Paolo Abeni      2021-01-20  1789  static void tcp_release_cb_override(struct sock *ssk)
b19bc2945b40b9 Paolo Abeni      2021-01-20  1790  {
b19bc2945b40b9 Paolo Abeni      2021-01-20  1791  	struct mptcp_subflow_context *subflow = mptcp_subflow_ctx(ssk);
b19bc2945b40b9 Paolo Abeni      2021-01-20  1792  
b19bc2945b40b9 Paolo Abeni      2021-01-20  1793  	if (mptcp_subflow_has_delegated_action(subflow))
b19bc2945b40b9 Paolo Abeni      2021-01-20  1794  		mptcp_subflow_process_delegated(ssk);
b19bc2945b40b9 Paolo Abeni      2021-01-20  1795  
b19bc2945b40b9 Paolo Abeni      2021-01-20 @1796  	tcp_release_cb(ssk);
b19bc2945b40b9 Paolo Abeni      2021-01-20  1797  }
b19bc2945b40b9 Paolo Abeni      2021-01-20  1798  
2303f994b3e187 Peter Krystad    2020-01-21  1799  static struct tcp_ulp_ops subflow_ulp_ops __read_mostly = {
2303f994b3e187 Peter Krystad    2020-01-21  1800  	.name		= "mptcp",
2303f994b3e187 Peter Krystad    2020-01-21  1801  	.owner		= THIS_MODULE,
2303f994b3e187 Peter Krystad    2020-01-21  1802  	.init		= subflow_ulp_init,
2303f994b3e187 Peter Krystad    2020-01-21  1803  	.release	= subflow_ulp_release,
cec37a6e41aae7 Peter Krystad    2020-01-21  1804  	.clone		= subflow_ulp_clone,
2303f994b3e187 Peter Krystad    2020-01-21  1805  };
2303f994b3e187 Peter Krystad    2020-01-21  1806  
cec37a6e41aae7 Peter Krystad    2020-01-21  1807  static int subflow_ops_init(struct request_sock_ops *subflow_ops)
cec37a6e41aae7 Peter Krystad    2020-01-21  1808  {
cec37a6e41aae7 Peter Krystad    2020-01-21  1809  	subflow_ops->obj_size = sizeof(struct mptcp_subflow_request_sock);
cec37a6e41aae7 Peter Krystad    2020-01-21  1810  	subflow_ops->slab_name = "request_sock_subflow";
cec37a6e41aae7 Peter Krystad    2020-01-21  1811  
cec37a6e41aae7 Peter Krystad    2020-01-21  1812  	subflow_ops->slab = kmem_cache_create(subflow_ops->slab_name,
cec37a6e41aae7 Peter Krystad    2020-01-21  1813  					      subflow_ops->obj_size, 0,
cec37a6e41aae7 Peter Krystad    2020-01-21  1814  					      SLAB_ACCOUNT |
cec37a6e41aae7 Peter Krystad    2020-01-21  1815  					      SLAB_TYPESAFE_BY_RCU,
cec37a6e41aae7 Peter Krystad    2020-01-21  1816  					      NULL);
cec37a6e41aae7 Peter Krystad    2020-01-21  1817  	if (!subflow_ops->slab)
cec37a6e41aae7 Peter Krystad    2020-01-21  1818  		return -ENOMEM;
cec37a6e41aae7 Peter Krystad    2020-01-21  1819  
79c0949e9a09f6 Peter Krystad    2020-01-21  1820  	subflow_ops->destructor = subflow_req_destructor;
79c0949e9a09f6 Peter Krystad    2020-01-21  1821  
cec37a6e41aae7 Peter Krystad    2020-01-21  1822  	return 0;
cec37a6e41aae7 Peter Krystad    2020-01-21  1823  }
cec37a6e41aae7 Peter Krystad    2020-01-21  1824  
d39dceca388ad0 Paolo Abeni      2020-06-26  1825  void __init mptcp_subflow_init(void)
2303f994b3e187 Peter Krystad    2020-01-21  1826  {
08b8d080982fec Florian Westphal 2020-07-30  1827  	mptcp_subflow_request_sock_ops = tcp_request_sock_ops;
08b8d080982fec Florian Westphal 2020-07-30  1828  	if (subflow_ops_init(&mptcp_subflow_request_sock_ops) != 0)
cec37a6e41aae7 Peter Krystad    2020-01-21  1829  		panic("MPTCP: failed to init subflow request sock ops\n");
cec37a6e41aae7 Peter Krystad    2020-01-21  1830  
cec37a6e41aae7 Peter Krystad    2020-01-21  1831  	subflow_request_sock_ipv4_ops = tcp_request_sock_ipv4_ops;
7ea851d19b2359 Florian Westphal 2020-11-30  1832  	subflow_request_sock_ipv4_ops.route_req = subflow_v4_route_req;
cec37a6e41aae7 Peter Krystad    2020-01-21  1833  
cec37a6e41aae7 Peter Krystad    2020-01-21  1834  	subflow_specific = ipv4_specific;
cec37a6e41aae7 Peter Krystad    2020-01-21  1835  	subflow_specific.conn_request = subflow_v4_conn_request;
cec37a6e41aae7 Peter Krystad    2020-01-21  1836  	subflow_specific.syn_recv_sock = subflow_syn_recv_sock;
cec37a6e41aae7 Peter Krystad    2020-01-21  1837  	subflow_specific.sk_rx_dst_set = subflow_finish_connect;
4cf86ae84c7183 Paolo Abeni      2022-03-07  1838  	subflow_specific.rebuild_header = subflow_rebuild_header;
cec37a6e41aae7 Peter Krystad    2020-01-21  1839  
b19bc2945b40b9 Paolo Abeni      2021-01-20  1840  	tcp_prot_override = tcp_prot;
b19bc2945b40b9 Paolo Abeni      2021-01-20 @1841  	tcp_prot_override.release_cb = tcp_release_cb_override;
b19bc2945b40b9 Paolo Abeni      2021-01-20  1842  

:::::: The code at line 1796 was first introduced by commit
:::::: b19bc2945b40b9fd38e835700907ffe8534ef0de mptcp: implement delegated actions

:::::: TO: Paolo Abeni <pabeni@redhat.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
