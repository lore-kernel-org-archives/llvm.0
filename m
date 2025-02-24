Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23911A5B82;
	Mon, 24 Feb 2025 21:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740431711; cv=none; b=SWQLJr10I//tWQ0MYfbHnMvrpvlz9rG+X1wNe7kX85ddp3VS2p5+znfIfQ+CEawr0kZ0B5eanHkeWlVYEy9r5Z+/QwHK/Uwmada8bV3n0bWssMT5n8LRyOM01+z0/wdmUkImcsoJIMkZtfmGyZTyeXj5Pnf9vj6NR9QY1135dzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740431711; c=relaxed/simple;
	bh=bXe1NbVXDUqX6gfPJp23NouXpLkyelH5uYMnNMB+OEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ep7qX6AaVNzQpLr55AFS0cJohhAPHwDG5JjdexslO7HlnXSQX5XY60PyRy/GjgYKJQSnQ3KRRrj5ycDhhaYDEkAKOwATeX2vvHul0+NHzqyk3+QWKSOu8bEtZDl/KKSNQGas8z3InHZMr/RuMhwgb8TheQHJLP5HeV0qktZslFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cn/vPi0k; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cn/vPi0k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740431710; x=1771967710;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bXe1NbVXDUqX6gfPJp23NouXpLkyelH5uYMnNMB+OEk=;
  b=cn/vPi0kjRPtNCC8ioepK0stLoBPRDoSnC/PFQWUt4RDUTECqFgQ3DzY
   eAdhiF2kjW94gn/9uKtIScUlsmNzZDAlmwcbuk6ws2hMYuvpXsigIMjlD
   JRAJUybDYVBrMPDcQE0DeZoMiIAkTziiiimGGSKo9hNb7x+SUVmdZvStK
   K8vIO8Kdg5uTdsercGngelag0vj1GuCFJOqCPRTcPQzJqQihKQsx5KCGc
   qmtQ2eqMz7MHZ664Aug46z3HJk9LrttZdUVcBaal8nTp64wIjTBwU8sL0
   MGT714EYf9ZSloxUTUZW+rZtD2SUbCIWdBHxYHm3Mvdg3pOVTFap9mNAa
   g==;
X-CSE-ConnectionGUID: xw3dLz6cRj2UqsNrJA4Ixg==
X-CSE-MsgGUID: OWqYf2mFSu+zmCTrshRbgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="51423968"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="51423968"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 13:15:09 -0800
X-CSE-ConnectionGUID: FQNkBpt0R4qGNSIbKeHZ/Q==
X-CSE-MsgGUID: 3/445uQTSHS4AdPsDnnRhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="121270536"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 24 Feb 2025 13:15:06 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmfn6-0009LH-2w;
	Mon, 24 Feb 2025 21:15:04 +0000
Date: Tue, 25 Feb 2025 05:14:41 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 5/6] drm/xe/pm: D3Cold target state
Message-ID: <202502250431.N9MpQ2rF-lkp@intel.com>
References: <20250224164849.3746751-6-anshuman.gupta@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224164849.3746751-6-anshuman.gupta@intel.com>

Hi Anshuman,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on next-20250224]
[cannot apply to rafael-pm/linux-next rafael-pm/bleeding-edge pci/next pci/for-linus linus/master v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anshuman-Gupta/PCI-ACPI-Implement-PCI-FW-_DSM-method/20250225-005537
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250224164849.3746751-6-anshuman.gupta%40intel.com
patch subject: [RFC 5/6] drm/xe/pm: D3Cold target state
config: riscv-randconfig-001-20250225 (https://download.01.org/0day-ci/archive/20250225/202502250431.N9MpQ2rF-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502250431.N9MpQ2rF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502250431.N9MpQ2rF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_pm.c:888:38: error: call to undeclared function 'xe_display_connected'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           else if (xe->d3cold.vrsr_capable && xe_display_connected(xe))
                                               ^
   drivers/gpu/drm/xe/xe_pm.c:888:38: note: did you mean 'xe_display_create'?
   drivers/gpu/drm/xe/display/xe_display.h:51:19: note: 'xe_display_create' declared here
   static inline int xe_display_create(struct xe_device *xe) { return 0; }
                     ^
   1 error generated.


vim +/xe_display_connected +888 drivers/gpu/drm/xe/xe_pm.c

   856	
   857	/**
   858	 * xe_pm_d3cold_allowed_toggle - Check conditions to toggle d3cold.allowed
   859	 * @xe: xe device instance
   860	 *
   861	 * To be called during runtime_pm idle callback.
   862	 * Check for all the D3Cold conditions ahead of runtime suspend.
   863	 */
   864	void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
   865	{
   866		struct ttm_resource_manager *man;
   867		u32 total_vram_used_mb = 0;
   868		u64 vram_used;
   869		int i;
   870	
   871		if (!xe->d3cold.capable) {
   872			xe->d3cold.allowed = XE_D3HOT;
   873			return;
   874		}
   875	
   876		for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
   877			man = ttm_manager_type(&xe->ttm, i);
   878			if (man) {
   879				vram_used = ttm_resource_manager_usage(man);
   880				total_vram_used_mb += DIV_ROUND_UP_ULL(vram_used, 1024 * 1024);
   881			}
   882		}
   883	
   884		mutex_lock(&xe->d3cold.lock);
   885	
   886		if (total_vram_used_mb < xe->d3cold.vram_threshold)
   887			xe->d3cold.allowed = XE_D3COLD_OFF;
 > 888		else if (xe->d3cold.vrsr_capable && xe_display_connected(xe))
   889			xe->d3cold.allowed = XE_D3COLD_VRSR;
   890		else
   891			xe->d3cold.allowed = XE_D3HOT;
   892	
   893		mutex_unlock(&xe->d3cold.lock);
   894	}
   895	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
