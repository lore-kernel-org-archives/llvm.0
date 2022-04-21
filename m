Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0111FA2
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 12:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650542463; x=1682078463;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=40ZpXzHhif4b+zrDrJvZ+zMxh+KqAiiSUkdESy1uBXo=;
  b=IPg/k1ScnGeqOxdO/aLdpxlsp7IdSuAyPyCS1jfEenBo2K4JNdNsRqj9
   QBSc4DkBSU/A3v0UXY+bu6W5iADDDN3CbvVxfZUH2Sacwv9xMDm1w3gDt
   ZH5to6hxJcXPQa3QkqxOO4Pm2kvocsnxMcHhPCr35qzV5KCzjSDxXv9HA
   PuUV1tVHGCI4/fIeSIBQ73wSEQYm+01u/VKN8ChJ1V4101JHENaKN2i18
   NJlxDRrWjiDSA2yDV06kZ/lyMggumFMlSMckpx7ZMvlvQgR9c+SGy25dz
   o5qFI0EAjkPIhi2smJlpjVrDmbnwbNJfRZSvnhxqBOnqbASl7qaNeLRLH
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="289441727"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="289441727"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 05:01:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="511033445"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Apr 2022 05:01:01 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhVUa-0008Md-HN;
	Thu, 21 Apr 2022 12:01:00 +0000
Date: Thu, 21 Apr 2022 20:00:54 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 2005/2579] net/ipv6/mcast.c:258:5: warning:
 no previous prototype for function 'ipv6_sock_mc_join_ssm'
Message-ID: <202204211908.ZazXpu8z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   49e1ec6c70a6eb4b7de9250a455b8b63eb42afbe
commit: c69b0b89e88734be4e9bf8aad8f3fbcbf0b05df9 [2005/2579] headers/deps: net: Split <net/ipv6_api_sock.h> header out of <net/ipv6.h>
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220421/202204211908.ZazXpu8z-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=c69b0b89e88734be4e9bf8aad8f3fbcbf0b05df9
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout c69b0b89e88734be4e9bf8aad8f3fbcbf0b05df9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/crypto/ arch/x86/entry/vdso/ arch/x86/events/amd/ arch/x86/kernel/ arch/x86/pci/ kernel/bpf/ kernel/trace/ net/ipv6/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/ipv6/mcast.c:258:5: warning: no previous prototype for function 'ipv6_sock_mc_join_ssm' [-Wmissing-prototypes]
   int ipv6_sock_mc_join_ssm(struct sock *sk, int ifindex,
       ^
   net/ipv6/mcast.c:258:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int ipv6_sock_mc_join_ssm(struct sock *sk, int ifindex,
   ^
   static 
   1 warning generated.


vim +/ipv6_sock_mc_join_ssm +258 net/ipv6/mcast.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  257  
c7ea20c9da5b94 Hangbin Liu    2018-07-10 @258  int ipv6_sock_mc_join_ssm(struct sock *sk, int ifindex,
c7ea20c9da5b94 Hangbin Liu    2018-07-10  259  			  const struct in6_addr *addr, unsigned int mode)
c7ea20c9da5b94 Hangbin Liu    2018-07-10  260  {
c7ea20c9da5b94 Hangbin Liu    2018-07-10  261  	return __ipv6_sock_mc_join(sk, ifindex, addr, mode);
c7ea20c9da5b94 Hangbin Liu    2018-07-10  262  }
c7ea20c9da5b94 Hangbin Liu    2018-07-10  263  

:::::: The code at line 258 was first introduced by commit
:::::: c7ea20c9da5b94e400c8dcc0adb99411f2e430a6 ipv6/mcast: init as INCLUDE when join SSM INCLUDE group

:::::: TO: Hangbin Liu <liuhangbin@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
