Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9B331A7E;
	Sat, 16 Dec 2023 19:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YVuCUAps"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702754987; x=1734290987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gRLCqr4JUDG0VdzH2duGiRbdzMX6tt0CVsaC03rWDr8=;
  b=YVuCUAps3Z9QvRIbL6cx819yiUbsFtwnnOp24FZrrTS3jrGEnmu8DQ2k
   ou1/L2jKbf58HeNXWYvtUV/z3rPfF3YzOGSVQDPQq4CSauJS6ETlnklq5
   DaKBjvINahcflGgQ4/V+ktOFpgg3vDGXJtL2s73Phd5OeMw14JmfRnrpx
   RmF+S5yGlW4XAJbs5527eBRp3wcMye6HM9sSINUGDXZ+UXOQm7t4Sj995
   FsuNdaamDMROaBtDHzWOLeks1ig2WBvyF9YC6pMHvk7P6bi97R5WYYQH9
   8GV0hu6sp+KGTKykWMhCBjX7+ynyczyJFy3KDkg1ZdFnOG6qhN8ZDImm4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="2562057"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="2562057"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 11:29:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="751307214"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="751307214"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Dec 2023 11:29:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEaM2-00027I-2G;
	Sat, 16 Dec 2023 19:29:42 +0000
Date: Sun, 17 Dec 2023 03:28:47 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	intel-xe@lists.freedesktop.org,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [drm-xe:drm-xe-next 989/1016]
 drivers/gpu/drm/xe/xe_wait_user_fence.c:46:2: warning: variable 'passed' is
 used uninitialized whenever switch default is taken
Message-ID: <202312170357.KPSinwPs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   c54005fdd0347a17088e7ff78070a55bf9103bc4
commit: ad7d86415578e1a5deedb0ceed5c281f7367d66d [989/1016] drm/xe: Enable W=1 warnings by default
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231217/202312170357.KPSinwPs-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170357.KPSinwPs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170357.KPSinwPs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   warning: unknown warning option '-Wrestrict' [-Wunknown-warning-option]
   warning: unknown warning option '-Wpacked-not-aligned'; did you mean '-Wpacked-non-pod'? [-Wunknown-warning-option]
   warning: unknown warning option '-Wformat-overflow'; did you mean '-Wshift-overflow'? [-Wunknown-warning-option]
   warning: unknown warning option '-Wformat-truncation' [-Wunknown-warning-option]
   warning: unknown warning option '-Wstringop-overflow'; did you mean '-Wshift-overflow'? [-Wunknown-warning-option]
   warning: unknown warning option '-Wstringop-truncation'; did you mean '-Wstring-concatenation'? [-Wunknown-warning-option]
>> drivers/gpu/drm/xe/xe_wait_user_fence.c:46:2: warning: variable 'passed' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
           default:
           ^~~~~~~
   drivers/gpu/drm/xe/xe_wait_user_fence.c:50:9: note: uninitialized use occurs here
           return passed ? 0 : 1;
                  ^~~~~~
   drivers/gpu/drm/xe/xe_wait_user_fence.c:21:13: note: initialize the variable 'passed' to silence this warning
           bool passed;
                      ^
                       = 0
   7 warnings generated.


vim +/passed +46 drivers/gpu/drm/xe/xe_wait_user_fence.c

dd08ebf6c3525a Matthew Brost   2023-03-30  16  
dd08ebf6c3525a Matthew Brost   2023-03-30  17  static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
dd08ebf6c3525a Matthew Brost   2023-03-30  18  {
dd08ebf6c3525a Matthew Brost   2023-03-30  19  	u64 rvalue;
dd08ebf6c3525a Matthew Brost   2023-03-30  20  	int err;
dd08ebf6c3525a Matthew Brost   2023-03-30  21  	bool passed;
dd08ebf6c3525a Matthew Brost   2023-03-30  22  
dd08ebf6c3525a Matthew Brost   2023-03-30  23  	err = copy_from_user(&rvalue, u64_to_user_ptr(addr), sizeof(rvalue));
dd08ebf6c3525a Matthew Brost   2023-03-30  24  	if (err)
dd08ebf6c3525a Matthew Brost   2023-03-30  25  		return -EFAULT;
dd08ebf6c3525a Matthew Brost   2023-03-30  26  
dd08ebf6c3525a Matthew Brost   2023-03-30  27  	switch (op) {
76d52e37187b73 Rodrigo Vivi    2023-11-14  28  	case DRM_XE_UFENCE_WAIT_OP_EQ:
dd08ebf6c3525a Matthew Brost   2023-03-30  29  		passed = (rvalue & mask) == (value & mask);
dd08ebf6c3525a Matthew Brost   2023-03-30  30  		break;
76d52e37187b73 Rodrigo Vivi    2023-11-14  31  	case DRM_XE_UFENCE_WAIT_OP_NEQ:
dd08ebf6c3525a Matthew Brost   2023-03-30  32  		passed = (rvalue & mask) != (value & mask);
dd08ebf6c3525a Matthew Brost   2023-03-30  33  		break;
76d52e37187b73 Rodrigo Vivi    2023-11-14  34  	case DRM_XE_UFENCE_WAIT_OP_GT:
dd08ebf6c3525a Matthew Brost   2023-03-30  35  		passed = (rvalue & mask) > (value & mask);
dd08ebf6c3525a Matthew Brost   2023-03-30  36  		break;
76d52e37187b73 Rodrigo Vivi    2023-11-14  37  	case DRM_XE_UFENCE_WAIT_OP_GTE:
dd08ebf6c3525a Matthew Brost   2023-03-30  38  		passed = (rvalue & mask) >= (value & mask);
dd08ebf6c3525a Matthew Brost   2023-03-30  39  		break;
76d52e37187b73 Rodrigo Vivi    2023-11-14  40  	case DRM_XE_UFENCE_WAIT_OP_LT:
dd08ebf6c3525a Matthew Brost   2023-03-30  41  		passed = (rvalue & mask) < (value & mask);
dd08ebf6c3525a Matthew Brost   2023-03-30  42  		break;
76d52e37187b73 Rodrigo Vivi    2023-11-14  43  	case DRM_XE_UFENCE_WAIT_OP_LTE:
dd08ebf6c3525a Matthew Brost   2023-03-30  44  		passed = (rvalue & mask) <= (value & mask);
dd08ebf6c3525a Matthew Brost   2023-03-30  45  		break;
dd08ebf6c3525a Matthew Brost   2023-03-30 @46  	default:
5e0e3070659519 Francois Dugast 2023-07-27  47  		XE_WARN_ON("Not possible");
dd08ebf6c3525a Matthew Brost   2023-03-30  48  	}
dd08ebf6c3525a Matthew Brost   2023-03-30  49  
dd08ebf6c3525a Matthew Brost   2023-03-30  50  	return passed ? 0 : 1;
dd08ebf6c3525a Matthew Brost   2023-03-30  51  }
dd08ebf6c3525a Matthew Brost   2023-03-30  52  

:::::: The code at line 46 was first introduced by commit
:::::: dd08ebf6c3525a7ea2186e636df064ea47281987 drm/xe: Introduce a new DRM driver for Intel GPUs

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
