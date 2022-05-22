Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50AF3D66
	for <llvm@lists.linux.dev>; Sun, 22 May 2022 22:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653259301; x=1684795301;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ScDUU5SbcZiFzMnn2zRh2mNmhm1f/E9t5oZnaQGnoLg=;
  b=IWVM+JiLAYN+//s/qslbioC6HlwzBHEGeEvKdrdZlLh/ezEMPOmZb0n/
   45ETHrShiYuwHwi24XjEufQDWrdjtJeM+z98tmgalI3m9BtJRDe01wL1D
   2JwRgyujtnBs5IjJl+ECRWIrR2QZZiDODg5Dpy030OgMOaYO+yH81YG/N
   yf4pVHh1u/9zeupy8w+FRdFOoqfdjZOHPbF+PBEhtSrkNSZtrIfuajyBd
   vILaD6KUm7S1dFsMWmaz7HttADK3pw4Dwwe0k7SeLnybC0ISFiAEVcnKf
   QBKZOBb3FrFmuRhzouDwJD4Sqk3uMG3mAgwI/5J9lu6aYa/SBV9KxNIle
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="253558112"
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600"; 
   d="scan'208";a="253558112"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2022 15:41:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600"; 
   d="scan'208";a="547599487"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 May 2022 15:41:39 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nsuGY-0000fv-U5;
	Sun, 22 May 2022 22:41:38 +0000
Date: Mon, 23 May 2022 06:41:27 +0800
From: kernel test robot <lkp@intel.com>
To: Dmytro SHYTYI <dmytro@shytyi.net>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH mptcp-next v3] mptcp: Fast Open Mechanism
Message-ID: <202205230646.zfSPtR16-lkp@intel.com>
References: <20220522183921.103526-1-dmytro@shytyi.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220522183921.103526-1-dmytro@shytyi.net>

Hi Dmytro,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on mptcp/export]
[cannot apply to linus/master v5.18 next-20220520]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmytro-SHYTYI/mptcp-Fast-Open-Mechanism/20220523-024130
base:   https://github.com/multipath-tcp/mptcp_net-next.git export
config: hexagon-buildonly-randconfig-r002-20220522 (https://download.01.org/0day-ci/archive/20220523/202205230646.zfSPtR16-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1443dbaba6f0e57be066995db9164f89fb57b413)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/02104b72c861360a30eb76d68a6757e70d77a097
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dmytro-SHYTYI/mptcp-Fast-Open-Mechanism/20220523-024130
        git checkout 02104b72c861360a30eb76d68a6757e70d77a097
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash net/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> net/ipv4/tcp_output.c:750:54: error: too many arguments to function call, expected 3, have 4
                   if (mptcp_synack_options(req, &size, &opts->mptcp, &opts->options)) {
                       ~~~~~~~~~~~~~~~~~~~~                           ^~~~~~~~~~~~~~
   include/net/mptcp.h:248:20: note: 'mptcp_synack_options' declared here
   static inline bool mptcp_synack_options(const struct request_sock *req,
                      ^
   1 error generated.


vim +750 net/ipv4/tcp_output.c

   742	
   743	static void mptcp_set_option_cond(const struct request_sock *req,
   744					  struct tcp_out_options *opts,
   745					  unsigned int *remaining)
   746	{
   747		if (rsk_is_mptcp(req)) {
   748			unsigned int size;
   749	
 > 750			if (mptcp_synack_options(req, &size, &opts->mptcp, &opts->options)) {
   751				if (*remaining >= size) {
   752					opts->options |= OPTION_MPTCP;
   753					*remaining -= size;
   754				}
   755			}
   756		}
   757	}
   758	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
