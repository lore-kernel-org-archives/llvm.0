Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EC516F288;
	Tue, 19 Aug 2025 00:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755562822; cv=none; b=qswk3DFv2+4I0mytBIt0WOngmr6bcODlmb++K8+ViQRLO6BGkfaux+VT8DIAZeBx+qaoOMAtUdqTV7CEzcdIrymLXLkuElmpetTJ4cZ4tOc3ozXD8KZAzAZfD9QBQh+IdmJXTI4SQDRm/61FvXqJYSXsN3FOeN1zsIP52pufzvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755562822; c=relaxed/simple;
	bh=ivFB6xCRP7w7c8C1tgbnpbn/7dr2evVjU3peJaEDmdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i5aAtSt21FLML7gcsuFzZhXr9nUSGnjFUoNx8mKUqGT1GHffSCJ5o6RBhl8ofhfAilA4pF2i8RGfjdOkM6Hx8M1E89fOAtliD8nXjFc0X4ayUT2W35NPe9A09dXdNsdL9gyj55aY+lb4X0nmHG3l0qN5Y5vD3JZwCzU7i69okOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WUVCsTLT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WUVCsTLT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755562821; x=1787098821;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ivFB6xCRP7w7c8C1tgbnpbn/7dr2evVjU3peJaEDmdY=;
  b=WUVCsTLTkmpVFEqnH2kupxrBmq2pJN2DJaN6YZo51wOBM31TbkSoDykp
   68FHUDDCNvaW1ksLYgkTd8/BvR3PorYOQuJPpbZ4Np+gR3Z0qtpNA5WI+
   uYJ0OWgN/uxislbGZ3ttZSYZ0JUnAZcV/X35CEJj7oc7M9ZhJUceaK/U2
   RsYF0yZAlynfu98fGsGDoZKsvtM3YtOizH/qb5g4aDp5l+EgIUA4WFTUe
   kGCVzciw4OZYO0l11k2U9UGb3sK19uFfKS7ZhPbxYplQtruWyDSSCzNSc
   hU7uza+iqAlAZx19mlgTkVqgJhRIwyqkugu2rAQGp1x/6YsHuHvzw7Whd
   A==;
X-CSE-ConnectionGUID: Je/ZWcdeRgGrtRkDfBJNhw==
X-CSE-MsgGUID: ZoEMIUcVS6a0JTscfptnkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="56824313"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="56824313"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 17:20:20 -0700
X-CSE-ConnectionGUID: D8ZbpIKlQrqW84n5qYqApA==
X-CSE-MsgGUID: pq9rbNHlSGylhfHBy9GNuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="171926660"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 Aug 2025 17:20:18 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoA4s-000GKf-03;
	Tue, 19 Aug 2025 00:19:56 +0000
Date: Tue, 19 Aug 2025 08:18:23 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Dafna Hirschfeld <dafna.hirschfeld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v5 7/8] drm/xe/userptr: replace xe_hmm with gpusvm
Message-ID: <202508190722.CIuroUt0-lkp@intel.com>
References: <20250818152152.67815-17-matthew.auld@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818152152.67815-17-matthew.auld@intel.com>

Hi Matthew,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on next-20250818]
[cannot apply to drm-exynos/exynos-drm-next linus/master v6.17-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Auld/drm-gpusvm-fix-hmm_pfn_to_map_order-usage/20250818-232336
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250818152152.67815-17-matthew.auld%40intel.com
patch subject: [PATCH v5 7/8] drm/xe/userptr: replace xe_hmm with gpusvm
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250819/202508190722.CIuroUt0-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508190722.CIuroUt0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508190722.CIuroUt0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_userptr.c:177:24: error: no member named 'notifier_seq' in 'struct xe_userptr'
     177 |                                      uvma->userptr.notifier_seq))
         |                                      ~~~~~~~~~~~~~ ^
   drivers/gpu/drm/xe/xe_userptr.c:178:17: error: no member named 'notifier_seq' in 'struct xe_userptr'
     178 |                 uvma->userptr.notifier_seq -= 2;
         |                 ~~~~~~~~~~~~~ ^
   2 errors generated.


vim +177 drivers/gpu/drm/xe/xe_userptr.c

0bab17b0664f42 Matthew Auld 2025-08-18  154  
0bab17b0664f42 Matthew Auld 2025-08-18  155  #if IS_ENABLED(CONFIG_DRM_XE_USERPTR_INVAL_INJECT)
0bab17b0664f42 Matthew Auld 2025-08-18  156  /**
0bab17b0664f42 Matthew Auld 2025-08-18  157   * xe_vma_userptr_force_invalidate() - force invalidate a userptr
0bab17b0664f42 Matthew Auld 2025-08-18  158   * @uvma: The userptr vma to invalidate
0bab17b0664f42 Matthew Auld 2025-08-18  159   *
0bab17b0664f42 Matthew Auld 2025-08-18  160   * Perform a forced userptr invalidation for testing purposes.
0bab17b0664f42 Matthew Auld 2025-08-18  161   */
0bab17b0664f42 Matthew Auld 2025-08-18  162  void xe_vma_userptr_force_invalidate(struct xe_userptr_vma *uvma)
0bab17b0664f42 Matthew Auld 2025-08-18  163  {
0bab17b0664f42 Matthew Auld 2025-08-18  164  	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
0bab17b0664f42 Matthew Auld 2025-08-18  165  
0bab17b0664f42 Matthew Auld 2025-08-18  166  	/* Protect against concurrent userptr pinning */
0bab17b0664f42 Matthew Auld 2025-08-18  167  	lockdep_assert_held(&vm->lock);
0bab17b0664f42 Matthew Auld 2025-08-18  168  	/* Protect against concurrent notifiers */
97df487309a7ce Matthew Auld 2025-08-18  169  	lockdep_assert_held(&vm->svm.gpusvm.notifier_lock);
0bab17b0664f42 Matthew Auld 2025-08-18  170  	/*
0bab17b0664f42 Matthew Auld 2025-08-18  171  	 * Protect against concurrent instances of this function and
0bab17b0664f42 Matthew Auld 2025-08-18  172  	 * the critical exec sections
0bab17b0664f42 Matthew Auld 2025-08-18  173  	 */
0bab17b0664f42 Matthew Auld 2025-08-18  174  	xe_vm_assert_held(vm);
0bab17b0664f42 Matthew Auld 2025-08-18  175  
0bab17b0664f42 Matthew Auld 2025-08-18  176  	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
0bab17b0664f42 Matthew Auld 2025-08-18 @177  				     uvma->userptr.notifier_seq))
0bab17b0664f42 Matthew Auld 2025-08-18  178  		uvma->userptr.notifier_seq -= 2;
0bab17b0664f42 Matthew Auld 2025-08-18  179  	__vma_userptr_invalidate(vm, uvma);
0bab17b0664f42 Matthew Auld 2025-08-18  180  }
0bab17b0664f42 Matthew Auld 2025-08-18  181  #endif
0bab17b0664f42 Matthew Auld 2025-08-18  182  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
