Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D883196D9D;
	Wed,  7 Aug 2024 05:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723008924; cv=none; b=tSivKL4PJ8XHfQ41/UxfPk36xPjO2h/t+zO3AHkSL1vOBYIvCJwNrNHQ/Ob7Sul7yiHEg5BpP3fBOvQT1yK6wvjiqyAJ83tEoNioFOqExi35zDiBBF/QUujeAGhKt2lmJt/lVepJRwrrSRoKa+oZntxAUQbYUFkt+VWKNJcb2sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723008924; c=relaxed/simple;
	bh=rzAsuGV8lY/bEkb8u9mQCi2WB1Q/WKZOUueV9yin3xs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jZbPAAhmU3Rz0NZcKkBu9rcXnzfw4H4c+9Gn5h1HJG0Neu/4UksKPVIuNE2yO47ng5ueHpkHs9pKFcE9skI5A3ryW5FoKmBTUUkwOr9ITMEdHaknEFU2G7JKFAaYDjTSENBgkYl+Zf4hM9fYMcI8hucsvAIkZtqenK0hFtkvpYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cRM1kE0u; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cRM1kE0u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723008921; x=1754544921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rzAsuGV8lY/bEkb8u9mQCi2WB1Q/WKZOUueV9yin3xs=;
  b=cRM1kE0ug9JN+yvQ0urT3jiNgBYRMSLrXCDGZ4Lph+AzDOfVERdouy+B
   hHMF9QMaGkpr6MkNn62s+CQS0sbwfPttCYZ28lcRXz92yZ+aDqyOD0bfH
   hZXPZCXnOc8CxMBpUadpIsXP22P9UjPrh6jxil1lUtZrtAxctkouWWRPW
   qzaIPCnjKQ4SWQ1M44hVeTC39T/9bBQGvb4iI9hyFeE+aDL6w6yWiob2o
   S0B1Y22XVn6kHbGL6Tf9fChBq3rsQeLeFLATqPHH40EtzC9p2CVjNVr6D
   wF8GoLmgRGa6fqeyIfS8X8Kl+Z+pzxXzGn4J+vM1GHUk7xVOJuF0HU/5w
   A==;
X-CSE-ConnectionGUID: 742JTvAqR22/Yz+zc4ROBQ==
X-CSE-MsgGUID: jws2kZM7SrOGpHuxdXI95A==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="46462112"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="46462112"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 22:35:21 -0700
X-CSE-ConnectionGUID: VKrFx+IlR/G46bnPACVkEw==
X-CSE-MsgGUID: HnfidGiGQsiF4oGeRHVUlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="60852010"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 06 Aug 2024 22:35:19 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbZKP-00059g-1f;
	Wed, 07 Aug 2024 05:35:17 +0000
Date: Wed, 7 Aug 2024 13:34:37 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:pfncache-2 27/27]
 arch/riscv/kvm/../../../virt/kvm/kvm_main.c:778:51: error: expected ')'
Message-ID: <202408071326.3gSjcCvj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux pfncache-2
head:   137c4fcbf73fb8797363cbb89e63f31504443ddc
commit: 137c4fcbf73fb8797363cbb89e63f31504443ddc [27/27] KVM: pfncache: Protect against GPC becoming active while invalidation is active
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240807/202408071326.3gSjcCvj-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408071326.3gSjcCvj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408071326.3gSjcCvj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kvm/../../../virt/kvm/kvm_main.c:15:
   In file included from include/linux/kvm_host.h:7:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:23:
   In file included from arch/riscv/include/asm/irq.h:10:
   In file included from include/linux/interrupt.h:22:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:778:51: error: expected ')'
     778 |         if (likely(kvm->mn_active_invalidate_count == 1) {
         |                                                          ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:778:5: note: to match this '('
     778 |         if (likely(kvm->mn_active_invalidate_count == 1) {
         |            ^
   1 warning and 1 error generated.


vim +778 arch/riscv/kvm/../../../virt/kvm/kvm_main.c

   752	
   753	static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
   754						const struct mmu_notifier_range *range)
   755	{
   756		struct kvm *kvm = mmu_notifier_to_kvm(mn);
   757		const struct kvm_mmu_notifier_range hva_range = {
   758			.start		= range->start,
   759			.end		= range->end,
   760			.handler	= kvm_mmu_unmap_gfn_range,
   761			.on_lock	= kvm_mmu_invalidate_begin,
   762			.flush_on_ret	= true,
   763			.may_block	= mmu_notifier_range_blockable(range),
   764		};
   765	
   766		trace_kvm_unmap_hva_range(range->start, range->end);
   767	
   768		/*
   769		 * Prevent memslot modification between range_start() and range_end()
   770		 * so that conditionally locking provides the same result in both
   771		 * functions.  Without that guarantee, the mmu_invalidate_in_progress
   772		 * adjustments will be imbalanced.
   773		 *
   774		 * Pairs with the decrement in range_end().
   775		 */
   776		spin_lock(&kvm->mn_invalidate_lock);
   777		kvm->mn_active_invalidate_count++;
 > 778		if (likely(kvm->mn_active_invalidate_count == 1) {
   779			kvm->mmu_gpc_invalidate_range_start = range->start;
   780			kvm->mmu_gpc_invalidate_range_end = range->end;
   781		} else {
   782			/*
   783			 * Fully tracking multiple concurrent ranges has diminishing
   784			 * returns. Keep things simple and just find the minimal range
   785			 * which includes the current and new ranges. As there won't be
   786			 * enough information to subtract a range after its invalidate
   787			 * completes, any ranges invalidated concurrently will
   788			 * accumulate and persist until all outstanding invalidates
   789			 * complete.
   790			 */
   791			kvm->mmu_gpc_invalidate_range_start =
   792				min(kvm->mmu_gpc_invalidate_range_start, range->start);
   793			kvm->mmu_gpc_invalidate_range_end =
   794				max(kvm->mmu_gpc_invalidate_range_end, range->end);
   795		}
   796		spin_unlock(&kvm->mn_invalidate_lock);
   797	
   798		/*
   799		 * If one or more memslots were found and thus zapped, notify arch code
   800		 * that guest memory has been reclaimed.  This needs to be done *after*
   801		 * dropping mmu_lock, as x86's reclaim path is slooooow.
   802		 */
   803		if (__kvm_handle_hva_range(kvm, &hva_range).found_memslot)
   804			kvm_arch_guest_memory_reclaimed(kvm);
   805	
   806		return 0;
   807	}
   808	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
