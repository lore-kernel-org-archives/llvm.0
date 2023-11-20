Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7D811724;
	Mon, 20 Nov 2023 09:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dUDS/9x/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700473599; x=1732009599;
  h=date:from:cc:subject:message-id:mime-version;
  bh=1xRCku91EOZ8WBdKTkJ2zbh8uHYsTT0IoG+CmcSCIyk=;
  b=dUDS/9x/r7bA+VyByPUVx0H5U3rW93nniTy/H14oBG21EcSgqqixbGLT
   /DMP7GStO48IOwhHXvAcAPGxUOE83TuLlJuOBbgILatM5O8LuzC+VRBo3
   Zh2MAXJSOhfvqwWvhYL2CAnmYCLKCEk9l26G2L9LLCaxe2i7aU5qMA4eg
   CbAk+S4m2CoXSIAudlGwTNTomGS5CqMMDbrh5FfsjjEjXALdSDsJIJCt8
   H4dS2idQPJpJdLE8XxRFeXI9oE+mZG73ZUAsUIQ8KHrYuykmh/wv+FJq4
   aPUWmkG+9cgRmgTZ3JoRMj+YVNLdzPaAIQhALHkvAfBX98DyatXgHr7Yt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="391372548"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="391372548"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 01:46:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="889871574"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="889871574"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 20 Nov 2023 01:46:37 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r50rT-0006ID-1k;
	Mon, 20 Nov 2023 09:46:35 +0000
Date: Mon, 20 Nov 2023 17:46:26 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 2/28] error: unknown target CPU 'armv6k'
Message-ID: <202311201739.Q9P9vuTE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   ab55b0201c034bcbe3e189f9f963209900f601ad
commit: 30da9e9663c3ad68d1fb79a1f8a162dc7f4a2392 [2/28] CHROMIUM: iwl7000: Disables debug asserts in FW
config: arm-randconfig-003-20231120 (https://download.01.org/0day-ci/archive/20231120/202311201739.Q9P9vuTE-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311201739.Q9P9vuTE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311201739.Q9P9vuTE-lkp@intel.com/

All errors (new ones prefixed by >>):

   clang-16: warning: argument unused during compilation: '-mabi=aapcs-linux' [-Wunused-command-line-argument]
   clang-16: warning: argument unused during compilation: '-mfpu=vfp' [-Wunused-command-line-argument]
>> error: unknown target CPU 'armv6k'
   note: valid target CPU values are: nocona, core2, penryn, bonnell, atom, silvermont, slm, goldmont, goldmont-plus, tremont, nehalem, corei7, westmere, sandybridge, corei7-avx, ivybridge, core-avx-i, haswell, core-avx2, broadwell, skylake, skylake-avx512, skx, cascadelake, cooperlake, cannonlake, icelake-client, rocketlake, icelake-server, tigerlake, sapphirerapids, alderlake, raptorlake, meteorlake, sierraforest, grandridge, graniterapids, emeraldrapids, knl, knm, k8, athlon64, athlon-fx, opteron, k8-sse3, athlon64-sse3, opteron-sse3, amdfam10, barcelona, btver1, btver2, bdver1, bdver2, bdver3, bdver4, znver1, znver2, znver3, znver4, x86-64, x86-64-v2, x86-64-v3, x86-64-v4
   clang-16: warning: argument unused during compilation: '-mabi=aapcs-linux' [-Wunused-command-line-argument]
   clang-16: warning: argument unused during compilation: '-mfpu=vfp' [-Wunused-command-line-argument]
   make[2]: *** [scripts/Makefile.build:286: scripts/mod/empty.o] Error 1 shuffle=2143272848
>> error: unknown target CPU 'armv6k'
   note: valid target CPU values are: nocona, core2, penryn, bonnell, atom, silvermont, slm, goldmont, goldmont-plus, tremont, nehalem, corei7, westmere, sandybridge, corei7-avx, ivybridge, core-avx-i, haswell, core-avx2, broadwell, skylake, skylake-avx512, skx, cascadelake, cooperlake, cannonlake, icelake-client, rocketlake, icelake-server, tigerlake, sapphirerapids, alderlake, raptorlake, meteorlake, sierraforest, grandridge, graniterapids, emeraldrapids, knl, knm, k8, athlon64, athlon-fx, opteron, k8-sse3, athlon64-sse3, opteron-sse3, amdfam10, barcelona, btver1, btver2, bdver1, bdver2, bdver3, bdver4, znver1, znver2, znver3, znver4, x86-64, x86-64-v2, x86-64-v3, x86-64-v4
   make[2]: *** [scripts/Makefile.build:117: scripts/mod/devicetable-offsets.s] Error 1 shuffle=2143272848
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1247: prepare0] Error 2 shuffle=2143272848
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:192: __sub-make] Error 2 shuffle=2143272848
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
