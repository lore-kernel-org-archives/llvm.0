Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE9A1FCC
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 02:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663037142; x=1694573142;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ePHANDGuYLuceB8KbwCdSJMhTdA38M/s4WFpLsjgXt4=;
  b=QvTD41dM1kvifOLxt4qJy/Irf6915sSW5ZejOBgZW2ZKiWJsCaPHE6Yr
   qK9kjB6uBCtnqclLTCy+z7K8pY4/nPZwKK/Hixf0HACBffJ+tXUrwALJ7
   TeuZfuqRHuHVqGJsQdgLGHfzj9/pTK0QLt8jFarcoYC/rMN7hWRMrFLDn
   H8yfS10tF/p1mhP79hwJI7LjrbOpgxAXB81R2zuSca2fUhRbfxa1NaL5c
   mLs4VhrG5ItgKfx3aYk5iPEh/HVML75Nydnthz6vUQsOXWWDCqgpj8J2l
   zuH7iiHqhP15UWjksnbNp0ZEIJHJl1sP93J7xqxD2YgqTkP7MfS7WFXDG
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="296755581"
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; 
   d="scan'208";a="296755581"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 19:45:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; 
   d="scan'208";a="593747464"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 12 Sep 2022 19:45:41 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oXvvg-000375-1X;
	Tue, 13 Sep 2022 02:45:40 +0000
Date: Tue, 13 Sep 2022 10:45:08 +0800
From: kernel test robot <lkp@intel.com>
To: Yuanchu Xie <yuanchu@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 1/2] mm: multi-gen LRU: support page access info
 harvesting with eBPF
Message-ID: <202209131022.iAfoS5Cj-lkp@intel.com>
References: <20220911083418.2818369-2-yuanchu@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220911083418.2818369-2-yuanchu@google.com>

Hi Yuanchu,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuanchu-Xie/mm-multi-gen-LRU-per-process-heatmaps/20220911-163720
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
config: x86_64-randconfig-r022-20220912 (https://download.01.org/0day-ci/archive/20220913/202209131022.iAfoS5Cj-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/cf24b7f2ea91083cc7630500059db49811243805
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yuanchu-Xie/mm-multi-gen-LRU-per-process-heatmaps/20220911-163720
        git checkout cf24b7f2ea91083cc7630500059db49811243805
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> mm/vmscan.c:3416:6: warning: no previous prototype for function 'bpf_set_skip_mm' [-Wmissing-prototypes]
   void bpf_set_skip_mm(struct bpf_mglru_should_skip_mm_control *ctl)
        ^
   mm/vmscan.c:3416:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void bpf_set_skip_mm(struct bpf_mglru_should_skip_mm_control *ctl)
   ^
   static 
>> mm/vmscan.c:3422:1: warning: no previous prototype for function 'bpf_mglru_should_skip_mm' [-Wmissing-prototypes]
   bpf_mglru_should_skip_mm(struct bpf_mglru_should_skip_mm_control *ctl)
   ^
   mm/vmscan.c:3421:17: note: declare 'static' if the function is not intended to be used outside of this translation unit
   __weak noinline void
                   ^
                   static 
>> mm/vmscan.c:3906:22: warning: no previous prototype for function 'mglru_pte_probe' [-Wmissing-prototypes]
   __weak noinline void mglru_pte_probe(pid_t pid, unsigned int nid, unsigned long addr,
                        ^
   mm/vmscan.c:3906:17: note: declare 'static' if the function is not intended to be used outside of this translation unit
   __weak noinline void mglru_pte_probe(pid_t pid, unsigned int nid, unsigned long addr,
                   ^
                   static 
>> mm/vmscan.c:3912:22: warning: no previous prototype for function 'mglru_pmd_probe' [-Wmissing-prototypes]
   __weak noinline void mglru_pmd_probe(pid_t pid, unsigned int nid, unsigned long addr,
                        ^
   mm/vmscan.c:3912:17: note: declare 'static' if the function is not intended to be used outside of this translation unit
   __weak noinline void mglru_pmd_probe(pid_t pid, unsigned int nid, unsigned long addr,
                   ^
                   static 
>> mm/vmscan.c:4219:18: error: no member named 'owner' in 'struct mm_struct'
           walk->pid = mm->owner->pid;
                       ~~  ^
>> mm/vmscan.c:5706:5: warning: no previous prototype for function 'bpf_run_aging' [-Wmissing-prototypes]
   int bpf_run_aging(int memcg_id, bool can_swap,
       ^
   mm/vmscan.c:5706:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int bpf_run_aging(int memcg_id, bool can_swap,
   ^
   static 
   5 warnings and 1 error generated.


vim +4219 mm/vmscan.c

  4208	
  4209	static void walk_mm(struct lruvec *lruvec, struct mm_struct *mm, struct lru_gen_mm_walk *walk)
  4210	{
  4211		static const struct mm_walk_ops mm_walk_ops = {
  4212			.test_walk = should_skip_vma,
  4213			.p4d_entry = walk_pud_range,
  4214		};
  4215	
  4216		int err;
  4217		struct mem_cgroup *memcg = lruvec_memcg(lruvec);
  4218	
> 4219		walk->pid = mm->owner->pid;
  4220		walk->next_addr = FIRST_USER_ADDRESS;
  4221	
  4222		do {
  4223			err = -EBUSY;
  4224	
  4225			/* folio_update_gen() requires stable folio_memcg() */
  4226			if (!mem_cgroup_trylock_pages(memcg))
  4227				break;
  4228	
  4229			/* the caller might be holding the lock for write */
  4230			if (mmap_read_trylock(mm)) {
  4231				err = walk_page_range(mm, walk->next_addr, ULONG_MAX, &mm_walk_ops, walk);
  4232	
  4233				mmap_read_unlock(mm);
  4234			}
  4235	
  4236			mem_cgroup_unlock_pages();
  4237	
  4238			if (walk->batched) {
  4239				spin_lock_irq(&lruvec->lru_lock);
  4240				reset_batch_size(lruvec, walk);
  4241				spin_unlock_irq(&lruvec->lru_lock);
  4242			}
  4243	
  4244			cond_resched();
  4245		} while (err == -EAGAIN);
  4246	}
  4247	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
