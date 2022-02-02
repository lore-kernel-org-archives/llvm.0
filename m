Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB542F21
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 05:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643780562; x=1675316562;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2ySuPkq/583bmdl/CPt4Z82jKBY0xCsnsV6xomIy7mM=;
  b=kuN/IoSUUeuJQJAo+tGF7iZUusHOBXetN7eiutHwNFZeOGM2siooeXbE
   udko1JSU7P31UrvHQIdWveXZqR5vFM7R7B1XCpsFtBUesEEp2njzBABsw
   Q1IfmrMBzs2H/bkcX420D/OnLJGxOJgSDX4YwjpkYMy/RZkNoVfvCU5pm
   W1pT2KFm9zHdKCIcledWj1frfjE8urMvPbkPGBSbe7ea/86K0STWkHh/E
   5MLEBig7hkXghLULa0HjnhgdYIHeLWVuY5/zaxgJHnmHCJEqobB7LqLfg
   czvI7gOJfgWtp79fC32Ado+BUdr/7GSZqLmSfB8VtzP+dQwMUqFMo6Hrw
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="272336597"
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; 
   d="scan'208";a="272336597"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2022 21:42:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,335,1635231600"; 
   d="scan'208";a="630815744"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Feb 2022 21:42:40 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nF8Pf-000UBe-Hg; Wed, 02 Feb 2022 05:42:39 +0000
Date: Wed, 2 Feb 2022 13:41:50 +0800
From: kernel test robot <lkp@intel.com>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] memcg: add per-memcg total kernel memory stat
Message-ID: <202202021308.Lv9zjwOg-lkp@intel.com>
References: <20220201200823.3283171-1-yosryahmed@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220201200823.3283171-1-yosryahmed@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Yosry,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linux/master]
[also build test ERROR on linus/master v5.17-rc2]
[cannot apply to tj-cgroup/for-next hnaz-mm/master next-20220202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Yosry-Ahmed/memcg-add-per-memcg-total-kernel-memory-stat/20220202-041007
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 2c271fe77d52a0555161926c232cd5bc07178b39
config: hexagon-randconfig-r045-20220130 (https://download.01.org/0day-ci/archive/20220202/202202021308.Lv9zjwOg-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e844b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/c956773fbdc99f19a2f19427595473fd591ccdc3
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Yosry-Ahmed/memcg-add-per-memcg-total-kernel-memory-stat/20220202-041007
        git checkout c956773fbdc99f19a2f19427595473fd591ccdc3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/memcontrol.c:6817:4: error: implicit declaration of function 'mem_cgroup_kmem_record' [-Werror,-Wimplicit-function-declaration]
                           mem_cgroup_kmem_record(ug->memcg, -ug->nr_kmem);
                           ^
   1 error generated.


vim +/mem_cgroup_kmem_record +6817 mm/memcontrol.c

  6807	
  6808	static void uncharge_batch(const struct uncharge_gather *ug)
  6809	{
  6810		unsigned long flags;
  6811	
  6812		if (ug->nr_memory) {
  6813			page_counter_uncharge(&ug->memcg->memory, ug->nr_memory);
  6814			if (do_memsw_account())
  6815				page_counter_uncharge(&ug->memcg->memsw, ug->nr_memory);
  6816			if (ug->nr_kmem)
> 6817				mem_cgroup_kmem_record(ug->memcg, -ug->nr_kmem);
  6818			memcg_oom_recover(ug->memcg);
  6819		}
  6820	
  6821		local_irq_save(flags);
  6822		__count_memcg_events(ug->memcg, PGPGOUT, ug->pgpgout);
  6823		__this_cpu_add(ug->memcg->vmstats_percpu->nr_page_events, ug->nr_memory);
  6824		memcg_check_events(ug->memcg, ug->nid);
  6825		local_irq_restore(flags);
  6826	
  6827		/* drop reference from uncharge_folio */
  6828		css_put(&ug->memcg->css);
  6829	}
  6830	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
