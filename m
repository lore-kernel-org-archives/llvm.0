Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5446A036;
	Tue,  5 Dec 2023 18:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bY7CcHdh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701801619; x=1733337619;
  h=date:from:cc:subject:message-id:mime-version;
  bh=vY4oALLM7TY6ZzmRXxweQ734ZN3r59LS0ixvJFnRkHA=;
  b=bY7CcHdh61vFc/hi5bNQ1Cowc87bCGJP5svcZBLKT8pXcWmTkCH2FB//
   hO+6441p0QjYjru/X9DPaHXObuOU12XMU5AdJ57y+DGJ1wmp7cds3zef1
   FQADURFpVbR4joXR7wlEAUvLk3ufyo3lT/1J4pbe56jtO/FwYPmtwRRRi
   haLaHFGrRK8SjpMDe7joCl1m1MGQdfxzRxI6XgFPMm/7G8TrhNQFDsFx4
   39Q5xHjJpqSs7m6RhYcMSKXmk6JnJ05yhOoKcRfFVkleqYepTQdXpRQqT
   hY70Wou9uUu8hJvaviK2AyvIKlocLvfXWgoPFiJrtgiw/refMido0cfvO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="397835080"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="397835080"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 10:40:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="12429992"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 05 Dec 2023 10:40:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAaL5-0009Ys-1q;
	Tue, 05 Dec 2023 18:40:11 +0000
Date: Wed, 6 Dec 2023 02:39:45 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [peterz-queue:x86/kvm 3/11] net/mac80211/mac80211.o: warning:
 objtool: __SCT__tp_func_drv_return_void+0x0: retpoline_safe hint not an
 indirect jump/call/ret/nop
Message-ID: <202312060228.RHJs2gLq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/kvm
head:   bd8e1c4c02ac085925674bddccb989e2d7d6cc2d
commit: b7a510b43b1833fc6b0543c0295970c1dd87fbde [3/11] objtool: Convert ANNOTATE_RETPOLINE_SAFE to ANNOTATE
config: x86_64-randconfig-003-20231203 (https://download.01.org/0day-ci/archive/20231206/202312060228.RHJs2gLq-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060228.RHJs2gLq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060228.RHJs2gLq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/mac80211/mac80211.o: warning: objtool: __SCT__tp_func_drv_return_void+0x0: retpoline_safe hint not an indirect jump/call/ret/nop
--
>> drivers/cxl/core/cxl_core.o: warning: objtool: __SCT__tp_func_cxl_aer_uncorrectable_error+0x0: retpoline_safe hint not an indirect jump/call/ret/nop


objdump-func vmlinux.o __SCT__tp_func_drv_return_void:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
