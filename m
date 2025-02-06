Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C357E22E3F7;
	Thu,  6 Feb 2025 12:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738846464; cv=none; b=HBXBDGA4hJXrflWah4bKwgTq8WdQLRlKMDIXWOet5XC1pHPw+7v1YxqeJqiFucYJNA0s4D90xFIKMZIi2z/qpV8IhxwgXy2cFRYGdIzsFC914O68aySEUVG+QVg8wUgHETITz2jSS9yCmiZo3n05DKLfUsbUB56nFqA2962746E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738846464; c=relaxed/simple;
	bh=HFEOPQSbh4+OvDSqLCPQ8bLhEuPjk6UjqSVDA1zzZ0Y=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uqmQjZgXtPrWLKBeGqKKaPR6lC4V/wL9zfCCk2/rXjLPA3WjW/+jwSw8pY88WYuhGL1IBSYWW8a6ZmALd9RvnItWW+B9QmGVqoD0zt2sl6KHpaZ6R4Bc7lA/AUOuC8JCh/htASt8spclYXfGDNYuYkS/828Ej925S+xaB/Lm978=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2k3vz1f; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2k3vz1f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738846462; x=1770382462;
  h=date:from:cc:subject:message-id:mime-version;
  bh=HFEOPQSbh4+OvDSqLCPQ8bLhEuPjk6UjqSVDA1zzZ0Y=;
  b=Y2k3vz1f0LZ1iP8wSGhVyyBomo/noMZ7cfoexgOKlP1dk11/YTraBL/z
   R8bFeE4V1Wwg9YjwlOQXHD74RcolAq+a6OFwok9pVkqMPEKT4q5xAOx1r
   /GXZ6bOUHIFUlhSdfJg2ufLCD3UXZcgQczdwqoXLbgvRMeGos/eP/9a3M
   Wjb20e5cCpKNHuS9GulDTwZAQlkFGK0yoyIiYs6susw4KkEEtc+ruMrGa
   htiCEfFH0tLph298i60pr+4HYIk8+14sDZ+7zlwjSn2ximJdL0EwS3AzC
   LHGFaFSBaAuxF82dnjqkTAcQVR05KsVyQeKFXs5OeixoLiermNLx6vHVc
   w==;
X-CSE-ConnectionGUID: suXTsbSkRJO4Zn8MVMMZdA==
X-CSE-MsgGUID: HFipYITUSp2c+5Y9hrX0vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38677042"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="38677042"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 04:54:21 -0800
X-CSE-ConnectionGUID: /9qxU1xZT9aCHM3bQjujqg==
X-CSE-MsgGUID: +fWYCnaXSRuIXMVjMikk1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112098132"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Feb 2025 04:54:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tg1Ob-000wsZ-0p;
	Thu, 06 Feb 2025 12:54:17 +0000
Date: Thu, 6 Feb 2025 20:53:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: kernel/trace/bpf_trace.c:348:30: warning: bitwise operation between
 different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag')
Message-ID: <202502062033.oIGBQgov-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Hao Luo <haoluo@google.com>
CC: Alexei Starovoitov <ast@kernel.org>

Hi Hao,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   92514ef226f511f2ca1fb1b8752966097518edc0
commit: 216e3cd2f28dbbf1fe86848e0e29e6693b9f0a20 bpf: Add MEM_RDONLY for helper args that are pointers to rdonly mem.
date:   3 years, 2 months ago
config: arm-randconfig-004-20250120 (https://download.01.org/0day-ci/archive/20250206/202502062033.oIGBQgov-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502062033.oIGBQgov-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502062033.oIGBQgov-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/trace/bpf_trace.c:8:
   In file included from include/linux/bpf.h:20:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1721:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/trace/bpf_trace.c:348:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     348 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:397:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     397 |         .arg1_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:453:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     453 |         .arg1_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:455:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     455 |         .arg3_type      = ARG_PTR_TO_MEM | PTR_MAYBE_NULL | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/trace/bpf_trace.c:495:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     495 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:497:35: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     497 |         .arg4_type      = ARG_PTR_TO_MEM | PTR_MAYBE_NULL | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/trace/bpf_trace.c:512:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     512 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:536:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     536 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:697:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     697 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:1007:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1007 |         .arg3_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:1337:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1337 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:1559:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1559 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:1613:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1613 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   14 warnings generated.
--
   In file included from kernel/bpf/syscall.c:4:
   In file included from include/linux/bpf.h:20:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1721:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/bpf/syscall.c:4776:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    4776 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   2 warnings generated.
--
   In file included from kernel/bpf/verifier.c:7:
   In file included from include/linux/bpf-cgroup.h:5:
   In file included from include/linux/bpf.h:20:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1721:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   kernel/bpf/verifier.c:563:11: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     563 |         if (type & PTR_MAYBE_NULL) {
         |             ~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:571:11: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     571 |         if (type & MEM_RDONLY)
         |             ~~~~ ^ ~~~~~~~~~~
>> kernel/bpf/verifier.c:5195:15: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5195 |         if (arg_type & MEM_RDONLY)
         |             ~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/verifier.c:5197:15: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5197 |         if (arg_type & PTR_MAYBE_NULL)
         |             ~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:6647:43: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6647 |                 regs[BPF_REG_0].type = PTR_TO_MAP_VALUE | ret_flag;
         |                                        ~~~~~~~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:6654:40: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6654 |                 regs[BPF_REG_0].type = PTR_TO_SOCKET | ret_flag;
         |                                        ~~~~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:6657:45: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6657 |                 regs[BPF_REG_0].type = PTR_TO_SOCK_COMMON | ret_flag;
         |                                        ~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:6660:42: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6660 |                 regs[BPF_REG_0].type = PTR_TO_TCP_SOCK | ret_flag;
         |                                        ~~~~~~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:6663:37: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6663 |                 regs[BPF_REG_0].type = PTR_TO_MEM | ret_flag;
         |                                        ~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:6683:38: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6683 |                         regs[BPF_REG_0].type = PTR_TO_MEM | ret_flag;
         |                                                ~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:6693:41: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6693 |                         regs[BPF_REG_0].type = PTR_TO_BTF_ID | ret_flag;
         |                                                ~~~~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:6701:40: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6701 |                 regs[BPF_REG_0].type = PTR_TO_BTF_ID | ret_flag;
         |                                        ~~~~~~~~~~~~~ ^ ~~~~~~~~
   kernel/bpf/verifier.c:7324:20: warning: bitwise operation between different enumeration types ('const enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    7324 |         if (ptr_reg->type & PTR_MAYBE_NULL) {
         |             ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/verifier.c:11717:38: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    11717 |                 aux->btf_var.reg_type = PTR_TO_MEM | MEM_RDONLY;
          |                                         ~~~~~~~~~~ ^ ~~~~~~~~~~
   15 warnings generated.
--
   In file included from kernel/bpf/helpers.c:4:
   In file included from include/linux/bpf.h:20:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1721:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/bpf/helpers.c:534:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     534 |         .arg1_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/helpers.c:562:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     562 |         .arg1_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/helpers.c:648:35: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     648 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/helpers.c:685:39: warning: bitwise operation between different enumeration types ('enum bpf_return_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     685 |         .ret_type       = RET_PTR_TO_MEM_OR_BTF_ID | PTR_MAYBE_NULL | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:698:39: warning: bitwise operation between different enumeration types ('enum bpf_return_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     698 |         .ret_type       = RET_PTR_TO_MEM_OR_BTF_ID | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/bpf/helpers.c:1029:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1029 |         .arg4_type      = ARG_PTR_TO_MEM | PTR_MAYBE_NULL | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   7 warnings generated.
--
   In file included from kernel/bpf/ringbuf.c:1:
   In file included from include/linux/bpf.h:20:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:1721:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/bpf/ringbuf.c:447:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     447 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   2 warnings generated.
--
   In file included from kernel/bpf/btf.c:6:
   In file included from include/uapi/linux/bpf_perf_event.h:11:
   In file included from ./arch/arm/include/generated/uapi/asm/bpf_perf_event.h:1:
   In file included from include/uapi/asm-generic/bpf_perf_event.h:4:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:1721:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   kernel/bpf/btf.c:5862:27: warning: bitwise operation between different enumeration types ('enum bpf_reg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5862 |                         reg->type = PTR_TO_MEM | PTR_MAYBE_NULL;
         |                                     ~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
>> kernel/bpf/btf.c:6356:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6356 |         .arg1_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   3 warnings generated.
--
   In file included from net/core/filter.c:23:
   In file included from include/linux/mm.h:1721:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> net/core/filter.c:1715:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1715 |         .arg3_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:2020:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    2020 |         .arg1_type      = ARG_PTR_TO_MEM | PTR_MAYBE_NULL | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   net/core/filter.c:2022:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    2022 |         .arg3_type      = ARG_PTR_TO_MEM | PTR_MAYBE_NULL | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   net/core/filter.c:2543:35: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    2543 |         .arg2_type      = ARG_PTR_TO_MEM | PTR_MAYBE_NULL | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   net/core/filter.c:4176:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    4176 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:4190:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    4190 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:4373:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    4373 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:4399:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    4399 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:4569:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    4569 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:4583:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    4583 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:5069:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5069 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:5103:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5103 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:5137:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5137 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:5312:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5312 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:5900:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5900 |         .arg3_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:5910:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5910 |         .arg3_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:6266:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6266 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:6285:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6285 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:6304:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6304 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:6341:35: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6341 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:6364:35: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6364 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:6387:35: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6387 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:6406:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6406 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:6425:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6425 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:6444:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6444 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:6757:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6757 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:6759:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6759 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:6826:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6826 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:6828:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6828 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:7057:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    7057 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   31 warnings generated.


vim +348 kernel/trace/bpf_trace.c

   342	
   343	static const struct bpf_func_proto bpf_probe_write_user_proto = {
   344		.func		= bpf_probe_write_user,
   345		.gpl_only	= true,
   346		.ret_type	= RET_INTEGER,
   347		.arg1_type	= ARG_ANYTHING,
 > 348		.arg2_type	= ARG_PTR_TO_MEM | MEM_RDONLY,
   349		.arg3_type	= ARG_CONST_SIZE,
   350	};
   351	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
