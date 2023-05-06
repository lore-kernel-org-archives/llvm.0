Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D661105;
	Sat,  6 May 2023 04:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683349181; x=1714885181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h+8MQatITvYDSBcJDrgBgMhecImUILS01CfgUQZW18k=;
  b=Z7vWASBqnfhyKUL8xyp6j7KsCXrFP6iQHHRjlt1EcjODOio0rWyAW9f5
   Ah1afunOm3346dVY1hKj9X30SiSxF03R8hZfb0OsKulTQK6qNzbLQPT0I
   3U68S+oFcRLjNxC/9OLB3Q6dKVGjydRly3o3NyYkx4sxzT3yEWbkZvoZG
   qtEGX2m5GN65YGp2VLUdpIcDeoA/TKcJTiyhgl8R44324Vpyou5s9OddE
   x+lqSK5yZ6r+FhZQven29Wk+pD5ZEvRj98m2bAb3jYcWpoYAitZ/ImYg4
   cKrBBcERuYVBdbsw0/+W5Ic77gxFBle73gtcjTSMpSoM+R6JOD8T258yq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="414892770"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="414892770"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 21:59:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="1027764068"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="1027764068"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 May 2023 21:59:38 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvA1C-0001Af-12;
	Sat, 06 May 2023 04:59:38 +0000
Date: Sat, 6 May 2023 12:59:17 +0800
From: kernel test robot <lkp@intel.com>
To: Yosry Ahmed <yosryahmed@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [akpm-mm:mm-unstable 24/80] mm/memcontrol.c:1696:2: error: implicit
 declaration of function 'seq_buf_do_printk' is invalid in C99
Message-ID: <202305061200.X0d5yEgk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   f96b65aa15baec616fffdb8f1d4fa3222aa56467
commit: 6cff2881e2e07e413e55610d7923c87f44e5f364 [24/80] memcg: use seq_buf_do_printk() with mem_cgroup_print_oom_meminfo()
config: x86_64-randconfig-r011-20230501 (https://download.01.org/0day-ci/archive/20230506/202305061200.X0d5yEgk-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=6cff2881e2e07e413e55610d7923c87f44e5f364
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-unstable
        git checkout 6cff2881e2e07e413e55610d7923c87f44e5f364
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305061200.X0d5yEgk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memcontrol.c:1696:2: error: implicit declaration of function 'seq_buf_do_printk' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           seq_buf_do_printk(&s, KERN_INFO);
           ^
   1 error generated.


vim +/seq_buf_do_printk +1696 mm/memcontrol.c

  1661	
  1662	/**
  1663	 * mem_cgroup_print_oom_meminfo: Print OOM memory information relevant to
  1664	 * memory controller.
  1665	 * @memcg: The memory cgroup that went over limit
  1666	 */
  1667	void mem_cgroup_print_oom_meminfo(struct mem_cgroup *memcg)
  1668	{
  1669		/* Use static buffer, for the caller is holding oom_lock. */
  1670		static char buf[PAGE_SIZE];
  1671		struct seq_buf s;
  1672	
  1673		lockdep_assert_held(&oom_lock);
  1674	
  1675		pr_info("memory: usage %llukB, limit %llukB, failcnt %lu\n",
  1676			K((u64)page_counter_read(&memcg->memory)),
  1677			K((u64)READ_ONCE(memcg->memory.max)), memcg->memory.failcnt);
  1678		if (cgroup_subsys_on_dfl(memory_cgrp_subsys))
  1679			pr_info("swap: usage %llukB, limit %llukB, failcnt %lu\n",
  1680				K((u64)page_counter_read(&memcg->swap)),
  1681				K((u64)READ_ONCE(memcg->swap.max)), memcg->swap.failcnt);
  1682		else {
  1683			pr_info("memory+swap: usage %llukB, limit %llukB, failcnt %lu\n",
  1684				K((u64)page_counter_read(&memcg->memsw)),
  1685				K((u64)memcg->memsw.max), memcg->memsw.failcnt);
  1686			pr_info("kmem: usage %llukB, limit %llukB, failcnt %lu\n",
  1687				K((u64)page_counter_read(&memcg->kmem)),
  1688				K((u64)memcg->kmem.max), memcg->kmem.failcnt);
  1689		}
  1690	
  1691		pr_info("Memory cgroup stats for ");
  1692		pr_cont_cgroup_path(memcg->css.cgroup);
  1693		pr_cont(":");
  1694		seq_buf_init(&s, buf, sizeof(buf));
  1695		memory_stat_format(memcg, &s);
> 1696		seq_buf_do_printk(&s, KERN_INFO);
  1697	}
  1698	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
