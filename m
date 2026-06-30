Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A071D7E5C;
	Tue, 30 Jun 2026 04:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782794107; cv=none; b=pheNFjoAztMS/pW3qEZSCae3lEbXCXt6AHBA0xKW6Et00I5BQmiEIbD+eiXTueyjFF33rIA2mmTs3zlN1bNJgbSqf5bba/6M70wVZkswmqnKgQcUihsKACZBZlRrL1bNG13t15GIByuJTdai2tLg5N5GgfQ4vXBGPh6Nj2fzpac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782794107; c=relaxed/simple;
	bh=FnwAR2RKJK93E2JSOU8hxRMjsgJoTGvUcL7VaMO70Bw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cSTYPeH/aPytkLThKrTcZ3cwjb0o3HfafbWsQNaLBdPkuKuyei7Ta01RLiEu7nxjsS41W3EKtxjWH1kgGjuQ5XhqpZJF0cWZ1drdsHJ32lSc2qEgAuemdVUT6F2ybKVoF7fvfiuA4C8NLouB7p0wenY5ojDxzp5SqbKw9+PRcKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WjLB5Cr3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjLB5Cr3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782794106; x=1814330106;
  h=date:from:to:cc:subject:message-id;
  bh=FnwAR2RKJK93E2JSOU8hxRMjsgJoTGvUcL7VaMO70Bw=;
  b=WjLB5Cr3CT2WLV5jc+jfugEid6EjSAOTl2ZOOt2rZpa6tmcnXKCKqmuK
   R3om17TYfqBfQjpbJwxeww5esW37EGQmQeYpEedg6q5y0bEznDeQfOigm
   a1Xvf+rRMPiTPmrTK90XLWSVfujiE2cz+rkPetLIQoFbNEF1rch6Kvx63
   jx4NvVdMECVZQAcDaBfoItC0jUjZ7SBHKiueZ6FG++1A8P6xM0dvXtbPg
   c3CexoNZKXsBKkJ6qB6GH0zG87XfgPGa9dEkeMz/SbiIqwOQ2kHqL4hOt
   tWD1+bZYCWyEX5U1qmJj5WPt3UgeO02wU7GBfqa9PHrYi8wbL0LAXNYUU
   Q==;
X-CSE-ConnectionGUID: Ni670SyhRaKoClIizC0Lyg==
X-CSE-MsgGUID: uluENUqFSwS56SnC3d3WtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="95006267"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="95006267"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 21:35:05 -0700
X-CSE-ConnectionGUID: +N90feB9Tk2lCQUIT3CoMg==
X-CSE-MsgGUID: qD6mzDnpRGW2j0JNS42BAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="251095684"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 29 Jun 2026 21:35:04 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weQBL-0000000080b-1w9W;
	Tue, 30 Jun 2026 04:35:01 +0000
Date: Tue, 30 Jun 2026 12:33:48 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:arm64-xs-decode 2/2] arch/arm64/mm/fault.c:80:5:
 warning: format specifies type 'unsigned long' but the argument has type
 'unsigned long long'
Message-ID: <202606301257.DIHcZVRB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-xs-decode
head:   400df87aee7b6f393e5d363d377cb5a613f8b37a
commit: 400df87aee7b6f393e5d363d377cb5a613f8b37a [2/2] arm64: mm: When logging data aborts only decode Xs when ISV=1
config: arm64-randconfig-001-20260630 (https://download.01.org/0day-ci/archive/20260630/202606301257.DIHcZVRB-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606301257.DIHcZVRB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606301257.DIHcZVRB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/mm/fault.c:80:5: warning: format specifies type 'unsigned long' but the argument has type 'unsigned long long' [-Wformat]
      79 |                 pr_alert("  Xs = %lu\n",
         |                                  ~~~
         |                                  %llu
      80 |                          (iss2 & ESR_ELx_Xs_MASK) >> ESR_ELx_Xs_SHIFT);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:534:35: note: expanded from macro 'pr_alert'
     534 |         printk(KERN_ALERT pr_fmt(fmt), ##__VA_ARGS__)
         |                                  ~~~     ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +80 arch/arm64/mm/fault.c

    63	
    64	static void data_abort_decode(unsigned long esr)
    65	{
    66		unsigned long iss2 = ESR_ELx_ISS2(esr);
    67	
    68		pr_alert("Data abort info:\n");
    69	
    70		if (esr & ESR_ELx_ISV) {
    71			pr_alert("  Access size = %u byte(s)\n",
    72				 1U << ((esr & ESR_ELx_SAS) >> ESR_ELx_SAS_SHIFT));
    73			pr_alert("  SSE = %lu, SRT = %lu\n",
    74				 (esr & ESR_ELx_SSE) >> ESR_ELx_SSE_SHIFT,
    75				 (esr & ESR_ELx_SRT_MASK) >> ESR_ELx_SRT_SHIFT);
    76			pr_alert("  SF = %lu, AR = %lu\n",
    77				 (esr & ESR_ELx_SF) >> ESR_ELx_SF_SHIFT,
    78				 (esr & ESR_ELx_AR) >> ESR_ELx_AR_SHIFT);
    79			pr_alert("  Xs = %lu\n",
  > 80				 (iss2 & ESR_ELx_Xs_MASK) >> ESR_ELx_Xs_SHIFT);
    81		} else {
    82			pr_alert("  ISV = 0, ISS = 0x%08lx, ISS2 = 0x%08lx\n",
    83				 esr & ESR_ELx_ISS_MASK, iss2);
    84		}
    85	
    86		pr_alert("  CM = %lu, WnR = %lu, TnD = %lu, TagAccess = %lu\n",
    87			 (esr & ESR_ELx_CM) >> ESR_ELx_CM_SHIFT,
    88			 (esr & ESR_ELx_WNR) >> ESR_ELx_WNR_SHIFT,
    89			 (iss2 & ESR_ELx_TnD) >> ESR_ELx_TnD_SHIFT,
    90			 (iss2 & ESR_ELx_TagAccess) >> ESR_ELx_TagAccess_SHIFT);
    91	
    92		pr_alert("  GCS = %ld, Overlay = %lu, DirtyBit = %lu\n",
    93			 (iss2 & ESR_ELx_GCS) >> ESR_ELx_GCS_SHIFT,
    94			 (iss2 & ESR_ELx_Overlay) >> ESR_ELx_Overlay_SHIFT,
    95			 (iss2 & ESR_ELx_DirtyBit) >> ESR_ELx_DirtyBit_SHIFT);
    96	}
    97	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
