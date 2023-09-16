Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FAC5C89;
	Sat, 16 Sep 2023 07:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694849023; x=1726385023;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c8i88xw7kqkRtm+RFJUtTj4XqEyRCmEHSLpdILSbhQA=;
  b=RX5tnMGKQddW5G19rJC/nRwVzVIX1HaDBGBU/H8qUa+rYoeN6T168NnA
   d8EOxyIYihfQZS3zRGRyUS5Z/lRnJRJorm9R9ILL5iGgMxQ0lddiTfomj
   H6uFzAtLu5cdTDRDAoBZKmkNbDT2PHKQ/M6dT0M7niet4rY1z2VA1uQ/a
   CNymqA2LXNf02VRsbF0cbf/x+VgZkz7OERXbIdKwFqXLMEe+7I7G3tNJq
   bshO5FtN9CZ6bIflOC3ZnqOPAwi4bZJbH1FMcuhlx99Q5e99nq4tBbIJv
   BDX02wdvYG4WqgtN5RMNxFeBkUPaJp3wewi11lM8zJ2FaBc6UcESY32TU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="359640190"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; 
   d="scan'208";a="359640190"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 00:23:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="745246136"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; 
   d="scan'208";a="745246136"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 16 Sep 2023 00:23:39 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhPeS-00041Q-2x;
	Sat, 16 Sep 2023 07:23:36 +0000
Date: Sat, 16 Sep 2023 15:22:54 +0800
From: kernel test robot <lkp@intel.com>
To: Ma Ke <make_ruc2021@163.com>, jhs@mojatatu.com,
	xiyou.wangcong@gmail.com, jiri@resnulli.us, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ma Ke <make_ruc2021@163.com>
Subject: Re: [PATCH] net: sched: qfq: dont intepret cls results when asked to
 drop
Message-ID: <202309161521.08Hs5BL9-lkp@intel.com>
References: <20230915142355.3411527-1-make_ruc2021@163.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915142355.3411527-1-make_ruc2021@163.com>

Hi Ma,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]
[also build test ERROR on net/main linus/master v6.6-rc1 next-20230915]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ma-Ke/net-sched-qfq-dont-intepret-cls-results-when-asked-to-drop/20230915-222648
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230915142355.3411527-1-make_ruc2021%40163.com
patch subject: [PATCH] net: sched: qfq: dont intepret cls results when asked to drop
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230916/202309161521.08Hs5BL9-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309161521.08Hs5BL9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309161521.08Hs5BL9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/sched/sch_qfq.c:707:4: error: fallthrough annotation does not directly precede switch label
                           fallthrough;
                           ^
   include/linux/compiler_attributes.h:227:41: note: expanded from macro 'fallthrough'
   # define fallthrough                    __attribute__((__fallthrough__))
                                           ^
   1 error generated.


vim +707 net/sched/sch_qfq.c

0545a303777351 stephen hemminger   2011-04-04  678  
0545a303777351 stephen hemminger   2011-04-04  679  static struct qfq_class *qfq_classify(struct sk_buff *skb, struct Qdisc *sch,
0545a303777351 stephen hemminger   2011-04-04  680  				      int *qerr)
0545a303777351 stephen hemminger   2011-04-04  681  {
0545a303777351 stephen hemminger   2011-04-04  682  	struct qfq_sched *q = qdisc_priv(sch);
0545a303777351 stephen hemminger   2011-04-04  683  	struct qfq_class *cl;
0545a303777351 stephen hemminger   2011-04-04  684  	struct tcf_result res;
25d8c0d55f241c John Fastabend      2014-09-12  685  	struct tcf_proto *fl;
0545a303777351 stephen hemminger   2011-04-04  686  	int result;
0545a303777351 stephen hemminger   2011-04-04  687  
0545a303777351 stephen hemminger   2011-04-04  688  	if (TC_H_MAJ(skb->priority ^ sch->handle) == 0) {
0545a303777351 stephen hemminger   2011-04-04  689  		pr_debug("qfq_classify: found %d\n", skb->priority);
0545a303777351 stephen hemminger   2011-04-04  690  		cl = qfq_find_class(sch, skb->priority);
0545a303777351 stephen hemminger   2011-04-04  691  		if (cl != NULL)
0545a303777351 stephen hemminger   2011-04-04  692  			return cl;
0545a303777351 stephen hemminger   2011-04-04  693  	}
0545a303777351 stephen hemminger   2011-04-04  694  
0545a303777351 stephen hemminger   2011-04-04  695  	*qerr = NET_XMIT_SUCCESS | __NET_XMIT_BYPASS;
25d8c0d55f241c John Fastabend      2014-09-12  696  	fl = rcu_dereference_bh(q->filter_list);
3aa2605594556c Davide Caratti      2021-07-28  697  	result = tcf_classify(skb, NULL, fl, &res, false);
0545a303777351 stephen hemminger   2011-04-04  698  	if (result >= 0) {
0698b7004e7da6 Ma Ke               2023-09-15  699  		if (result == TC_ACT_SHOT)
0698b7004e7da6 Ma Ke               2023-09-15  700  			return NULL;
0545a303777351 stephen hemminger   2011-04-04  701  #ifdef CONFIG_NET_CLS_ACT
0545a303777351 stephen hemminger   2011-04-04  702  		switch (result) {
0545a303777351 stephen hemminger   2011-04-04  703  		case TC_ACT_QUEUED:
0545a303777351 stephen hemminger   2011-04-04  704  		case TC_ACT_STOLEN:
e25ea21ffa66a0 Jiri Pirko          2017-06-06  705  		case TC_ACT_TRAP:
0545a303777351 stephen hemminger   2011-04-04  706  			*qerr = NET_XMIT_SUCCESS | __NET_XMIT_STOLEN;
964201de695b8a Gustavo A. R. Silva 2020-07-07 @707  			fallthrough;
0545a303777351 stephen hemminger   2011-04-04  708  		}
0545a303777351 stephen hemminger   2011-04-04  709  #endif
0545a303777351 stephen hemminger   2011-04-04  710  		cl = (struct qfq_class *)res.class;
0545a303777351 stephen hemminger   2011-04-04  711  		if (cl == NULL)
0545a303777351 stephen hemminger   2011-04-04  712  			cl = qfq_find_class(sch, res.classid);
0545a303777351 stephen hemminger   2011-04-04  713  		return cl;
0545a303777351 stephen hemminger   2011-04-04  714  	}
0545a303777351 stephen hemminger   2011-04-04  715  
0545a303777351 stephen hemminger   2011-04-04  716  	return NULL;
0545a303777351 stephen hemminger   2011-04-04  717  }
0545a303777351 stephen hemminger   2011-04-04  718  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
