Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F4E20B20;
	Thu,  2 May 2024 23:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714693571; cv=none; b=SQTb9BeKtc6lJ/7GuJVrImKCJ8lPNyWOB4RO/7c8SHwZUAe7NKwafqfI7C/bcBLoP5wxg93y3B+8LzOidgUVAR1X8AGTNDTM4s7elEQV+f+PAjHSGhpgGfoYMC3fNQgwwnxDsPAYTZBPz6oYrC0v7KkwoJNvEg3JX9Es1kkDBe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714693571; c=relaxed/simple;
	bh=H4vQ0IDo8enAxAIvUWGn+t+WLAEfkcfc4FI1Uly/1XM=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XyRLiGJoON0nqps27MhO1ew0jsCUIrBiKp92Fn9A+r5kD/8R+Q4ZeRa+15zudx7H7+3gl5Ag4BDh6AZx6MJxEvZzfapInpgT6fAs0JKcXfzTxjznsH9p9SADbfm4aCeFohkes5Ha06wMNcgJNMh0IR7gW2/rH3NgRYAuGR8BZyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zy+xWwrz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zy+xWwrz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714693568; x=1746229568;
  h=date:from:cc:subject:message-id:mime-version;
  bh=H4vQ0IDo8enAxAIvUWGn+t+WLAEfkcfc4FI1Uly/1XM=;
  b=Zy+xWwrz6JPZxGN+qpV0AH263oqoOPBW5zFLdCz7LO2cJ92gOioG5Ki3
   M6+uIyC2nTgvW/APC/K1rixXQ11mV8lBG6oUj9x05pdYWbL4H3RZUhWaQ
   pEmYMZtycrS2tr2E10nL2WfZtOXDVEqc8euYS0j/lcdwcqiB6NhAY/vVr
   sFiKsqvCH9/UXEUNOdGQDS1YxO8XeODtqk53CLKCxfssTkCQvpsyly2x/
   REyL/byk8ZNv5ioWk0IvcC3u6OCY7/3XcSbF7MQpBncMXAyw7+GqLTiWc
   ne1fEV78XJwlxbD+7+cmNswf8RRKw5vCvD6Q4fR8jN6QAu/7Pf+TxIPcW
   Q==;
X-CSE-ConnectionGUID: TIjJkw0QQHOoBJ/gXYljoQ==
X-CSE-MsgGUID: HZwlAByCRbeHjS968NFBlQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10351299"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="10351299"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 16:46:07 -0700
X-CSE-ConnectionGUID: cDgSTQzaSsup2RItHNLA8Q==
X-CSE-MsgGUID: +hPGsA37QhKL0M+vedtChw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="31899210"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 May 2024 16:46:05 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2g7n-000B8u-12;
	Thu, 02 May 2024 23:46:03 +0000
Date: Fri, 3 May 2024 07:45:41 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH 34/39] sched_ext: Implement core-sched support
Message-ID: <202405030744.PiA8O8o8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20240501151312.635565-35-tj@kernel.org>
References: <20240501151312.635565-35-tj@kernel.org>
TO: Tejun Heo <tj@kernel.org>
TO: torvalds@linux-foundation.org
TO: mingo@redhat.com
TO: peterz@infradead.org
TO: juri.lelli@redhat.com
TO: vincent.guittot@linaro.org
TO: dietmar.eggemann@arm.com
TO: rostedt@goodmis.org
TO: bsegall@google.com
TO: mgorman@suse.de
TO: bristot@redhat.com
TO: vschneid@redhat.com
TO: ast@kernel.org
TO: daniel@iogearbox.net
TO: andrii@kernel.org
TO: martin.lau@kernel.org
TO: joshdon@google.com
TO: brho@google.com
TO: pjt@google.com
TO: derkling@google.com
TO: haoluo@google.com
TO: dvernet@meta.com
TO: dschatzberg@meta.com
TO: dskarlat@cs.cmu.edu
TO: riel@surriel.com
TO: changwoo@igalia.com
TO: himadrics@inria.fr
TO: memxor@gmail.com
TO: andrea.righi@canonical.com
TO: joel@joelfernandes.org
CC: linux-kernel@vger.kernel.org

Hi Tejun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shuah-kselftest/next]
[also build test WARNING on shuah-kselftest/fixes tj-cgroup/for-next linus/master v6.9-rc6]
[cannot apply to tip/sched/core next-20240502]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tejun-Heo/sched-Restructure-sched_class-order-sanity-checks-in-sched_init/20240502-031858
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20240501151312.635565-35-tj%40kernel.org
patch subject: [PATCH 34/39] sched_ext: Implement core-sched support
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240503/202405030744.PiA8O8o8-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405030744.PiA8O8o8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405030744.PiA8O8o8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:25:
   In file included from include/linux/livepatch.h:13:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_policy.c:61:
>> kernel/sched/ext.c:4809:35: warning: bitwise operation between different enumeration types ('enum bpf_type_flag' and 'enum bpf_reg_type') [-Wenum-enum-conversion]
    4809 |                 info->reg_type = PTR_MAYBE_NULL | PTR_TO_BTF_ID | PTR_TRUSTED;
         |                                  ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
>> kernel/sched/ext.c:5276:31: warning: bitwise operation between different enumeration types ('enum scx_enq_flags' and 'enum scx_deq_flags') [-Wenum-enum-conversion]
    5276 |         WRITE_ONCE(v, SCX_ENQ_WAKEUP | SCX_DEQ_SLEEP | SCX_KICK_PREEMPT |
         |                       ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:61:18: note: expanded from macro 'WRITE_ONCE'
      61 |         __WRITE_ONCE(x, val);                                           \
         |                         ^~~
   include/asm-generic/rwonce.h:55:33: note: expanded from macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                                        ^~~
   7 warnings generated.


vim +4809 kernel/sched/ext.c

0fd2633c1c5c3c Tejun Heo 2024-05-01  4756  
0fd2633c1c5c3c Tejun Heo 2024-05-01  4757  /* Make the 2nd argument of .dispatch a pointer that can be NULL. */
0fd2633c1c5c3c Tejun Heo 2024-05-01  4758  static bool promote_dispatch_2nd_arg(int off, int size,
0fd2633c1c5c3c Tejun Heo 2024-05-01  4759  				     enum bpf_access_type type,
0fd2633c1c5c3c Tejun Heo 2024-05-01  4760  				     const struct bpf_prog *prog,
0fd2633c1c5c3c Tejun Heo 2024-05-01  4761  				     struct bpf_insn_access_aux *info)
0fd2633c1c5c3c Tejun Heo 2024-05-01  4762  {
0fd2633c1c5c3c Tejun Heo 2024-05-01  4763  	struct btf *btf = bpf_get_btf_vmlinux();
0fd2633c1c5c3c Tejun Heo 2024-05-01  4764  	const struct bpf_struct_ops_desc *st_ops_desc;
0fd2633c1c5c3c Tejun Heo 2024-05-01  4765  	const struct btf_member *member;
0fd2633c1c5c3c Tejun Heo 2024-05-01  4766  	const struct btf_type *t;
0fd2633c1c5c3c Tejun Heo 2024-05-01  4767  	u32 btf_id, member_idx;
0fd2633c1c5c3c Tejun Heo 2024-05-01  4768  	const char *mname;
0fd2633c1c5c3c Tejun Heo 2024-05-01  4769  
0fd2633c1c5c3c Tejun Heo 2024-05-01  4770  	/* btf_id should be the type id of struct sched_ext_ops */
0fd2633c1c5c3c Tejun Heo 2024-05-01  4771  	btf_id = prog->aux->attach_btf_id;
0fd2633c1c5c3c Tejun Heo 2024-05-01  4772  	st_ops_desc = bpf_struct_ops_find(btf, btf_id);
0fd2633c1c5c3c Tejun Heo 2024-05-01  4773  	if (!st_ops_desc)
0fd2633c1c5c3c Tejun Heo 2024-05-01  4774  		return false;
0fd2633c1c5c3c Tejun Heo 2024-05-01  4775  
0fd2633c1c5c3c Tejun Heo 2024-05-01  4776  	/* BTF type of struct sched_ext_ops */
0fd2633c1c5c3c Tejun Heo 2024-05-01  4777  	t = st_ops_desc->type;
0fd2633c1c5c3c Tejun Heo 2024-05-01  4778  
0fd2633c1c5c3c Tejun Heo 2024-05-01  4779  	member_idx = prog->expected_attach_type;
0fd2633c1c5c3c Tejun Heo 2024-05-01  4780  	if (member_idx >= btf_type_vlen(t))
0fd2633c1c5c3c Tejun Heo 2024-05-01  4781  		return false;
0fd2633c1c5c3c Tejun Heo 2024-05-01  4782  
0fd2633c1c5c3c Tejun Heo 2024-05-01  4783  	/*
0fd2633c1c5c3c Tejun Heo 2024-05-01  4784  	 * Get the member name of this struct_ops program, which corresponds to
0fd2633c1c5c3c Tejun Heo 2024-05-01  4785  	 * a field in struct sched_ext_ops. For example, the member name of the
0fd2633c1c5c3c Tejun Heo 2024-05-01  4786  	 * dispatch struct_ops program (callback) is "dispatch".
0fd2633c1c5c3c Tejun Heo 2024-05-01  4787  	 */
0fd2633c1c5c3c Tejun Heo 2024-05-01  4788  	member = &btf_type_member(t)[member_idx];
0fd2633c1c5c3c Tejun Heo 2024-05-01  4789  	mname = btf_name_by_offset(btf_vmlinux, member->name_off);
0fd2633c1c5c3c Tejun Heo 2024-05-01  4790  
0fd2633c1c5c3c Tejun Heo 2024-05-01  4791  	/*
0fd2633c1c5c3c Tejun Heo 2024-05-01  4792  	 * Check if it is the second argument of the function pointer at
0fd2633c1c5c3c Tejun Heo 2024-05-01  4793  	 * "dispatch" in struct sched_ext_ops. The arguments of struct_ops
0fd2633c1c5c3c Tejun Heo 2024-05-01  4794  	 * operators are sequential and 64-bit, so the second argument is at
0fd2633c1c5c3c Tejun Heo 2024-05-01  4795  	 * offset sizeof(__u64).
0fd2633c1c5c3c Tejun Heo 2024-05-01  4796  	 */
0fd2633c1c5c3c Tejun Heo 2024-05-01  4797  	if (strcmp(mname, "dispatch") == 0 &&
0fd2633c1c5c3c Tejun Heo 2024-05-01  4798  	    off == sizeof(__u64)) {
0fd2633c1c5c3c Tejun Heo 2024-05-01  4799  		/*
0fd2633c1c5c3c Tejun Heo 2024-05-01  4800  		 * The value is a pointer to a type (struct task_struct) given
0fd2633c1c5c3c Tejun Heo 2024-05-01  4801  		 * by a BTF ID (PTR_TO_BTF_ID). It is trusted (PTR_TRUSTED),
0fd2633c1c5c3c Tejun Heo 2024-05-01  4802  		 * however, can be a NULL (PTR_MAYBE_NULL). The BPF program
0fd2633c1c5c3c Tejun Heo 2024-05-01  4803  		 * should check the pointer to make sure it is not NULL before
0fd2633c1c5c3c Tejun Heo 2024-05-01  4804  		 * using it, or the verifier will reject the program.
0fd2633c1c5c3c Tejun Heo 2024-05-01  4805  		 *
0fd2633c1c5c3c Tejun Heo 2024-05-01  4806  		 * Longer term, this is something that should be addressed by
0fd2633c1c5c3c Tejun Heo 2024-05-01  4807  		 * BTF, and be fully contained within the verifier.
0fd2633c1c5c3c Tejun Heo 2024-05-01  4808  		 */
0fd2633c1c5c3c Tejun Heo 2024-05-01 @4809  		info->reg_type = PTR_MAYBE_NULL | PTR_TO_BTF_ID | PTR_TRUSTED;
0fd2633c1c5c3c Tejun Heo 2024-05-01  4810  		info->btf = btf_vmlinux;
0fd2633c1c5c3c Tejun Heo 2024-05-01  4811  		info->btf_id = task_struct_type_id;
0fd2633c1c5c3c Tejun Heo 2024-05-01  4812  
0fd2633c1c5c3c Tejun Heo 2024-05-01  4813  		return true;
0fd2633c1c5c3c Tejun Heo 2024-05-01  4814  	}
0fd2633c1c5c3c Tejun Heo 2024-05-01  4815  
0fd2633c1c5c3c Tejun Heo 2024-05-01  4816  	return false;
0fd2633c1c5c3c Tejun Heo 2024-05-01  4817  }
0fd2633c1c5c3c Tejun Heo 2024-05-01  4818  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
