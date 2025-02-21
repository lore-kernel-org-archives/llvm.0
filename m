Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F321E4110;
	Fri, 21 Feb 2025 12:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740139760; cv=none; b=IfBp7tAQSa7K/JsPddEjvzrDvGNFdBRvL+LngxAy7NYUJH2F4k2lnjxEpADoZxFFhDEypd0XUQ/ly6Pzhwly7dI+ZNO9Ob+KLE6u+GPmT2gCAmGd64NQGO+tXYvZhbHoirCFD/bvDAIXksNjBv92UjXTge//RK5To4q2NGGV0UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740139760; c=relaxed/simple;
	bh=CfNmBLOxAWnaWdoPOVNFimEWPZH8p+VwR8krHYB5Mqs=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PVOCwztZOdr6ew28XyPagSU6LYlzwgqzxyqH8SeHnhUro6NRMoDVzv+Qi2dZgQdopFecTgMhM8oP0p79aqakbWGxdZkoTjqSA1e5kz8puHgQPOhr2zOYuLhR5//7kERFVFSNimNm9MCxeI3QenTqw/GhcYTqbO/qjHymq9WKHpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RhBEZ9/N; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RhBEZ9/N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740139759; x=1771675759;
  h=date:from:cc:subject:message-id:mime-version;
  bh=CfNmBLOxAWnaWdoPOVNFimEWPZH8p+VwR8krHYB5Mqs=;
  b=RhBEZ9/NwKYnhyGMnaLgN9FWYfGbDp1I7fyrSlTo1RN9eft2x2fPbu61
   H9HFy8HHcToDIgQ0MVkUn3ug08kHB93BXLoPN47KD8700rFqjIWZO+jkC
   hUaR6D4KnKjXUS86FlN0I6PNMEQi0+3zmPemjR463riHYXFVHn9NRIMrx
   CTJnZIqwQdugEKCIcUGKoGoCdhJvpzGg2/Ex1WdU/aFtLNrtyojRzI+Ch
   k3jnHx2p5022mHv4QXotMwFCmxkDOVsn5fgj0C+67z/+SXYugYiVROWHN
   9KQTxsTyvZldcONQ3O6TFi+ZB5gmuUqL0aCzJGF9cCy9uTorap1rtIYZS
   A==;
X-CSE-ConnectionGUID: 12i2DodJRnC9GvXxrZ4okw==
X-CSE-MsgGUID: EjP0/xlnQG+vlAag+JkpLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40809388"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="40809388"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 04:09:18 -0800
X-CSE-ConnectionGUID: 2d99ROkIRJOE3XFk1MmIew==
X-CSE-MsgGUID: ka8yhyVNQ7Cia3ieaxyutA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119481435"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 21 Feb 2025 04:09:16 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlRqD-0005UK-3D;
	Fri, 21 Feb 2025 12:09:13 +0000
Date: Fri, 21 Feb 2025 20:09:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: kernel/bpf/verifier.c:6415:36: warning: bitwise operation between
 different enumeration types ('const enum bpf_arg_type' and 'enum
 bpf_type_flag')
Message-ID: <202502211951.Vvmun4BS-lkp@intel.com>
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

Hi Maxim,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   334426094588f8179fe175a09ecc887ff0c75758
commit: 508362ac66b0478affb4e52cb8da98478312d72d bpf: Allow helpers to accept pointers with a fixed size
date:   2 years, 8 months ago
config: arm-randconfig-004-20250120 (https://download.01.org/0day-ci/archive/20250221/202502211951.Vvmun4BS-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502211951.Vvmun4BS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502211951.Vvmun4BS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/bpf/verifier.c:7:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1725:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
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
   38 warnings generated.


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
