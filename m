Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CD16AB8;
	Sat, 16 Sep 2023 06:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694845164; x=1726381164;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z/4bikEkIU7qMbozJqqn90Ffha07LnMM+FA07DYflPw=;
  b=UKwKMWL/X0o+yOfsa7MTTfBBF4GBXtm7SuVNRCuz4OdbLJeqN5wWGZOR
   O5SqOOYww9BFuEgsf7qbaaOG17ZyPmViVX5MtI6SaMKhdsE/SIh17XeYi
   S+wLFk4HJzyJd4qC5KcVvzc2Cr7SJ7Ud6dqnS434V1r0mjHsvMvmmxM0j
   54+wsko39+LjKLUNNLB3omDjjXj8YNvcL6QBOdvH9EMTCFzSqXKydmnyv
   +RaWvzgFBgSWoq0t1cj/wRyMbZgqrTz6m0jbwFYKW4qWl2pixD1EUBPnT
   cxqrs1vwgQkdm2ZtGCmtuiwLL5Tg4OJQEKViGbOLGZalH7JKC79d08q0O
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="379303507"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; 
   d="scan'208";a="379303507"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 23:19:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="748424258"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; 
   d="scan'208";a="748424258"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 15 Sep 2023 23:19:20 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhOeE-0003xU-0i;
	Sat, 16 Sep 2023 06:19:18 +0000
Date: Sat, 16 Sep 2023 14:18:28 +0800
From: kernel test robot <lkp@intel.com>
To: Ma Ke <make_ruc2021@163.com>, jhs@mojatatu.com,
	xiyou.wangcong@gmail.com, jiri@resnulli.us, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ma Ke <make_ruc2021@163.com>
Subject: Re: [PATCH] net: sched: drr: dont intepret cls results when asked to
 drop
Message-ID: <202309161334.0j3RBkmV-lkp@intel.com>
References: <20230915142056.3411330-1-make_ruc2021@163.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915142056.3411330-1-make_ruc2021@163.com>

Hi Ma,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]
[also build test ERROR on net/main linus/master v6.6-rc1 next-20230915]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ma-Ke/net-sched-drr-dont-intepret-cls-results-when-asked-to-drop/20230915-223913
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230915142056.3411330-1-make_ruc2021%40163.com
patch subject: [PATCH] net: sched: drr: dont intepret cls results when asked to drop
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230916/202309161334.0j3RBkmV-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309161334.0j3RBkmV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309161334.0j3RBkmV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/sched/sch_drr.c:321:4: error: fallthrough annotation does not directly precede switch label
                           fallthrough;
                           ^
   include/linux/compiler_attributes.h:227:41: note: expanded from macro 'fallthrough'
   # define fallthrough                    __attribute__((__fallthrough__))
                                           ^
   1 error generated.


vim +321 net/sched/sch_drr.c

13d2a1d2b032de Patrick McHardy     2008-11-20  293  
13d2a1d2b032de Patrick McHardy     2008-11-20  294  static struct drr_class *drr_classify(struct sk_buff *skb, struct Qdisc *sch,
13d2a1d2b032de Patrick McHardy     2008-11-20  295  				      int *qerr)
13d2a1d2b032de Patrick McHardy     2008-11-20  296  {
13d2a1d2b032de Patrick McHardy     2008-11-20  297  	struct drr_sched *q = qdisc_priv(sch);
13d2a1d2b032de Patrick McHardy     2008-11-20  298  	struct drr_class *cl;
13d2a1d2b032de Patrick McHardy     2008-11-20  299  	struct tcf_result res;
25d8c0d55f241c John Fastabend      2014-09-12  300  	struct tcf_proto *fl;
13d2a1d2b032de Patrick McHardy     2008-11-20  301  	int result;
13d2a1d2b032de Patrick McHardy     2008-11-20  302  
13d2a1d2b032de Patrick McHardy     2008-11-20  303  	if (TC_H_MAJ(skb->priority ^ sch->handle) == 0) {
13d2a1d2b032de Patrick McHardy     2008-11-20  304  		cl = drr_find_class(sch, skb->priority);
13d2a1d2b032de Patrick McHardy     2008-11-20  305  		if (cl != NULL)
13d2a1d2b032de Patrick McHardy     2008-11-20  306  			return cl;
13d2a1d2b032de Patrick McHardy     2008-11-20  307  	}
13d2a1d2b032de Patrick McHardy     2008-11-20  308  
13d2a1d2b032de Patrick McHardy     2008-11-20  309  	*qerr = NET_XMIT_SUCCESS | __NET_XMIT_BYPASS;
25d8c0d55f241c John Fastabend      2014-09-12  310  	fl = rcu_dereference_bh(q->filter_list);
3aa2605594556c Davide Caratti      2021-07-28  311  	result = tcf_classify(skb, NULL, fl, &res, false);
13d2a1d2b032de Patrick McHardy     2008-11-20  312  	if (result >= 0) {
13abeaf39ca823 Ma Ke               2023-09-15  313  		if (result == TC_ACT_SHOT)
13abeaf39ca823 Ma Ke               2023-09-15  314  			return NULL;
13d2a1d2b032de Patrick McHardy     2008-11-20  315  #ifdef CONFIG_NET_CLS_ACT
13d2a1d2b032de Patrick McHardy     2008-11-20  316  		switch (result) {
13d2a1d2b032de Patrick McHardy     2008-11-20  317  		case TC_ACT_QUEUED:
13d2a1d2b032de Patrick McHardy     2008-11-20  318  		case TC_ACT_STOLEN:
e25ea21ffa66a0 Jiri Pirko          2017-06-06  319  		case TC_ACT_TRAP:
13d2a1d2b032de Patrick McHardy     2008-11-20  320  			*qerr = NET_XMIT_SUCCESS | __NET_XMIT_STOLEN;
964201de695b8a Gustavo A. R. Silva 2020-07-07 @321  			fallthrough;
13d2a1d2b032de Patrick McHardy     2008-11-20  322  		}
13d2a1d2b032de Patrick McHardy     2008-11-20  323  #endif
13d2a1d2b032de Patrick McHardy     2008-11-20  324  		cl = (struct drr_class *)res.class;
13d2a1d2b032de Patrick McHardy     2008-11-20  325  		if (cl == NULL)
13d2a1d2b032de Patrick McHardy     2008-11-20  326  			cl = drr_find_class(sch, res.classid);
13d2a1d2b032de Patrick McHardy     2008-11-20  327  		return cl;
13d2a1d2b032de Patrick McHardy     2008-11-20  328  	}
13d2a1d2b032de Patrick McHardy     2008-11-20  329  	return NULL;
13d2a1d2b032de Patrick McHardy     2008-11-20  330  }
13d2a1d2b032de Patrick McHardy     2008-11-20  331  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
