Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B86241115;
	Sat,  8 Feb 2025 20:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739044976; cv=none; b=q+aVPpTOu11Cu10X6rSSqNbrCWQIqMD3rvQQrJHkGfqWLEVghZxmNarrXb0KfkxbqOBpClrQQ8HWG2UA0mEkdSZvMhmFRxPgeiF5LtWrC1I5g0RbDRh+QX/sVpg4RBINfXuH6PtFawlL9xirv+v/ev58wraHxPDyZT4iVuWpq/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739044976; c=relaxed/simple;
	bh=9F1JRfC5SmavHsALudoMAvClBIRRUx+LHU3Uy7UQpWU=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uSJfvHjN5Wy5DSnLdAqMK/w1aCzx8opoU+f/+fsn0BTo/auxCVUdW5dcJVQSxGcVoT60L06r9P9k3sQuGeNclEu2iY10k4JRc2OTBrQ1BRflqkFBV9rwCMxBFGafyYoRCeL8W1FATGikHQCw2cI2EnDUgTvk3+5NQ4HWBTx5+3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQnN6YsM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQnN6YsM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739044975; x=1770580975;
  h=date:from:cc:subject:message-id:mime-version;
  bh=9F1JRfC5SmavHsALudoMAvClBIRRUx+LHU3Uy7UQpWU=;
  b=HQnN6YsMDhpfUXzJ5YFTv50KxYedZWg4dOfKDYTjEONiSFHUbO7Cb5mo
   3o2xACMAY7ujklgE0v4btV5Zd7BpSf7V4ffuttpsv2PO0+jYdBNNUGzUl
   Wy5XoTM5C75C2AuzRsj0wsBZKneSpX7gLB3aEcK5ri0nRogxwLOERVl6v
   azcRqWw5SGmfz8zfWKugmg50xQB2us6Yp4h7cbwgOz0W7DMyT/GCk/os3
   6gwhXRV7WWPiDA5JlSam2rC9DTg33wZCDzE1LM7fgcNZ24Sr+669FmCU2
   WceaQAscn7uirzF6IKfo2ahe5MAxWVjyFd1QzhnuFXbz3cgdh6nFWQFji
   A==;
X-CSE-ConnectionGUID: 7krDHdRrTsyX7BGREKwUUQ==
X-CSE-MsgGUID: frl9fpF9TiieZArZ999nEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="57083268"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="57083268"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 12:02:54 -0800
X-CSE-ConnectionGUID: ulU/94NgQPOJIKKk1wKGOw==
X-CSE-MsgGUID: mwkpxn6ATXCFyi4u5RTMYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115898499"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Feb 2025 12:02:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgr2Q-0010ZT-1g;
	Sat, 08 Feb 2025 20:02:50 +0000
Date: Sun, 9 Feb 2025 04:01:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: kernel/bpf/verifier.c:6415:36: warning: bitwise operation between
 different enumeration types ('const enum bpf_arg_type' and 'enum
 bpf_type_flag')
Message-ID: <202502090306.RD7if8VP-lkp@intel.com>
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
head:   8f6629c004b193d23612641c3607e785819e97ab
commit: 508362ac66b0478affb4e52cb8da98478312d72d bpf: Allow helpers to accept pointers with a fixed size
date:   2 years, 8 months ago
config: arm-randconfig-004-20250120 (https://download.01.org/0day-ci/archive/20250209/202502090306.RD7if8VP-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502090306.RD7if8VP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502090306.RD7if8VP-lkp@intel.com/

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
