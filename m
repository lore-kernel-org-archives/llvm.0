Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323744292
	for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 12:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647519465; x=1679055465;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hK8boUgXbx+/ko92grSQiQLOAam5hASxF0qf73e9Erw=;
  b=T5End8bt2NkCoHOLg9Mz8/kYizu15YmvhR7GKvLrdhsoNeu8j4exL/Zo
   q31UPdwjo3WS1KOeUl3eM/fNFB9Kb6RmWCCMzKmn4yfzIEJQEdf+OeLkP
   0cKgh8F4R2LXK+GVrP8wXUjqH0UndG9hCyYNqXNYSpkvTnbz3SdOwt4Rz
   yq8WYBQMaMGPXq33GMlJetSet/5X2L0W1kt2kxZ68yZNIOAyJw8G+smNe
   XVBR3+FCDLo1CRtO9+ADXiU6BB1/cpl7JzTQ3BycPlhYdNAWW7IsFWCMo
   WUhL5uiU6cd5+QAhTnAFODc5zgb+jfHh9Qf3Gcg6MEOQe4TVKqRZ2hocR
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="237461998"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="237461998"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2022 05:17:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; 
   d="scan'208";a="581274915"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 17 Mar 2022 05:17:18 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nUp49-000DfC-RF; Thu, 17 Mar 2022 12:17:17 +0000
Date: Thu, 17 Mar 2022 20:16:42 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:master 387/2335] net/sched/sch_generic.c:410:6: warning:
 no previous prototype for function '__qdisc_run'
Message-ID: <202203172048.n3XEqR9I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git master
head:   85293bf3fca6d85608cff1447ce3097583f15fab
commit: 1f7534c4ddd683aee3bb596dcaa839359aa7813d [387/2335] headers/uninline: Uninline single-use function: qdisc_run()
config: x86_64-randconfig-a001 (https://download.01.org/0day-ci/archive/20220317/202203172048.n3XEqR9I-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=1f7534c4ddd683aee3bb596dcaa839359aa7813d
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip master
        git checkout 1f7534c4ddd683aee3bb596dcaa839359aa7813d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/entry/vdso/ arch/x86/entry/vsyscall/ arch/x86/kernel/cpu/mtrr/ arch/x86/pci/ kernel/bpf/ kernel/trace/ lib/ net/ipv6/ net/sched/

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

bbd8a0d3a3b65d Krishna Kumar          2009-08-06  409  
37437bb2e1ae8a David S. Miller        2008-07-16 @410  void __qdisc_run(struct Qdisc *q)
48d83325b61043 Herbert Xu             2006-06-19  411  {
3d48b53fb2ae37 Matthias Tafelmeier    2016-12-29  412  	int quota = dev_tx_weight;
b8358d70ce1066 Jesper Dangaard Brouer 2014-10-09  413  	int packets;
2ba2506ca7ca62 Herbert Xu             2008-03-28  414  
b8358d70ce1066 Jesper Dangaard Brouer 2014-10-09  415  	while (qdisc_restart(q, &packets)) {
b8358d70ce1066 Jesper Dangaard Brouer 2014-10-09  416  		quota -= packets;
b60fa1c5d01a10 Eric Dumazet           2019-10-01  417  		if (quota <= 0) {
c4fef01ba4793a Yunsheng Lin           2021-06-22  418  			if (q->flags & TCQ_F_NOLOCK)
c4fef01ba4793a Yunsheng Lin           2021-06-22  419  				set_bit(__QDISC_STATE_MISSED, &q->state);
c4fef01ba4793a Yunsheng Lin           2021-06-22  420  			else
37437bb2e1ae8a David S. Miller        2008-07-16  421  				__netif_schedule(q);
c4fef01ba4793a Yunsheng Lin           2021-06-22  422  
d90df3ad07a20c Herbert Xu             2007-05-10  423  			break;
2ba2506ca7ca62 Herbert Xu             2008-03-28  424  		}
2ba2506ca7ca62 Herbert Xu             2008-03-28  425  	}
48d83325b61043 Herbert Xu             2006-06-19  426  }
48d83325b61043 Herbert Xu             2006-06-19  427  

:::::: The code at line 410 was first introduced by commit
:::::: 37437bb2e1ae8af470dfcd5b4ff454110894ccaf pkt_sched: Schedule qdiscs instead of netdev_queue.

:::::: TO: David S. Miller <davem@davemloft.net>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
