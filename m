Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A96226B74D;
	Tue,  5 Aug 2025 23:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754437747; cv=none; b=Mh5YSOKItr7kGpvJe2RmHxJYcfohJd16YBw75qxgtW4nhWGZSCxei40kiCInHCnzJf5O8xh+ER6gNxKaqNQruOKbWdluugmw5La3Gr5F1Sod8M8t9KN2P00RQxpR8ADKhCOpLTbkpYzLqpPQ7pVS4nWptEN3Dql22ohqt4/6ZQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754437747; c=relaxed/simple;
	bh=lwyssZmmY676nKQIBP9SS4ekkc5yHFS+yDmTNRGWUYE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VWjcvR0Je7JTcRSb43Xfj/FlzMdlIOCle71z0LqhPizx/+tt2BaGu48/fPOD1yzswjXZN70GrdofaEN+9IgGf02qLcFHeFRkvZBXmkBfIWQJiKRphMsLgerHqklVrKOq+tOTg3DBdYyvgOJX94j2tICz3hKeD7ZDfXanl8ouXSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NuuQu1Rl; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NuuQu1Rl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754437745; x=1785973745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lwyssZmmY676nKQIBP9SS4ekkc5yHFS+yDmTNRGWUYE=;
  b=NuuQu1RliEwD1lC29xz/tfl6kZIZpznRJrYcLHI8h6P1ChqwjtZdwo+4
   jiCQ4u4UDfyv4E+AQ7sz+8+a1bh0WkOTv4VELuYnMuavYC7bslhkUvu2C
   bLhTC2TSkI02ST9MWY+uyxVf6H/qvAoiIHzZlA/mK3RZ+vdx/QBmKRHZr
   xQRdVuJOZd1fMarrGKlx5Fq10lZRA2D8K9Et93xCMWyz0ZXDDm4X10i40
   t2Z//sFUyHbgM47aekgKn3BywFRRnOsrV9BYzbO7IkjzB/i7EeWkUreuk
   5rfSsLE4mkA0KQZQ2fQcj16UAbgqnhNUXoB240BySArmlTtGQFOLkRVwM
   w==;
X-CSE-ConnectionGUID: 7dgaifnORXaKwf7jFeviKQ==
X-CSE-MsgGUID: 5sZhSb9eTHW2RYI2r3FF5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="60561146"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="60561146"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 16:49:04 -0700
X-CSE-ConnectionGUID: RDX70+LOSpyN82BuLOJ+1g==
X-CSE-MsgGUID: Le5tPkqYQ8CzEETZQokh4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="170002391"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 05 Aug 2025 16:49:03 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujROu-0000qI-2v;
	Tue, 05 Aug 2025 23:49:00 +0000
Date: Wed, 6 Aug 2025 07:48:55 +0800
From: kernel test robot <lkp@intel.com>
To: Nemesa Garg <nemesa.garg@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Suraj Kandpal <suraj.kandpal@intel.com>,
	Animesh Manna <animesh.manna@intel.com>
Subject: [drm-i915:drm-intel-next 1/1]
 drivers/gpu/drm/i915/display/skl_scaler.c:967:57: warning: variable 'id' is
 uninitialized when used here
Message-ID: <202508060745.fMhGlpLI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/i915/kernel drm-intel-next
head:   73309ed9d598d35576431c4691813e080980df68
commit: 73309ed9d598d35576431c4691813e080980df68 [1/1] drm/i915/display: WA_14011503117
config: loongarch-randconfig-002-20250806 (https://download.01.org/0day-ci/archive/20250806/202508060745.fMhGlpLI-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508060745.fMhGlpLI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508060745.fMhGlpLI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/skl_scaler.c:967:57: warning: variable 'id' is uninitialized when used here [-Wuninitialized]
     967 |         intel_de_write_fw(display, SKL_PS_ECC_STAT(crtc->pipe, id), 1);
         |                                                                ^~
   drivers/gpu/drm/i915/display/skl_scaler.c:962:8: note: initialize the variable 'id' to silence this warning
     962 |         int id;
         |               ^
         |                = 0
   1 warning generated.


vim +/id +967 drivers/gpu/drm/i915/display/skl_scaler.c

   955	
   956	void adl_scaler_ecc_unmask(const struct intel_crtc_state *crtc_state)
   957	{
   958		struct intel_display *display = to_intel_display(crtc_state);
   959		struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
   960		const struct intel_crtc_scaler_state *scaler_state =
   961			&crtc_state->scaler_state;
   962		int id;
   963	
   964		if (!scaler_state && scaler_state->scaler_id == -1)
   965			return;
   966	
 > 967		intel_de_write_fw(display, SKL_PS_ECC_STAT(crtc->pipe, id), 1);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
