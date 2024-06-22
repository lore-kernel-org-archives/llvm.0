Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8271B14BF8A;
	Sat, 22 Jun 2024 11:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719056930; cv=none; b=Tg5JEP45oNbGrAFoTS4ygdrxpyW6TP7uNj1N716SPS/8SMDXm2DcobEuX7eUrMLTktyLYXTqmPI3z3a3ZYUqHzbCMhHO+NUFmxTO9EC+fz7FHzCvzj0V/wihOnPdzpScYr7sUaJVx/+nI0xv9dJNYpBD4NmjeKwRrB2uUEe7EMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719056930; c=relaxed/simple;
	bh=5oCeKv2qGVIXPBR53wt+m2yM+0t0BtVgXYnxwEGLUHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tE6FVjIDp+jrlUTtv+RF6s30IqhuLljXPlGkyfiCcBrkwc9pKRp/OC55CFSH0+TdA+QQbZpOXEl9EDC9UeuCY7C69YMNHhzVd0a+9lqUDmJeI77hk1ptVVrqEy32hc3NsGqDTRm+qprtb/T/58Lb+4jUvcAFM+qgrbzP97VgmMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eEIq2eDl; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eEIq2eDl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719056928; x=1750592928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5oCeKv2qGVIXPBR53wt+m2yM+0t0BtVgXYnxwEGLUHg=;
  b=eEIq2eDlje5D/08NSbr77Xb/sz6HMqo/RW+zYxVyrBiQbq2tBZA67cNU
   6ewrhG34COXpvef5NnKgktHg8xb7WWsEuL9XsKEPmzmU8ca8Dn2bqcMyE
   ftN6j6Pu6WCZcqqOqth0p+QSCk0HWklz+jKexLYUkZpRiI7zuNQ5z3J9u
   eMbCpH4V/7FfwURZCmnTKh9s/j9WQSCNZ9LYE+27WmKhoypgbs7n09z99
   0F9hJSe8KdOjTNcynZcpHViakIOR4OMXpPXh0CrUAcKiksN/p/ItdXIaQ
   Fn+PySk7UPx0q1KoqEbUSdP/ipmGKzZ4yPUTByVveJMv7RmRPYOV6yy6E
   A==;
X-CSE-ConnectionGUID: f7to2vKbRI6dBYeKnt2cUA==
X-CSE-MsgGUID: KpuWmnxmS9WNr/3YSKGPZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="26770499"
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="26770499"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 04:48:45 -0700
X-CSE-ConnectionGUID: o3JNZImrRW2L0FhChEj1lw==
X-CSE-MsgGUID: 1fHcByQaQwWpoO5gBGa15Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="43515963"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Jun 2024 04:48:44 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKzEX-0009Zg-2k;
	Sat, 22 Jun 2024 11:48:41 +0000
Date: Sat, 22 Jun 2024 19:48:35 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	David Stevens <stevensd@chromium.org>,
	Maxim Levitsky <mlevitsk@redhat.com>
Subject: [sean-jc:x86/mmu_follow_pfn 13/28]
 arch/riscv/kvm/../../../virt/kvm/kvm_main.c:2987:13: error: use of
 undeclared identifier 'atomic'
Message-ID: <202406221947.gE0KLyPt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/mmu_follow_pfn
head:   57ff012a34bc3bfac1ebb0724078e8fe47fdb60a
commit: 2e1ef556dc18d78c75fc1ddc11cb770a3de6eb61 [13/28] KVM: mmu: Introduce kvm_follow_pfn()
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240622/202406221947.gE0KLyPt-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406221947.gE0KLyPt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406221947.gE0KLyPt-lkp@intel.com/

Note: the sean-jc/x86/mmu_follow_pfn HEAD 57ff012a34bc3bfac1ebb0724078e8fe47fdb60a builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kvm/../../../virt/kvm/kvm_main.c:18:
   In file included from include/linux/kvm_host.h:7:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:23:
   In file included from arch/riscv/include/asm/irq.h:10:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:2987:13: error: use of undeclared identifier 'atomic'
    2987 |                 .atomic = atomic,
         |                           ^
   1 warning and 1 error generated.


vim +/atomic +2987 arch/riscv/kvm/../../../virt/kvm/kvm_main.c

  2979	
  2980	kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
  2981				       bool interruptible, bool no_wait,
  2982				       bool write_fault, bool *writable)
  2983	{
  2984		struct kvm_follow_pfn kfp = {
  2985			.slot = slot,
  2986			.gfn = gfn,
> 2987			.atomic = atomic,
  2988			.map_writable = writable,
  2989		};
  2990	
  2991		if (write_fault)
  2992			kfp.flags |= FOLL_WRITE;
  2993		if (no_wait)
  2994			kfp.flags |= FOLL_NOWAIT;
  2995		if (interruptible)
  2996			kfp.flags |= FOLL_INTERRUPTIBLE;
  2997	
  2998		return kvm_follow_pfn(&kfp);
  2999	}
  3000	EXPORT_SYMBOL_GPL(__gfn_to_pfn_memslot);
  3001	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
