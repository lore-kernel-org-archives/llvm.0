Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A8F2165EA;
	Sat, 20 Dec 2025 15:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766244200; cv=none; b=qheNUgVyqfvsZQFGp6+YzKVWkozHyp3IJz3lC3/MjcmmqH1/K7kbPZJNZYzV92qpekbYTTfkfc5gcO4z48l4boRPEy1dG8nd5SksUOmCjDiwnRDqoazw/MbKv7kU31gO6fPmJXFl/r/8FUEguM9EPHA/crSCJv3WW1I9nW+NjGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766244200; c=relaxed/simple;
	bh=9qhnXS9xsI2Lo4xdyS5pDwfOiv+UWPCUjGv+CcPPerU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aD/rmU2I2gpgYaUlUW2Ri3x+slPQ3ug41eKsL8lxOyd4w0ax4j5010neP6Z4fUyXq1pbtg3oSNEP6aCds3mDJNu4+2DRtD0h2cdHdj/cA6az6KogJB9tb+G7V0lZWy2zDmD8/C4D6bjyvPrbYy9yuFC6GXk4tuGXWLO60tfXmiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=efZysvyu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="efZysvyu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766244199; x=1797780199;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9qhnXS9xsI2Lo4xdyS5pDwfOiv+UWPCUjGv+CcPPerU=;
  b=efZysvyu15b3G1PM0XCa3//Y1fykEQi0q5gNjTc2QlnkSSIoZ4N0Dm47
   fhOlxe/KDlfo1m+kXgy7a4c7+anQmixRONhKv3YavuIiUA7hqa9BlkMvF
   d8XZbvRtJK83djgdy2db5Go8upF/9gwyd3Bc6gYlZoT8mV+BoBJOLqREe
   l3n04yeh/52KTfd3HJITi9TnvRW+6PodkFYfJaNZjwFfXf8EoSO21ttc3
   l5xu/3WDJFn+00RYWWWySzRnXHFm3AfMj+h7NSV9cXNknbwp5JPB9dTVt
   D13QVhtYhrgiVQx2G/4KjW1wy/NThkZH0el9WfK+3PlVv6fGaqkx+Duht
   Q==;
X-CSE-ConnectionGUID: Urz+KhesQRatDlBDjeW3bA==
X-CSE-MsgGUID: 49CbxDdBTEy3z6bwvfnU+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="68153775"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68153775"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:23:16 -0800
X-CSE-ConnectionGUID: p7CpL5mQR0GXEdGy5+JnSw==
X-CSE-MsgGUID: pOd5rr+yT3yshp/kDtBTuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="204053786"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Dec 2025 07:23:15 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWynZ-000000004k1-0ZOO;
	Sat, 20 Dec 2025 15:23:13 +0000
Date: Sat, 20 Dec 2025 23:22:33 +0800
From: kernel test robot <lkp@intel.com>
To: hungkien05 <nguyenhunghnuekt@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:pr/24 1/1] arch/x86/kvm/emulate.c:1759:4: error:
 expected expression
Message-ID: <202512202349.UyMH6sV9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa pr/24
head:   dcd699a99ce2f40e50263e0ec438e3b57b133598
commit: dcd699a99ce2f40e50263e0ec438e3b57b133598 [1/1] Fix potential vulnerability in cloned code (arch/x86/kvm/emulate.c)
config: x86_64-buildonly-randconfig-002-20251217 (https://download.01.org/0day-ci/archive/20251220/202512202349.UyMH6sV9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202349.UyMH6sV9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202349.UyMH6sV9-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/emulate.c:1741:2: warning: '/*' within block comment [-Wcomment]
    1741 |         /*
         |         ^
>> arch/x86/kvm/emulate.c:1759:4: error: expected expression
    1759 |          */
         |           ^
   arch/x86/kvm/emulate.c:1760:2: error: expected expression
    1760 |         if (seg == VCPU_SREG_SS && selector == 3 &&
         |         ^
   1 warning and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [y]:
   - MFD_SPACEMIT_P1 [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]


vim +1759 arch/x86/kvm/emulate.c

  1733	
  1734	static int load_segment_descriptor(struct x86_emulate_ctxt *ctxt,
  1735					   u16 selector, int seg)
  1736	{
  1737		u8 cpl = ctxt->ops->cpl(ctxt);
  1738	
  1739	
  1740		/*
  1741		/*
  1742		 * None of MOV, POP and LSS can load a NULL selector in CPL=3, but
  1743		 * None of MOV, POP and LSS can load a NULL selector in CPL=3, but
  1744		 * they can load it at CPL<3 (Intel's manual says only LSS can,
  1745		 * they can load it at CPL<3 (Intel's manual says only LSS can,
  1746		 * but it's wrong).
  1747		 * but it's wrong).
  1748		 *
  1749		 *
  1750		 * However, the Intel manual says that putting IST=1/DPL=3 in
  1751		 * However, the Intel manual says that putting IST=1/DPL=3 in
  1752		 * an interrupt gate will result in SS=3 (the AMD manual instead
  1753		 * an interrupt gate will result in SS=3 (the AMD manual instead
  1754		 * says it doesn't), so allow SS=3 in __load_segment_descriptor
  1755		 * says it doesn't), so allow SS=3 in __load_segment_descriptor
  1756		 * and only forbid it here.
  1757		 * and only forbid it here.
  1758		 */
> 1759		 */
  1760		if (seg == VCPU_SREG_SS && selector == 3 &&
  1761		if (seg == VCPU_SREG_SS && selector == 3 &&
  1762		    ctxt->mode == X86EMUL_MODE_PROT64)
  1763		    ctxt->mode == X86EMUL_MODE_PROT64)
  1764			return emulate_exception(ctxt, GP_VECTOR, 0, true);
  1765			return emulate_exception(ctxt, GP_VECTOR, 0, true);
  1766	
  1767	
  1768		return __load_segment_descriptor(ctxt, selector, seg, cpl,
  1769						 X86_TRANSFER_NONE, NULL);
  1770	}
  1771	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
