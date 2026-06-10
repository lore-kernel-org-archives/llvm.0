Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6436A165F1A;
	Wed, 10 Jun 2026 18:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781115582; cv=none; b=Bdrka/NIARgZhped+UHx4f1r8+wzzLarRt1xrAObAoR4FdulLRBzZY0SV1m7+QkKpAznXZ3oIgoUTHIpxXm/VI7bZD5oGhcUJWBRXRvBvCEj4Qmw8ltofEd/OXNZFXLW1pQBskEIDIC29om1ihe89uajYWBO8GKcDkqcGh2gTcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781115582; c=relaxed/simple;
	bh=oRsdZJUZi4JQaJu7SaghdTzN50J/LJsgGhcFiw/SrD0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ITUarfap7zDaWNuFF4o2cRmFOrKep9VdmVOxEfs98aq8R+AgxZVePIldjB8SIMhv0WyQtX9z+wVHD8S0RhQN8FctPMB5LG635EJSMTOqON26Ma5C7dehbwHt47b9IuS5P1dEBM1k0LYV4AiQc/nejVO6DgfHRoe0yD1pKVYJQb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MtYLhNQL; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MtYLhNQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781115581; x=1812651581;
  h=date:from:to:cc:subject:message-id;
  bh=oRsdZJUZi4JQaJu7SaghdTzN50J/LJsgGhcFiw/SrD0=;
  b=MtYLhNQL/8BWQqfbBNBBy25Jf/jbtTXcto6DhE8m4EpFlGMTX0vFFIOI
   ZNCtW2tO5Z8MRLfwcH5gkiZopAAjDgmlS0UacME3xNrrL51ojzztsa9pk
   vskewhx95vY01ARls35mltVVW0ec4Dtvnxt2QaVYhIpUBa3A8pNOwZTYJ
   cMK9cB+RAdzK7YF7XfOeckbUZxFBo9jESIPYQARIaaNCiT/GjzGsz2bI2
   Qdk+lY8E6sTT+UkVqKG5MfVKExa4Zy76SM4jzlW1gEqOSlxzd5/E4baH8
   8QQbKcr9poeBsMfFoIk3qPtKRg7tEt5e/ZPSddC9MSjLLQnfACsUiQYTz
   g==;
X-CSE-ConnectionGUID: mybTfvEgQxq6bvBVuHAJ2w==
X-CSE-MsgGUID: UYlr2AO8Q0SlhMMxaUdKJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81824570"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81824570"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 11:19:41 -0700
X-CSE-ConnectionGUID: c0qbraPHTdStr3dt2m5C+Q==
X-CSE-MsgGUID: hFRlBGCyS32ibHNnVZljYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="284327215"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 10 Jun 2026 11:19:40 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXNWb-000000003nx-2Hge;
	Wed, 10 Jun 2026 18:19:37 +0000
Date: Wed, 10 Jun 2026 20:18:45 +0200
From: kernel test robot <lkp@intel.com>
To: fujunjie <fujunjie1@qq.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: mm/swap_state.c:506 function parameter
 'defer_memcg1_swapin' not described in '__swap_cache_alloc_folio'
Message-ID: <202606102044.TtSqOxFU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/fujunjie/mm-zswap-expose-range-state-for-swapin-policy/20260529-204559
head:   bddcd2deba2dc9a59f2a4b47da13d52d40c46be9
commit: c33b23766e3a4235d1426c78211e784827786a22 mm: admit large swapin by backend range in swapin_sync()
date:   12 days ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260610/202606102044.TtSqOxFU-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606102044.TtSqOxFU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606102044.TtSqOxFU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/swap_state.c:506 function parameter 'defer_memcg1_swapin' not described in '__swap_cache_alloc_folio'
>> Warning: mm/swap_state.c:506 expecting prototype for swap_cache_alloc_folio(). Prototype was for __swap_cache_alloc_folio() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
