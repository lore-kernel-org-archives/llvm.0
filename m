Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDF25694;
	Sun, 19 Nov 2023 09:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ma46X6/R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700385329; x=1731921329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PK09L4R2wMWUbs7WomjFPOsAbLEt3FQGecm+ypGXp5Q=;
  b=Ma46X6/REFxbJULKxG2rBK/33UA39ABbhssbwjBr7NQ4FZxDrh5wMTw+
   ay4ni0eJqvga17h5/0WFFnhEySJf6gwEdIyg0XXK01PN2AL6pJnOP0mqA
   y03Ydl3vDv2PQ2L2gwcf5OP9PwY5j9pz9cJrefzuEIc678VBqUv9hCIN3
   VPQ6LwcVuT/rsrwsnEuJHg1qV/ZsANdQfYBkdi4ISk1pDwSIv21zHLsz+
   /4Yg3ydV4hL6KTHCuRyqbTQa1QyZkaehmmyiDaBnS7Yk+CW1Ewgwtj5s9
   aOMZs6dM5ksdQDdw4WI6M7petIjUM9JvfY3FM1KLLoR8/2rO9L8iTEY30
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="376519697"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="376519697"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 01:15:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="1013324273"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="1013324273"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 19 Nov 2023 01:15:27 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4dtl-0004tf-1x;
	Sun, 19 Nov 2023 09:15:25 +0000
Date: Sun, 19 Nov 2023 17:14:35 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [legion:patchset/meminfo/v2.1 1/1] mm/memcontrol.c:4147:43: error:
 use of undeclared identifier 'NR_SWAPCACHE'
Message-ID: <202311191747.MQDEUNJY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git patchset/meminfo/v2.1
head:   cc6200454eb83b4e846d90f08e6db172946d5301
commit: cc6200454eb83b4e846d90f08e6db172946d5301 [1/1] proc: Implement /proc/self/meminfo
config: x86_64-randconfig-003-20231119 (https://download.01.org/0day-ci/archive/20231119/202311191747.MQDEUNJY-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311191747.MQDEUNJY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311191747.MQDEUNJY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memcontrol.c:4147:43: error: use of undeclared identifier 'NR_SWAPCACHE'
           mi->swapcached = memcg_page_state(memcg, NR_SWAPCACHE);
                                                    ^
   1 error generated.


vim +/NR_SWAPCACHE +4147 mm/memcontrol.c

  4130	
  4131	void mem_fill_meminfo(struct meminfo *mi, struct task_struct *task)
  4132	{
  4133		struct cgroup_subsys_state *memcg_css = task_css(task, memory_cgrp_id);
  4134		struct mem_cgroup *memcg = mem_cgroup_from_css(memcg_css);
  4135		int nid;
  4136	
  4137		memset(&mi->pages, 0, sizeof(mi->pages));
  4138	
  4139		mem_cgroup_si_meminfo(&mi->si, task);
  4140	
  4141		for_each_online_node(nid)
  4142			mem_cgroup_nr_pages(memcg, nid, mi->pages);
  4143	
  4144		mi->slab_reclaimable = memcg_page_state(memcg, NR_SLAB_RECLAIMABLE_B);
  4145		mi->slab_unreclaimable = memcg_page_state(memcg, NR_SLAB_UNRECLAIMABLE_B);
  4146		mi->cached = memcg_page_state(memcg, NR_FILE_PAGES);
> 4147		mi->swapcached = memcg_page_state(memcg, NR_SWAPCACHE);
  4148		mi->anon_pages = memcg_page_state(memcg, NR_ANON_MAPPED);
  4149		mi->mapped = memcg_page_state(memcg, NR_FILE_MAPPED);
  4150		mi->nr_pagetable = memcg_page_state(memcg, NR_PAGETABLE);
  4151		mi->nr_secpagetable = memcg_page_state(memcg, NR_SECONDARY_PAGETABLE);
  4152		mi->dirty_pages = memcg_page_state(memcg, NR_FILE_DIRTY);
  4153		mi->writeback_pages = memcg_page_state(memcg, NR_WRITEBACK);
  4154	}
  4155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
