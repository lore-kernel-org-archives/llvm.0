Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F403A7B
	for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 01:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651195001; x=1682731001;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JKAWPyMmGWeSqGKBDfdla8W3JVW6ENVJgotiQ/gpd0k=;
  b=P/MF3hUmm3vSfK/MCnDhd0IFCFmlu21/jo2i8yVP8skRy7vUZ/Ecjf3K
   bFadbrVhv3+9OiXBQOMzQ56aOhGC2HQdHbki7dZYQjJAuj5Ynprw7K3X3
   8MnGqPu62LXXd6JEc/eEaf2tKGcqXO/1mF6u1eYKVS1DJYe5mEBQrjJM6
   IdXLtHOqx7f1foPcZid4ACRRMaXOfozjGo+r6yrKaaa/Sx7+/0/BusOw6
   idSiRk7PDzJ3Zd8gnOi4aMzxT6ZVKwY2Klc0u0o6M3nT6jNf3Sd9GMQ84
   aOaJLV7POebI3px5SPfb5YwEIf44BxGGyrhf2iOETVqLzbhd9VKWs9DSK
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="265334559"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; 
   d="scan'208";a="265334559"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2022 18:16:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; 
   d="scan'208";a="731798937"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Apr 2022 18:16:38 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nkFFO-0005qB-8I;
	Fri, 29 Apr 2022 01:16:38 +0000
Date: Fri, 29 Apr 2022 09:15:55 +0800
From: kernel test robot <lkp@intel.com>
To: Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [trondmy-nfs-2.6:testing 4/10] net/sunrpc/xprtsock.c:1436:23:
 warning: variable 'transport' is uninitialized when used here
Message-ID: <202204290947.alhq7Gbj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.linux-nfs.org/projects/trondmy/nfs-2.6.git testing
head:   b44c0c653b27127aba20075ef53b0d641a36a3ae
commit: 8869b563cd42a4cb725604322454ed4fb29a0c18 [4/10] SUNRPC: Ensure timely close of disconnected AF_LOCAL sockets
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20220429/202204290947.alhq7Gbj-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c59473aacce38cd7dd77eebceaf3c98c5707ab3b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add trondmy-nfs-2.6 git://git.linux-nfs.org/projects/trondmy/nfs-2.6.git
        git fetch --no-tags trondmy-nfs-2.6 testing
        git checkout 8869b563cd42a4cb725604322454ed4fb29a0c18
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/sunrpc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from net/sunrpc/xprtsock.c:36:
   In file included from include/linux/sunrpc/clnt.h:20:
   In file included from include/linux/sunrpc/sched.h:19:
   include/linux/sunrpc/xdr.h:734:10: warning: result of comparison of constant 4611686018427387903 with expression of type '__u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
           if (len > SIZE_MAX / sizeof(*p))
               ~~~ ^ ~~~~~~~~~~~~~~~~~~~~~
>> net/sunrpc/xprtsock.c:1436:23: warning: variable 'transport' is uninitialized when used here [-Wuninitialized]
                   xs_run_error_worker(transport, XPRT_SOCK_WAKE_DISCONNECT);
                                       ^~~~~~~~~
   net/sunrpc/xprtsock.c:1429:29: note: initialize the variable 'transport' to silence this warning
           struct sock_xprt *transport;
                                      ^
                                       = NULL
   2 warnings generated.


vim +/transport +1436 net/sunrpc/xprtsock.c

  1420	
  1421	/**
  1422	 * xs_local_state_change - callback to handle AF_LOCAL socket state changes
  1423	 * @sk: socket whose state has changed
  1424	 *
  1425	 */
  1426	static void xs_local_state_change(struct sock *sk)
  1427	{
  1428		struct rpc_xprt *xprt;
  1429		struct sock_xprt *transport;
  1430	
  1431		if (!(xprt = xprt_from_sock(sk)))
  1432			return;
  1433		if (sk->sk_shutdown & SHUTDOWN_MASK) {
  1434			clear_bit(XPRT_CONNECTED, &xprt->state);
  1435			/* Trigger the socket release */
> 1436			xs_run_error_worker(transport, XPRT_SOCK_WAKE_DISCONNECT);
  1437		}
  1438	}
  1439	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
