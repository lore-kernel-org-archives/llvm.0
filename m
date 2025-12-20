Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488ED257843;
	Sat, 20 Dec 2025 14:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766239869; cv=none; b=PsHTmtpBb1gzmwv7pM7GpHNRUNcVVOycA1nHl4+F0CVLRzOqTxqzDUdYJT7I95T+S7N6en3tPjAW/1+i0cvndSugWv68f34YuzxP3YdMo1Ae57QepF/spKFaUDMDNZq64DTMKGrDzcQgYtQferxXJxpZuhcwvoqYcDiITML7eZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766239869; c=relaxed/simple;
	bh=tVCLGGKISwGz2fKv0BchnoYvOlaye4WMdrhR/MQ0sEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=spdxtLYEFNwvNTxbwiAvSOEFc/n468yREAJ/TtLPKHPTyX5bRHZUDEsRMN+bNSbV4n/hk0oeYPJJDYuvtAJxXbhDa5AYSVcbGS4fzVEMcRvOF/oQajxwGnZ5v4ngxxFNPX18q1/RpzrbZWei+TXDN7IRPyNJDRK8h5RghkVlX+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b7BeEfJA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b7BeEfJA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766239868; x=1797775868;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tVCLGGKISwGz2fKv0BchnoYvOlaye4WMdrhR/MQ0sEU=;
  b=b7BeEfJA4msh/DYHCTNmxBXdNNUay1D8J4q9Gf45uFhhf8R+cRVNfniz
   iCZBVUXXE5A7ypseXCq+H6wPoNj9Xi/7S4V15LJod33PrCBM0JVFgxW9n
   /7AKx7s4VJyLlr4nw5wxiju2o5PfOXCp1kBW3N9wTTAkoQr0xkbsfCG4W
   3x5pD4iH08ypKtO/6hDPdJNZChTUNHVEhD3hAHhjieG1Fh/WfnIhYzX6i
   BxwqQLiOGKmaLwZWHFiD6U+rRTxl5kJl7vsDFu/cWWbmh44QIwFAlGrpt
   q442BIBfbRO+XwRVZgiMgCPmyvzGi5EWs3Szex2aKgtxJsvy5CWi4S/+f
   A==;
X-CSE-ConnectionGUID: rP/2vZjaRLSb2tY1YhdNiQ==
X-CSE-MsgGUID: bBl9SO4TRn20KAGf9BgOzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78892301"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78892301"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:11:06 -0800
X-CSE-ConnectionGUID: l8FsaEglTACmckXU07ugYQ==
X-CSE-MsgGUID: hoYjPiL6SYK+WVYT8QdxsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="236522626"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Dec 2025 06:11:05 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWxfi-000000004cL-3Q8Z;
	Sat, 20 Dec 2025 14:11:02 +0000
Date: Sat, 20 Dec 2025 22:10:33 +0800
From: kernel test robot <lkp@intel.com>
To: hungkien05 <nguyenhunghnuekt@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:pr/24 1/1] arch/x86/kvm/emulate.c:1741:2: warning:
 '/*' within block comment
Message-ID: <202512202203.DAeqyrft-lkp@intel.com>
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
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251220/202512202203.DAeqyrft-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202203.DAeqyrft-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202203.DAeqyrft-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/emulate.c:1741:2: warning: '/*' within block comment [-Wcomment]
    1741 |         /*
         |         ^
   arch/x86/kvm/emulate.c:1759:4: error: expected expression
    1759 |          */
         |           ^
   arch/x86/kvm/emulate.c:1760:2: error: expected expression
    1760 |         if (seg == VCPU_SREG_SS && selector == 3 &&
         |         ^
   1 warning and 2 errors generated.


vim +1741 arch/x86/kvm/emulate.c

dde7e6d12a9ef9 Avi Kivity    2010-07-29  1733  
2356aaeb2f58f4 Paolo Bonzini 2014-05-15  1734  static int load_segment_descriptor(struct x86_emulate_ctxt *ctxt,
2356aaeb2f58f4 Paolo Bonzini 2014-05-15  1735  				   u16 selector, int seg)
2356aaeb2f58f4 Paolo Bonzini 2014-05-15  1736  {
2356aaeb2f58f4 Paolo Bonzini 2014-05-15  1737  	u8 cpl = ctxt->ops->cpl(ctxt);
33ab91103b3415 Paolo Bonzini 2017-01-12  1738  
dcd699a99ce2f4 hungkien05    2025-12-17  1739  
dcd699a99ce2f4 hungkien05    2025-12-17  1740  	/*
33ab91103b3415 Paolo Bonzini 2017-01-12 @1741  	/*
33ab91103b3415 Paolo Bonzini 2017-01-12  1742  	 * None of MOV, POP and LSS can load a NULL selector in CPL=3, but
dcd699a99ce2f4 hungkien05    2025-12-17  1743  	 * None of MOV, POP and LSS can load a NULL selector in CPL=3, but
dcd699a99ce2f4 hungkien05    2025-12-17  1744  	 * they can load it at CPL<3 (Intel's manual says only LSS can,
33ab91103b3415 Paolo Bonzini 2017-01-12  1745  	 * they can load it at CPL<3 (Intel's manual says only LSS can,
33ab91103b3415 Paolo Bonzini 2017-01-12  1746  	 * but it's wrong).
dcd699a99ce2f4 hungkien05    2025-12-17  1747  	 * but it's wrong).
dcd699a99ce2f4 hungkien05    2025-12-17  1748  	 *
33ab91103b3415 Paolo Bonzini 2017-01-12  1749  	 *
33ab91103b3415 Paolo Bonzini 2017-01-12  1750  	 * However, the Intel manual says that putting IST=1/DPL=3 in
dcd699a99ce2f4 hungkien05    2025-12-17  1751  	 * However, the Intel manual says that putting IST=1/DPL=3 in
dcd699a99ce2f4 hungkien05    2025-12-17  1752  	 * an interrupt gate will result in SS=3 (the AMD manual instead
33ab91103b3415 Paolo Bonzini 2017-01-12  1753  	 * an interrupt gate will result in SS=3 (the AMD manual instead
33ab91103b3415 Paolo Bonzini 2017-01-12  1754  	 * says it doesn't), so allow SS=3 in __load_segment_descriptor
dcd699a99ce2f4 hungkien05    2025-12-17  1755  	 * says it doesn't), so allow SS=3 in __load_segment_descriptor
dcd699a99ce2f4 hungkien05    2025-12-17  1756  	 * and only forbid it here.
33ab91103b3415 Paolo Bonzini 2017-01-12  1757  	 * and only forbid it here.
33ab91103b3415 Paolo Bonzini 2017-01-12  1758  	 */
dcd699a99ce2f4 hungkien05    2025-12-17  1759  	 */
dcd699a99ce2f4 hungkien05    2025-12-17  1760  	if (seg == VCPU_SREG_SS && selector == 3 &&
33ab91103b3415 Paolo Bonzini 2017-01-12  1761  	if (seg == VCPU_SREG_SS && selector == 3 &&
33ab91103b3415 Paolo Bonzini 2017-01-12  1762  	    ctxt->mode == X86EMUL_MODE_PROT64)
dcd699a99ce2f4 hungkien05    2025-12-17  1763  	    ctxt->mode == X86EMUL_MODE_PROT64)
dcd699a99ce2f4 hungkien05    2025-12-17  1764  		return emulate_exception(ctxt, GP_VECTOR, 0, true);
33ab91103b3415 Paolo Bonzini 2017-01-12  1765  		return emulate_exception(ctxt, GP_VECTOR, 0, true);
33ab91103b3415 Paolo Bonzini 2017-01-12  1766  
dcd699a99ce2f4 hungkien05    2025-12-17  1767  
3dc4bc4f6b9265 Nadav Amit    2014-12-25  1768  	return __load_segment_descriptor(ctxt, selector, seg, cpl,
3dc4bc4f6b9265 Nadav Amit    2014-12-25  1769  					 X86_TRANSFER_NONE, NULL);
2356aaeb2f58f4 Paolo Bonzini 2014-05-15  1770  }
2356aaeb2f58f4 Paolo Bonzini 2014-05-15  1771  

:::::: The code at line 1741 was first introduced by commit
:::::: 33ab91103b3415e12457e3104f0e4517ce12d0f3 KVM: x86: fix emulation of "MOV SS, null selector"

:::::: TO: Paolo Bonzini <pbonzini@redhat.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
