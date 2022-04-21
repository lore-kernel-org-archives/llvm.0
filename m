Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728811FAD
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 06:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650523313; x=1682059313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xytwx8mHClt1gtx7MSHfgn6IxDtbFvrY1YqpJWW53Fw=;
  b=b0UVvX09hBxyCumHu3btsFXx4p8fzrMAmMh+dkifX2xyrvYsbn5J09Qo
   Wk8exteeKqtDw4dvm5moSHwniwoltABFI3/q55t45ufOsMbeN1Q9ihOtZ
   aDqAkXws2PfdYQaYQAMO5n7GNWoFqp/zEEDt9v/Jxt7pgk0jh8yJ99+86
   Bc8fTZ6sIV7V+/H5xPX3atxQzk5TxlCx5kPWYo721lfzqlNfJszWujiGi
   KV5OMf2rHcvlULKo4ExnZoGs4Sya1PAdEBipsxpxyp6Zhydo9OzS5+qPc
   OAT3KIxgKYw8favhueIfJXVJx1qCU1CdlxuV/MZIOSPTls35yIEbRbm3P
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="244189637"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="244189637"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2022 23:41:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="865400793"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Apr 2022 23:41:50 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhQVi-0007yn-0L;
	Thu, 21 Apr 2022 06:41:50 +0000
Date: Thu, 21 Apr 2022 14:41:44 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 383/2579] net/sched/sch_generic.c:410:6:
 warning: no previous prototype for function '__qdisc_run'
Message-ID: <202204210134.5kMkTDaX-lkp@intel.com>
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
commit: 251150fba8c4c2b9cd65237c81874f49421476a5 [383/2579] headers/uninline: Uninline single-use function: qdisc_run()
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220421/202204210134.5kMkTDaX-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=251150fba8c4c2b9cd65237c81874f49421476a5
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout 251150fba8c4c2b9cd65237c81874f49421476a5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/crypto/ arch/x86/entry/ arch/x86/kernel/cpu/ arch/x86/pci/ kernel/bpf/ kernel/trace/ net/ipv6/ net/sched/ samples/connector/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/sched/sch_generic.c:410:6: warning: no previous prototype for function '__qdisc_run' [-Wmissing-prototypes]
   void __qdisc_run(struct Qdisc *q)
        ^
   net/sched/sch_generic.c:410:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __qdisc_run(struct Qdisc *q)
   ^
   static 
   1 warning generated.


vim +/__qdisc_run +410 net/sched/sch_generic.c

bbd8a0d3a3b65d3 Krishna Kumar          2009-08-06  409  
37437bb2e1ae8af David S. Miller        2008-07-16 @410  void __qdisc_run(struct Qdisc *q)
48d83325b61043e Herbert Xu             2006-06-19  411  {
3d48b53fb2ae371 Matthias Tafelmeier    2016-12-29  412  	int quota = dev_tx_weight;
b8358d70ce1066d Jesper Dangaard Brouer 2014-10-09  413  	int packets;
2ba2506ca7ca62c Herbert Xu             2008-03-28  414  
b8358d70ce1066d Jesper Dangaard Brouer 2014-10-09  415  	while (qdisc_restart(q, &packets)) {
b8358d70ce1066d Jesper Dangaard Brouer 2014-10-09  416  		quota -= packets;
b60fa1c5d01a10e Eric Dumazet           2019-10-01  417  		if (quota <= 0) {
c4fef01ba4793a8 Yunsheng Lin           2021-06-22  418  			if (q->flags & TCQ_F_NOLOCK)
c4fef01ba4793a8 Yunsheng Lin           2021-06-22  419  				set_bit(__QDISC_STATE_MISSED, &q->state);
c4fef01ba4793a8 Yunsheng Lin           2021-06-22  420  			else
37437bb2e1ae8af David S. Miller        2008-07-16  421  				__netif_schedule(q);
c4fef01ba4793a8 Yunsheng Lin           2021-06-22  422  
d90df3ad07a20cd Herbert Xu             2007-05-10  423  			break;
2ba2506ca7ca62c Herbert Xu             2008-03-28  424  		}
2ba2506ca7ca62c Herbert Xu             2008-03-28  425  	}
48d83325b61043e Herbert Xu             2006-06-19  426  }
48d83325b61043e Herbert Xu             2006-06-19  427  

:::::: The code at line 410 was first introduced by commit
:::::: 37437bb2e1ae8af470dfcd5b4ff454110894ccaf pkt_sched: Schedule qdiscs instead of netdev_queue.

:::::: TO: David S. Miller <davem@davemloft.net>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
