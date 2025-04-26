Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528D7A944;
	Sat, 26 Apr 2025 16:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745684304; cv=none; b=ISLLmYFMaXgp7ewV/CwkxfUsOawEAIRVGPMGeH/h3qjCeH868kXjt+ic213pBRMTf/K6T8h2ahH01fxhOhJT2tlIK4LXer4F3JBDhaTZa+fm4ZGrWzy1gcgiOHnpZwvs4mF0JMUTyaGvH1S6isO3tdSwo0A5lDcZjuXORs/GNMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745684304; c=relaxed/simple;
	bh=x7o/T1lb7X9o3ncEBPT76S4RfV75UxAnmAFiaJqWILc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ax/27WIyux0Ecx1eY3Tx0i+UGxlCe+9bGXZkkTMAZCk2l+Sb+8IVPXmjYn/oVNtSMoDZeC2IcOCpg7/tKusJ2MsEUn47PfkFYk+g6ARnvVPFWOx6HXe67xL96rxgyQ5ooQdzJTyCrGTdkmtHB0dIPb2/WciCgNmk97g5KAA3Qxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GEYLBXCh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GEYLBXCh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745684302; x=1777220302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x7o/T1lb7X9o3ncEBPT76S4RfV75UxAnmAFiaJqWILc=;
  b=GEYLBXCh8dgXN1N/AdBhi4b9mrCHp2kdccfone+eeaRNULGaPSWTz4k2
   xYIz4vBh7btBRZgqg38FtITuHOrWBoP/5rJ/0R8A7fzDdyl/CMIMUGayf
   uDRGfULLekx4ItLSV5R+q2axMkrrasqfzRYBJAlCOsMLI+1RH3L5valtD
   yWsHsLHHGe6LPj1X76MnVjS2ItOzewK7BVaBfe4jsre1DVIyYNIDSeA36
   J7+GjSyrVnw9IA1zxC8AIM51TqsW4EdleIN876XHd7GaSXULBWo/6tF0P
   KjdV4hrlNqteFFtkHx96bjVto7pUM/uqDP/pVrz7mK6VIwC2680N3RK/C
   Q==;
X-CSE-ConnectionGUID: rO44mtAMQKiOwVoa2ZTlfA==
X-CSE-MsgGUID: nVvynBkhSJifCxcO8uGGvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="47409486"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="47409486"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 09:18:19 -0700
X-CSE-ConnectionGUID: zTkJ63THQmGtFY+A0AJN1A==
X-CSE-MsgGUID: O1wcD4QsSfmg+anfQUM1HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="170358507"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 26 Apr 2025 09:18:18 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8iEJ-0005uj-2D;
	Sat, 26 Apr 2025 16:18:15 +0000
Date: Sun, 27 Apr 2025 00:17:57 +0800
From: kernel test robot <lkp@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Matt Roper <matthew.d.roper@intel.com>,
	Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: drivers/gpu/drm/xe/xe_guc_capture.c:218: warning: cannot understand
 function prototype: 'struct __guc_mmio_reg_descr_group *extlists; '
Message-ID: <202504270013.yxJGp0R1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: b170d696c1e2226713471d810c63b1162335079f drm/xe/guc: Add XE_LP steered register lists
date:   7 months ago
config: riscv-randconfig-002-20250426 (https://download.01.org/0day-ci/archive/20250427/202504270013.yxJGp0R1-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504270013.yxJGp0R1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504270013.yxJGp0R1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_guc_capture.c:218: warning: cannot understand function prototype: 'struct __guc_mmio_reg_descr_group *extlists; '


vim +218 drivers/gpu/drm/xe/xe_guc_capture.c

   211	
   212	struct xe_guc_state_capture {
   213		const struct __guc_mmio_reg_descr_group *reglists;
   214		/**
   215		 * NOTE: steered registers have multiple instances depending on the HW configuration
   216		 * (slices or dual-sub-slices) and thus depends on HW fuses discovered
   217		 */
 > 218		struct __guc_mmio_reg_descr_group *extlists;
   219		struct __guc_capture_ads_cache ads_cache[GUC_CAPTURE_LIST_INDEX_MAX]
   220							[GUC_STATE_CAPTURE_TYPE_MAX]
   221							[GUC_CAPTURE_LIST_CLASS_MAX];
   222		void *ads_null_cache;
   223	};
   224	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
