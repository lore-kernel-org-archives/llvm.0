Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0337173
	for <llvm@lists.linux.dev>; Mon, 27 Dec 2021 04:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640580792; x=1672116792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RvVQch9igr77zYD8cq7zz+ZCJ4Ef+4whg/UoJuLu2WI=;
  b=et9fOvBX+/aIFiDJSVVwV7G2zlfCBrTIKh3dHzLNnqTO7v7sCbvzJhkm
   VOWnqJ3Gqqlb6MQE6bx1nAG0iEkJ2+opvws+SGsfASKwpBOPrv9rGgF/9
   9FLr68ArqlQgG2KVqZxggkkmiRrer79GArJwwcoA2ZyfGOZbHCcmrL49S
   XfquKzbXoeIIvw1ChQXdGBew8suaW8jYXOnel3wcUbWJHCHJpmc8oGiyq
   4FW4qgafd3E+dLNPI/yZr5cYHlEfhnQHwrdfyzLwLblbWVWI6zJOCeLIZ
   /VvDHHdtirVrKfIxAgvrlR/+NIV7o6fYlXipAEIk69is/7ldb7Yjq0tdT
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10209"; a="238697628"
X-IronPort-AV: E=Sophos;i="5.88,238,1635231600"; 
   d="scan'208";a="238697628"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2021 20:53:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,238,1635231600"; 
   d="scan'208";a="686174054"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 26 Dec 2021 20:53:10 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n1i0T-00064I-UC; Mon, 27 Dec 2021 04:53:09 +0000
Date: Mon, 27 Dec 2021 12:52:59 +0800
From: kernel test robot <lkp@intel.com>
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC Patch v3 3/3] net_sched: introduce eBPF based Qdisc
Message-ID: <202112271239.sDqlvXQh-lkp@intel.com>
References: <20211224200059.161979-4-xiyou.wangcong@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211224200059.161979-4-xiyou.wangcong@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Cong,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf-next/master]
[also build test WARNING on net-next/master next-20211224]
[cannot apply to bpf/master net/master horms-ipvs/master linus/master v5.16-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Cong-Wang/net_sched-introduce-eBPF-based-Qdisc/20211225-040205
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: i386-randconfig-c001-20211226 (https://download.01.org/0day-ci/archive/20211227/202112271239.sDqlvXQh-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project a9e8b1ee7fd44b53c555a7823ae8fd1a8209c520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/3281415061bcf1a15f10b0a750d35ad9de23b469
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Cong-Wang/net_sched-introduce-eBPF-based-Qdisc/20211225-040205
        git checkout 3281415061bcf1a15f10b0a750d35ad9de23b469
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/sched/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/sched/sch_bpf.c:178:3: warning: variable 'cl' is uninitialized when used here [-Wuninitialized]
                   cl->overlimits++;
                   ^~
   net/sched/sch_bpf.c:162:26: note: initialize the variable 'cl' to silence this warning
           struct sch_bpf_class *cl;
                                   ^
                                    = NULL
>> net/sched/sch_bpf.c:458:5: warning: no previous prototype for function 'bpf_skb_classify' [-Wmissing-prototypes]
   u32 bpf_skb_classify(struct sk_buff *skb, int ifindex, u32 handle)
       ^
   net/sched/sch_bpf.c:458:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u32 bpf_skb_classify(struct sk_buff *skb, int ifindex, u32 handle)
   ^
   static 
   2 warnings generated.


vim +/cl +178 net/sched/sch_bpf.c

   155	
   156	static struct sk_buff *sch_bpf_dequeue(struct Qdisc *sch)
   157	{
   158		struct sch_bpf_qdisc *q = qdisc_priv(sch);
   159		struct sk_buff *ret = NULL;
   160		struct sch_bpf_ctx ctx = {};
   161		struct bpf_prog *dequeue;
   162		struct sch_bpf_class *cl;
   163		s64 now;
   164		int res;
   165	
   166	again:
   167		dequeue = rcu_dereference(q->dequeue_prog.prog);
   168		ctx.classid = sch->handle;
   169		res = bpf_prog_run(dequeue, &ctx);
   170		switch (res) {
   171		case SCH_BPF_OK:
   172			ret = (struct sk_buff *)ctx.skb;
   173			break;
   174		case SCH_BPF_THROTTLE:
   175			now = ktime_get_ns();
   176			qdisc_watchdog_schedule_ns(&q->watchdog, now + ctx.delay);
   177			qdisc_qstats_overlimit(sch);
 > 178			cl->overlimits++;
   179			return NULL;
   180		case SCH_BPF_CONTINUE:
   181			goto again;
   182		default:
   183			kfree_skb((struct sk_buff *)ctx.skb);
   184			ret = NULL;
   185		}
   186	
   187		return ret;
   188	}
   189	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
