Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AFC259482;
	Sun, 29 Dec 2024 12:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735475991; cv=none; b=DyL1ccn9Q9c5zgQt0o1alQ6pgqO36yRXpxVlpVPi3EWc7Wn+heFZAu96Jn+3S7s4I4x6OP4IIqp+heT7boc+mWnKJAiYlXUCJfhzIJ31UkO9ZLJgXFn8AII2eyST/qj7XoMltxQf2faqKi10iFTNOEA0J00FThnNBaiHV2qv3rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735475991; c=relaxed/simple;
	bh=S4OUIIaLhLxTrJVLprdJ+CG+NixwuyFGSnjG+hCJXhI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=somPqzbXsq2w5BrrpE4SnZpJcaj3c9jtANEU27UJHagFDr/6+/CTpqFGhrJAa0yHIGV6MQKzdPc+80w5K5WNHpun0TwNWJ8Yrct+OqX75QIPmE46Ri+GUE0ZN3ztixXGh453F9XozdBIodANY2z3j+IZh+eCiKm3ekRxDFPtoRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hWRspRYX; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hWRspRYX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735475989; x=1767011989;
  h=date:from:cc:subject:message-id:mime-version;
  bh=S4OUIIaLhLxTrJVLprdJ+CG+NixwuyFGSnjG+hCJXhI=;
  b=hWRspRYXHScHtQHhM8GrREmqWoZwt/L2aPiIcAnjALpt7MQNdlhusQJC
   RZCNe0T+YEpgU+aXL77a+90IfKNNDAL3qX33rsu/moOodzq5jar0MZ1sU
   5SbqJAUffgCkRufLB262TRNBgk/0PCUh3jqS2VwggSGHAP+0u2RBewX/Z
   HrurDl3ZlC3Z+q2bxTQuqgK0WvWFB50Op/oU/k7YPNFOvbucgVuLGGOiW
   MuUJ3RD0sEV4MCSqzd/TDoGOVGs9WX607cd4N0ZO5FB9dxmDvoFZ0lUh9
   TxMWHWh3rKi5Rr/ZOUncYDqGNY1DLy+fjZYFSvVJnKnriHXQioLRRWYtd
   w==;
X-CSE-ConnectionGUID: BRLwJw6pQAiWlZAggHNIgA==
X-CSE-MsgGUID: YsUeBKeJTvuHGFs9iycGcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35817091"
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="35817091"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 04:39:49 -0800
X-CSE-ConnectionGUID: XvhopCZ0Sk2Qch95py3Z1A==
X-CSE-MsgGUID: EFlLfmHcTD+86s3Tw2PN+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="100731811"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Dec 2024 04:39:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRsa9-0004fs-20;
	Sun, 29 Dec 2024 12:39:45 +0000
Date: Sun, 29 Dec 2024 20:39:18 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: kernel/bpf/verifier.c:6415:36: warning: bitwise operation between
 different enumeration types ('const enum bpf_arg_type' and 'enum
 bpf_type_flag')
Message-ID: <202412292001.FUEf7xur-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Maxim Mikityanskiy <maximmi@nvidia.com>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Tariq Toukan <tariqt@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   059dd502b263d8a4e2a84809cf1068d6a3905e6f
commit: 508362ac66b0478affb4e52cb8da98478312d72d bpf: Allow helpers to accept pointers with a fixed size
date:   2 years, 6 months ago
config: arm64-randconfig-003-20241220 (https://download.01.org/0day-ci/archive/20241229/202412292001.FUEf7xur-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412292001.FUEf7xur-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412292001.FUEf7xur-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/bpf/verifier.c:7:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1725:
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
   kernel/bpf/verifier.c:560:11: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     560 |         if (type & PTR_MAYBE_NULL) {
         |             ~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:567:11: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     567 |         if (type & MEM_RDONLY)
         |             ~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:569:11: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     569 |         if (type & MEM_ALLOC)
         |             ~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:571:11: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     571 |         if (type & MEM_USER)
         |             ~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:573:11: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     573 |         if (type & MEM_PERCPU)
         |             ~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:575:11: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     575 |         if (type & PTR_UNTRUSTED)
         |             ~~~~ ^ ~~~~~~~~~~~~~
   kernel/bpf/verifier.c:1710:35: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1710 |         regs[regno].type = PTR_TO_BTF_ID | flag;
         |                            ~~~~~~~~~~~~~ ^ ~~~~
   kernel/bpf/verifier.c:3719:62: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    3719 |                 verbose(env, " or %s%s\n", reg_type_str(env, PTR_TO_BTF_ID | PTR_UNTRUSTED),
         |                                                              ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   kernel/bpf/verifier.c:4499:16: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    4499 |         if (reg->type & MEM_USER) {
         |             ~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:4506:16: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    4506 |         if (reg->type & MEM_PERCPU) {
         |             ~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:5550:14: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5550 |         return type & OBJ_RELEASE;
         |                ~~~~ ^ ~~~~~~~~~~~
   kernel/bpf/verifier.c:5643:14: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5643 |                 PTR_TO_MEM | MEM_ALLOC,
         |                 ~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:5661:77: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5661 | static const struct bpf_reg_types alloc_mem_types = { .types = { PTR_TO_MEM | MEM_ALLOC } };
         |                                                                  ~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:5665:85: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5665 | static const struct bpf_reg_types percpu_btf_ptr_types = { .types = { PTR_TO_BTF_ID | MEM_PERCPU } };
         |                                                                       ~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:5726:15: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5726 |         if (arg_type & MEM_RDONLY)
         |             ~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:5728:15: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5728 |         if (arg_type & PTR_MAYBE_NULL)
         |             ~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:5799:18: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5799 |         case PTR_TO_MEM | MEM_RDONLY:
         |              ~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:5800:18: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5800 |         case PTR_TO_MEM | MEM_ALLOC:
         |              ~~~~~~~~~~ ^ ~~~~~~~~~
   kernel/bpf/verifier.c:5802:18: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5802 |         case PTR_TO_BUF | MEM_RDONLY:
         |              ~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:5987:29: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5987 |                 meta->raw_mode = arg_type & MEM_UNINIT;
         |                                  ~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:6018:29: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6018 |                 meta->raw_mode = arg_type & MEM_UNINIT;
         |                                  ~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:6019:16: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6019 |                 if (arg_type & MEM_FIXED_SIZE) {
         |                     ~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:6029:16: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6029 |                 if (arg_type & MEM_UNINIT) {
         |                     ~~~~~~~~ ^ ~~~~~~~~~~
>> kernel/bpf/verifier.c:6415:36: warning: bitwise operation between different enumeration types ('const enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6415 |         bool is_fixed = fn->arg_type[arg] & MEM_FIXED_SIZE;
         |                         ~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:6484:26: warning: bitwise operation between different enumeration types ('const enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6484 |                      !(fn->arg_type[i] & MEM_FIXED_SIZE)))
         |                        ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:7324:43: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    7324 |                 regs[BPF_REG_0].type = PTR_TO_MAP_VALUE | ret_flag;
         |                                        ~~~~~~~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:7331:40: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    7331 |                 regs[BPF_REG_0].type = PTR_TO_SOCKET | ret_flag;
         |                                        ~~~~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:7334:45: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    7334 |                 regs[BPF_REG_0].type = PTR_TO_SOCK_COMMON | ret_flag;
         |                                        ~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:7337:42: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    7337 |                 regs[BPF_REG_0].type = PTR_TO_TCP_SOCK | ret_flag;
         |                                        ~~~~~~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:7340:37: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    7340 |                 regs[BPF_REG_0].type = PTR_TO_MEM | ret_flag;
         |                                        ~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:7360:38: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    7360 |                         regs[BPF_REG_0].type = PTR_TO_MEM | ret_flag;
         |                                                ~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:7370:41: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    7370 |                         regs[BPF_REG_0].type = PTR_TO_BTF_ID | ret_flag;
         |                                                ~~~~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:7379:40: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    7379 |                 regs[BPF_REG_0].type = PTR_TO_BTF_ID | ret_flag;
         |                                        ~~~~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:8055:20: warning: bitwise operation between different enumeration types ('const enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    8055 |         if (ptr_reg->type & PTR_MAYBE_NULL) {
         |             ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:12436:41: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12436 |                 aux->btf_var.reg_type = PTR_TO_BTF_ID | MEM_PERCPU;
          |                                         ~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:12453:38: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    12453 |                 aux->btf_var.reg_type = PTR_TO_MEM | MEM_RDONLY;
          |                                         ~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:13401:22: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    13401 |                 case PTR_TO_BTF_ID | PTR_UNTRUSTED:
          |                      ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~
   42 warnings generated.


vim +6415 kernel/bpf/verifier.c

  6412	
  6413	static bool check_args_pair_invalid(const struct bpf_func_proto *fn, int arg)
  6414	{
> 6415		bool is_fixed = fn->arg_type[arg] & MEM_FIXED_SIZE;
  6416		bool has_size = fn->arg_size[arg] != 0;
  6417		bool is_next_size = false;
  6418	
  6419		if (arg + 1 < ARRAY_SIZE(fn->arg_type))
  6420			is_next_size = arg_type_is_mem_size(fn->arg_type[arg + 1]);
  6421	
  6422		if (base_type(fn->arg_type[arg]) != ARG_PTR_TO_MEM)
  6423			return is_next_size;
  6424	
  6425		return has_size == is_next_size || is_next_size == is_fixed;
  6426	}
  6427	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
