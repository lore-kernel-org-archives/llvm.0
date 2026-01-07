Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45F7357A5A;
	Wed,  7 Jan 2026 16:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767802401; cv=none; b=laouQCq5gcIJs+QzlA1G8K0ASvbsqBkRY8RHe858U66zDHkPD4G2+XGmDrcMlo4jJDLJCW/xaxGIPGhKvvRviPeemAeLmbXf2ElijW475M22EjZXGbaEwtIZwVvXgO7du4LpYvdVxdSvyi1f/E/1SHVIIK+kcalMrI0Iebc1q7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767802401; c=relaxed/simple;
	bh=g5hX7rx3gqypzWVwObD6RHVtceJmV34peEHX9sF0qlw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MtLqt6uhPBwUQCg36Fz7UtGyRaNxFk9OnDgoZCHxwXVYrCTD3tG3z7wi//EAHesCtsAio9sRafc32WBGYZLrb7Phz1siHbgXXn3xyHL+pO104EFnzG9ZG5DJLxwxElDTjzzfo3AFg/Ptf2LlCz2KRnV/zZ3mLbG998CW76E/rI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VsjBLLwc; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VsjBLLwc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767802388; x=1799338388;
  h=date:from:to:cc:subject:message-id;
  bh=g5hX7rx3gqypzWVwObD6RHVtceJmV34peEHX9sF0qlw=;
  b=VsjBLLwcmu8MGnU1a6Go5krbBAJsJWIgp4fMOCfFQI/kUxnxnbgl7Lv6
   eWw0Eh+Y2tFPMCZr0FSBpNTdhZ2xC3wjG/hpyz0OCcwrleg/HMHI9JUq2
   5GrtSpkTTOtHVzWSd3mthJWViS6UNbN7brq3bve2hZ4fh/nyaPab7O7Vm
   BQF5vsPnX4+x2ieKuaNKfQTQtww8Om2/rUV/ZMimv92tLaNirpT5bxVXg
   Ay+ah505OPBayShSQCg1yukC+ysUVqcL0W39F460bTPNC+CVyo9l+Rawi
   7lk8W0i4Ms/emDFqqaC5oa5W+mB4y5A55PK7FAEqcri+BhxBTLrT95Y67
   g==;
X-CSE-ConnectionGUID: 74zubGOnS0SGuVLvGlrufA==
X-CSE-MsgGUID: UEUEJONbSiC0myr7FZWUSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69335459"
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="69335459"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 08:13:00 -0800
X-CSE-ConnectionGUID: aUIlSa9WTVSzezxEjQJpUQ==
X-CSE-MsgGUID: Ig10LUVoTnmKvZXrB9y+tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,208,1763452800"; 
   d="scan'208";a="207819744"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Jan 2026 08:12:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdW9X-000000003y1-1fTE;
	Wed, 07 Jan 2026 16:12:55 +0000
Date: Thu, 08 Jan 2026 00:12:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Vishal Annapurve <vannapurve@google.com>
Subject: [intel-tdx:huge_page_v3 369/499] clang diag:
 include/linux/huge_mm.h:576:2: warning: void function
 '__split_folio_to_order' should not return a value
Message-ID: <202601080003.OCxHSviM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Ackerley,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel/tdx.git huge_page_v3
head:   deceaf0d419ad678d86b42a3f71e1a6b588163fe
commit: 51b1ab09f0ac9a5ef88c1882648453bbc8fe0274 [369/499] mm: huge_memory: Expose __split_folio_to_order
config: x86_64-randconfig-002-20260107 (https://download.01.org/0day-ci/archive/20260108/202601080003.OCxHSviM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601080003.OCxHSviM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601080003.OCxHSviM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> clang diag: include/linux/huge_mm.h:576:2: warning: void function '__split_folio_to_order' should not return a value [-Wreturn-mismatch]
--
>> clang diag: include/linux/huge_mm.h:576:2: warning: void function '__split_folio_to_order' should not return a value [-Wreturn-mismatch]
>> clang diag: include/linux/huge_mm.h:574:6: warning: no previous prototype for function '__split_folio_to_order' [-Wmissing-prototypes]
   clang diag: include/linux/memcontrol.h:1172:5: warning: no previous prototype for function 'mem_cgroup_hugetlb_try_charge' [-Wmissing-prototypes]
   clang diag: include/linux/memcontrol.h:1178:6: warning: no previous prototype for function 'mem_cgroup_commit_charge' [-Wmissing-prototypes]
   clang diag: include/linux/memcontrol.h:1182:6: warning: no previous prototype for function 'mem_cgroup_cancel_charge' [-Wmissing-prototypes]
--
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:1081:
   include/linux/huge_mm.h:576:2: warning: void function '__split_folio_to_order' should not return a value [-Wreturn-mismatch]
     576 |         return 0;
         |         ^      ~
   include/linux/huge_mm.h:574:6: warning: no previous prototype for function '__split_folio_to_order' [-Wmissing-prototypes]
     574 | void __split_folio_to_order(struct folio *folio, int old_order, int new_order)
         |      ^
   include/linux/huge_mm.h:574:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     574 | void __split_folio_to_order(struct folio *folio, int old_order, int new_order)
         | ^
         | static 
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   include/linux/memcontrol.h:1172:5: warning: no previous prototype for function 'mem_cgroup_hugetlb_try_charge' [-Wmissing-prototypes]
    1172 | int mem_cgroup_hugetlb_try_charge(struct mem_cgroup *memcg, gfp_t gfp,
         |     ^
   include/linux/memcontrol.h:1172:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1172 | int mem_cgroup_hugetlb_try_charge(struct mem_cgroup *memcg, gfp_t gfp,
         | ^
         | static 
   include/linux/memcontrol.h:1178:6: warning: no previous prototype for function 'mem_cgroup_commit_charge' [-Wmissing-prototypes]
    1178 | void mem_cgroup_commit_charge(struct folio *folio, struct mem_cgroup *memcg)
         |      ^
   include/linux/memcontrol.h:1178:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1178 | void mem_cgroup_commit_charge(struct folio *folio, struct mem_cgroup *memcg)
         | ^
         | static 
   include/linux/memcontrol.h:1182:6: warning: no previous prototype for function 'mem_cgroup_cancel_charge' [-Wmissing-prototypes]
    1182 | void mem_cgroup_cancel_charge(struct mem_cgroup *memcg, unsigned int nr_pages)
         |      ^
   include/linux/memcontrol.h:1182:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1182 | void mem_cgroup_cancel_charge(struct mem_cgroup *memcg, unsigned int nr_pages)
         | ^
         | static 
   5 warnings generated.
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:46:
   In file included from include/linux/mm.h:1081:
   include/linux/huge_mm.h:576:2: warning: void function '__split_folio_to_order' should not return a value [-Wreturn-mismatch]
     576 |         return 0;
         |         ^      ~
   include/linux/huge_mm.h:574:6: warning: no previous prototype for function '__split_folio_to_order' [-Wmissing-prototypes]
     574 | void __split_folio_to_order(struct folio *folio, int old_order, int new_order)
         |      ^
   include/linux/huge_mm.h:574:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     574 | void __split_folio_to_order(struct folio *folio, int old_order, int new_order)
         | ^
         | static 
   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:61:
   In file included from include/linux/syscalls_api.h:1:
   In file included from include/linux/syscalls.h:95:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:53:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:32:
   include/linux/memcontrol.h:1172:5: warning: no previous prototype for function 'mem_cgroup_hugetlb_try_charge' [-Wmissing-prototypes]
    1172 | int mem_cgroup_hugetlb_try_charge(struct mem_cgroup *memcg, gfp_t gfp,
         |     ^
   include/linux/memcontrol.h:1172:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1172 | int mem_cgroup_hugetlb_try_charge(struct mem_cgroup *memcg, gfp_t gfp,
         | ^
         | static 
   include/linux/memcontrol.h:1178:6: warning: no previous prototype for function 'mem_cgroup_commit_charge' [-Wmissing-prototypes]
    1178 | void mem_cgroup_commit_charge(struct folio *folio, struct mem_cgroup *memcg)
         |      ^
   include/linux/memcontrol.h:1178:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1178 | void mem_cgroup_commit_charge(struct folio *folio, struct mem_cgroup *memcg)
         | ^
         | static 
   include/linux/memcontrol.h:1182:6: warning: no previous prototype for function 'mem_cgroup_cancel_charge' [-Wmissing-prototypes]
    1182 | void mem_cgroup_cancel_charge(struct mem_cgroup *memcg, unsigned int nr_pages)
         |      ^
   include/linux/memcontrol.h:1182:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1182 | void mem_cgroup_cancel_charge(struct mem_cgroup *memcg, unsigned int nr_pages)
         | ^
         | static 
   5 warnings generated.
   llvm-nm: error: rust/helpers/helpers.o: No such file or directory
>> clang diag: include/linux/huge_mm.h:576:2: warning: void function '__split_folio_to_order' should not return a value [-Wreturn-mismatch]
>> clang diag: include/linux/huge_mm.h:574:6: warning: no previous prototype for function '__split_folio_to_order' [-Wmissing-prototypes]
   clang diag: include/linux/memcontrol.h:1172:5: warning: no previous prototype for function 'mem_cgroup_hugetlb_try_charge' [-Wmissing-prototypes]
   clang diag: include/linux/memcontrol.h:1178:6: warning: no previous prototype for function 'mem_cgroup_commit_charge' [-Wmissing-prototypes]
   clang diag: include/linux/memcontrol.h:1182:6: warning: no previous prototype for function 'mem_cgroup_cancel_charge' [-Wmissing-prototypes]
>> clang diag: include/linux/huge_mm.h:576:2: warning: void function '__split_folio_to_order' should not return a value [-Wreturn-mismatch]
>> clang diag: include/linux/huge_mm.h:576:2: warning: void function '__split_folio_to_order' should not return a value [-Wreturn-mismatch]
>> clang diag: include/linux/huge_mm.h:574:6: warning: no previous prototype for function '__split_folio_to_order' [-Wmissing-prototypes]
   clang diag: include/linux/memcontrol.h:1172:5: warning: no previous prototype for function 'mem_cgroup_hugetlb_try_charge' [-Wmissing-prototypes]
   clang diag: include/linux/memcontrol.h:1178:6: warning: no previous prototype for function 'mem_cgroup_commit_charge' [-Wmissing-prototypes]
   clang diag: include/linux/memcontrol.h:1182:6: warning: no previous prototype for function 'mem_cgroup_cancel_charge' [-Wmissing-prototypes]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
