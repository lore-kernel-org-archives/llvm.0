Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC474748D;
	Sun, 15 Sep 2024 00:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726361129; cv=none; b=gmIAUSQaIMxG/d9yqdnvAtwlMLHIlfdK6f/goVf5MxiHNoY78ABFIAINWOD305eBJs0TJcp5gOWJFV5AhrM+umAs5DS2DGgr8s/BQGbuW6jm98AjZgoCUNNszsQchZnj6TEZ0jbzb7miOjxlfwNiHFu0mEeHrvdG7xXRXpwzxFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726361129; c=relaxed/simple;
	bh=rzpoC3PTrWBxfrM9K9hSN8NaT+zXI6PVv31t8NZgxF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MxXwDBGIx1gm5t4nnJ88EgkGgpccfDv1wPf8ZpR3zANhIs0BPVoLJOOeLT1f+2cePDF07E+e2DGe32fXrAk9mHx12jz7bZUilCa4RUmBaPqqE3nfHPIsN3uluKnu/g7XZiykXs5Q2QYz7iLOMsMuqvC4JDdpvU1aatDomms8/Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RU1wxmvs; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RU1wxmvs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726361127; x=1757897127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rzpoC3PTrWBxfrM9K9hSN8NaT+zXI6PVv31t8NZgxF0=;
  b=RU1wxmvsFo8obKBUDAjpU4YtoQ0ek0gH/2x9qXrWhI/mtqQIlmgxZ+ei
   EkhtV2AcxNITpcI4mvpapjxKHwvCyvq1MOKZJi3qG56VCJ5G/cxTSMv7o
   4NCJhTZ+0WDKb+PuPkJzwoA7R/DwN9XN0QwAQAmkIFUitWgqVUQMmlswF
   k/Ui8rDUcmQarkzZAbwIoT9X76GSyry/ZuvHQNWs91iBTaNWn8iL3ny6S
   OTnlw6cEz4B3Ik2fQYQVQVR5DKSEBgNlN87u9jDDAgsLwByasXMcZ2q7I
   TKH59qew0HYNsyRu3YrsKEt9Revp0GYNZ9prv0smdG+dSIQ15huZI9mgu
   A==;
X-CSE-ConnectionGUID: 7ne6TwPtT3e3dnhqN12REQ==
X-CSE-MsgGUID: M+bPXl5KR+aLXV4Jp2a3gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="42746260"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="42746260"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 17:45:26 -0700
X-CSE-ConnectionGUID: IYbYiDKVRKC4Ooe7AsrJSQ==
X-CSE-MsgGUID: YAEwZMl4RfyeITEtrsWnKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="68830726"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Sep 2024 17:45:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spdOE-0008Hq-1I;
	Sun, 15 Sep 2024 00:45:22 +0000
Date: Sun, 15 Sep 2024 08:44:32 +0800
From: kernel test robot <lkp@intel.com>
To: Fares Mehanna <faresx@amazon.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 7/7] arm64: KVM: Allocate vCPU fp-regs dynamically on
 VHE and KERNEL_SECRETMEM enabled systems
Message-ID: <202409150822.gguVxnNM-lkp@intel.com>
References: <20240911143421.85612-8-faresx@amazon.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911143421.85612-8-faresx@amazon.de>

Hi Fares,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on linus/master v6.11-rc7]
[cannot apply to kvmarm/next akpm-mm/mm-everything next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fares-Mehanna/mseal-expose-interface-to-seal-unseal-user-memory-ranges/20240911-223945
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20240911143421.85612-8-faresx%40amazon.de
patch subject: [RFC PATCH 7/7] arm64: KVM: Allocate vCPU fp-regs dynamically on VHE and KERNEL_SECRETMEM enabled systems
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240915/202409150822.gguVxnNM-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409150822.gguVxnNM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409150822.gguVxnNM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/va_layout.c:7:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/va_layout.c:212:13: warning: no previous prototype for function 'kvm_update_ctxt_gp_regs' [-Wmissing-prototypes]
     212 | void __init kvm_update_ctxt_gp_regs(struct alt_instr *alt,
         |             ^
   arch/arm64/kvm/va_layout.c:212:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     212 | void __init kvm_update_ctxt_gp_regs(struct alt_instr *alt,
         | ^
         | static 
>> arch/arm64/kvm/va_layout.c:219:13: warning: no previous prototype for function 'kvm_update_ctxt_fp_regs' [-Wmissing-prototypes]
     219 | void __init kvm_update_ctxt_fp_regs(struct alt_instr *alt,
         |             ^
   arch/arm64/kvm/va_layout.c:219:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     219 | void __init kvm_update_ctxt_fp_regs(struct alt_instr *alt,
         | ^
         | static 
   7 warnings generated.


vim +/kvm_update_ctxt_fp_regs +219 arch/arm64/kvm/va_layout.c

   218	
 > 219	void __init kvm_update_ctxt_fp_regs(struct alt_instr *alt,
   220					    __le32 *origptr, __le32 *updptr, int nr_inst)
   221	{
   222		u32 offset = offsetof(struct kvm_cpu_context, fp_regs);
   223		kvm_update_ctxt_regs(alt, origptr, updptr, nr_inst, offset);
   224	}
   225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
