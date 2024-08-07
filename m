Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF90144D29;
	Wed,  7 Aug 2024 07:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723016278; cv=none; b=RlzAzIUHZeeNJwp4qJnfG+vb1hdpROMlN0ScVmRUS8q01jaoQBfOIliCqx7UaQ6TOuvoMXFsjqCPYKwPkonU1ZzQ+KLLzufTPDZ+gzAz5dyNOOrtlPNmQSRTaXD75UgEMSn2AhXkU4ok7EIMdNI+Y4Itfsk8KjOr0EKNyfx5wT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723016278; c=relaxed/simple;
	bh=EZ777pVRETbbSscsu0Pck2kieW2om42eY7YHGyrVbew=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oNpCe2atgQ7PCKLNF4pJkUsn03uRgzZF9MQFRCZ1MiQV+A/i1mPjCRHen+r18j8p/3GE5UtErIdcFFumX4KUuKl+3LrfXwo5AbiCeqr4QrQN5GC2clEf780CCVPdOkir5L8vmvWVU++sNVg6iv0GOFqRpjBNPWF3MhJyUTCds4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O+mAjYTW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+mAjYTW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723016277; x=1754552277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EZ777pVRETbbSscsu0Pck2kieW2om42eY7YHGyrVbew=;
  b=O+mAjYTWI4RWSHpnjXW075AvOfaAzflpX9PeI1G8/JDjzLo2JtZyU0iG
   NYJB/F4HV4c5M2gnBvGMlFjRIGAn1z9e2RXwepWtIqnR8H6qJy4fps86W
   53sVzgGduvm/3BpOsu73bQn9w49mGjsNVRfk2YvXK8KnyIJvbiVA0F+z0
   D66MICp+sQA3OIelX8sxElyNpLfYpGKMyaUJ2sQsO0HlqnCUmH3L+B+NS
   WoegOjxtvDFI1amoyumVMBDaeq839VeuMcL7lepj62PTykodV4LdiefyZ
   gNqcePx3ZdDQenO0l0dogYIh6z6c6bMxlEeQ7dZoAtc/GYF+xI0zoJV/s
   g==;
X-CSE-ConnectionGUID: IpeRwirgQfKFZ+dPThl3rQ==
X-CSE-MsgGUID: 4HqjxpHJQN+HQgiuCJxrGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="24949348"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="24949348"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 00:37:56 -0700
X-CSE-ConnectionGUID: lkfnWvb2TQGqg+2Kvxsc/g==
X-CSE-MsgGUID: gSYcUW9PTq6zv5kDwSLkfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="61588880"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 07 Aug 2024 00:37:54 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbbF2-0005DQ-0k;
	Wed, 07 Aug 2024 07:37:52 +0000
Date: Wed, 7 Aug 2024 15:37:27 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:pfncache-2 27/27]
 arch/x86/kvm/../../../virt/kvm/kvm_main.c:778:51: error: expected ')'
Message-ID: <202408071531.vysfKwdN-lkp@intel.com>
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
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240807/202408071531.vysfKwdN-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408071531.vysfKwdN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408071531.vysfKwdN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/kvm_main.c:778:51: error: expected ')'
     778 |         if (likely(kvm->mn_active_invalidate_count == 1) {
         |                                                          ^
   arch/x86/kvm/../../../virt/kvm/kvm_main.c:778:5: note: to match this '('
     778 |         if (likely(kvm->mn_active_invalidate_count == 1) {
         |            ^
   1 error generated.


vim +778 arch/x86/kvm/../../../virt/kvm/kvm_main.c

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
