Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6552E28F5
	for <llvm@lists.linux.dev>; Thu, 14 Apr 2022 13:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649942575; x=1681478575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tEoaxobnzOnTCJoW4N/TrqtTP0L+774fqC1hHmkr1N8=;
  b=CcMeZGLD+lUi0r5/3b8oJQ7lixGYEGyUdbizJU570sR10XV0QYxrdqrC
   7Nbc385tRyiVu2QD9fBgx3ZcE6WMAEPVwtszOG6RhS9fUqngK0Lvqqx4j
   tFOU140uzayFkGO4qhYKGf3C3Vuqo12SBuUR0L94heCEGlT+hgOhXt9Su
   +HozA12vF4QID+8DcHR3N5axNAMfJ7RCw0QhncNYvZXJAAYp3ZBTlya50
   kxW3dnYmx0+EPEt9tpBjbF7DDYHdHZaNltBuDeEc30MJadaDNm6VTBdZZ
   W5LpPXmdSgpRCKnykTIsKX9P1vhnmM0/BJ6nZOFuFDiyzcWcIYlkz16EG
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="262371967"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; 
   d="scan'208";a="262371967"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2022 06:22:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; 
   d="scan'208";a="725361595"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Apr 2022 06:22:53 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nezQz-0000zF-73;
	Thu, 14 Apr 2022 13:22:53 +0000
Date: Thu, 14 Apr 2022 21:22:04 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [cel:topic-rpc-with-tls-upcall 18/21] net/sunrpc/clnt.c:2194:2:
 warning: unannotated fall-through between switch labels
Message-ID: <202204142146.JvSVSwxH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-rpc-with-tls-upcall
head:   77d1002f5a5209bebd901cf895b52730199c0ba4
commit: d7546e246acd3e74b2967985f4cae4df84fdba25 [18/21] SUNRPC: Add FSM machinery to handle RPC_AUTH_TLS on reconnect
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220414/202204142146.JvSVSwxH-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b7e6ea489f6dd45a9b0da9ac20871560917b9b0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/commit/?id=d7546e246acd3e74b2967985f4cae4df84fdba25
        git remote add cel git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
        git fetch --no-tags cel topic-rpc-with-tls-upcall
        git checkout d7546e246acd3e74b2967985f4cae4df84fdba25
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/sunrpc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/sunrpc/clnt.c:2194:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           default:
           ^
   net/sunrpc/clnt.c:2194:2: note: insert 'break;' to avoid fall-through
           default:
           ^
           break; 
   1 warning generated.


vim +2194 net/sunrpc/clnt.c

  2176	
  2177	static void
  2178	call_start_tls(struct rpc_task *task)
  2179	{
  2180		struct rpc_xprt *xprt = task->tk_rqstp->rq_xprt;
  2181		struct rpc_clnt *clnt = task->tk_client;
  2182	
  2183		task->tk_action = call_transmit;
  2184		if (RPC_IS_TLSPROBE(task))
  2185			return;
  2186	
  2187		switch (clnt->cl_xprtsec_policy) {
  2188		case RPC_XPRTSEC_TLS:
  2189		case RPC_XPRTSEC_MTLS:
  2190			if (xprt->ops->tls_handshake_async) {
  2191				task->tk_action = call_tls_status;
  2192				rpc_starttls_async(task);
  2193			}
> 2194		default:
  2195			break;
  2196		}
  2197	}
  2198	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
