Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CDA139D;
	Sat,  2 Aug 2025 01:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754098454; cv=none; b=AV4OSv5RFu1u+SA7nDupVG68pckFGgSfGwgo1Oyk4sZEv0jjVlp0O4/9Ewl8phkkW4zpHT2YC9CUESYLxEAn2osAaTAn63pLm60ytZLJR6u1bRR8oFOKBGx4oDB7EJ1k42TgE2F1mdZSzmMYDDxS3WoU/11V3MzOA7/ZO9rW/wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754098454; c=relaxed/simple;
	bh=+X3C58KHyiNHPBMVwfuLLBkw23uUde+Nc+EsHqZ7PYo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dR6A50afxXxksaamZFBaJvHHwN1wdtvYgwo+ZiIEz2DV4ga+cO3UTguWqVj0mXg/vZrbunQgZAVdl11EinwaIKp2+OhK/DWZ+Z2P0MYK+n/UNjU8WVKsTjOUPf4Xk0k391qslTci4jlONrMqqrYx2wZJ5md5X7asdum7LKhT9TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NXG+FpM2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NXG+FpM2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754098453; x=1785634453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+X3C58KHyiNHPBMVwfuLLBkw23uUde+Nc+EsHqZ7PYo=;
  b=NXG+FpM25UwkfDsoGK6SoRriBRAIyhpqRVCnU/kQ4qpG3nY4lxlm5p5G
   MComN4UtHAnvpUb2s0JtEqwhoa7Stbsti5isIkVSW/rZyS//F9tmcJ8sB
   M1nfdEL6h5Qe12vVYsiy2g+hEte53ASjlj9PACTSw3sXjqOcH19QDUnTD
   Eit8cyceEccF0PGvAXQ8CzaRY++bGLKCh+vFcW9bp0zRW4s/LMfvLUdgK
   3Jl0BiDSpzCCuoXahBF/ltk45lZcIVtjefEKZJh01wTsT+mjtXMU3UGMF
   eaBBKCauXlUeOQswFh6nc3EsoQrJLimRRfUqqNq7tAYlohJWiMSqM/Ygg
   w==;
X-CSE-ConnectionGUID: 5fBbvq2iSHuGn0Knwq97EA==
X-CSE-MsgGUID: dFmligroSamD3Fcq1zA8rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="55652202"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="55652202"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 18:34:12 -0700
X-CSE-ConnectionGUID: F5ZMCbGbQCalSYPxIMClYQ==
X-CSE-MsgGUID: 4qi3TmgIQQuCIvVzV+7UeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="162970696"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Aug 2025 18:34:11 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ui18S-00054i-1z;
	Sat, 02 Aug 2025 01:34:08 +0000
Date: Sat, 2 Aug 2025 09:34:01 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mripard:drm/tidss/field-api 7/15]
 drivers/gpu/drm/tidss/tidss_dispc.c:614:26: warning: result of comparison of
 constant 18446744073709551615 with expression of type 'typeof
 (_Generic((mask), char: (unsigned char)0, unsigned char: (unsigned char)0,
 signed char: (unsigned char)0, unsigned s...
Message-ID: <202508020944.a0T65AYA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git drm/tidss/field-api
head:   8e7aa9647fd4168ea2115bb34ca99eade5b0c751
commit: af3d3b1b2cd4103936980b66dd34601e419ae74a [7/15] drm/tidss: dispc: Switch FLD_MOD to using a mask
config: arm-randconfig-003-20250802 (https://download.01.org/0day-ci/archive/20250802/202508020944.a0T65AYA-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508020944.a0T65AYA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508020944.a0T65AYA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/tidss/tidss_dispc.c:614:26: warning: result of comparison of constant 18446744073709551615 with expression of type 'typeof (_Generic((mask), char: (unsigned char)0, unsigned char: (unsigned char)0, signed char: (unsigned char)0, unsigned short: (unsigned short)0, short: (unsigned short)0, unsigned int: (unsigned int)0, int: (unsigned int)0, unsigned long: (unsigned long)0, long: (unsigned long)0, unsigned long long: (unsigned long long)0, long long: (unsigned long long)0, default: (mask)))' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     614 |         return (orig & ~mask) | FIELD_PREP(mask, val);
         |                                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:3: note: expanded from macro 'FIELD_PREP'
     115 |                 __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: ");    \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:72:53: note: expanded from macro '__BF_FIELD_CHECK'
      72 |                 BUILD_BUG_ON_MSG(__bf_cast_unsigned(_mask, _mask) >     \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
      73 |                                  __bf_cast_unsigned(_reg, ~0ull),       \
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      74 |                                  _pfx "type of reg too small for mask"); \
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/compiler_types.h:568:22: note: expanded from macro 'compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:556:23: note: expanded from macro '_compiletime_assert'
     556 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:548:9: note: expanded from macro '__compiletime_assert'
     548 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   1 warning generated.


vim +614 drivers/gpu/drm/tidss/tidss_dispc.c

   606	
   607	/*
   608	 * TRM gives bitfields as start:end, where start is the higher bit
   609	 * number. For example 7:0
   610	 */
   611	
   612	static u32 FLD_MOD(u32 orig, u32 val, u32 mask)
   613	{
 > 614		return (orig & ~mask) | FIELD_PREP(mask, val);
   615	}
   616	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
