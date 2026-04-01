Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE78B33F593;
	Wed,  1 Apr 2026 23:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775087295; cv=none; b=PbaQzyr9plJSRvSb/Z9i0Lqd6WZnelATffMwpES8IXWYxrYrLlRX1gOJySElStUqy5WbGAw7Dm7GJfWppAiQ0nW8Cua3ys0WZvB6wFKw3Bru5mJxRXUKC3JppsgYkXlh4y6vIXH6WZTuoNJ4CWxxHcGda6d9TVBZfWmUSuPPnX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775087295; c=relaxed/simple;
	bh=Sbp+cMLRIyTRLfreo4Qldv2H/5CH+hiIZgFAr8Yixo4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jZZeJYUpHNFz7QwueNcnCYLTDD6fnHjeCB/stiSFmUGLtnQ/k7bU1fyj/0MBZFNstW22WpcngzvjDefTLMEJN0LZryiqEzS0wuVyE6Vva7e2R6Fw628bHrxNOLCZyxRopGax/ktBBe0/VxiMYH428RWw8hWRjQouQ8yKVDtmP8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJRrbUn5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJRrbUn5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775087293; x=1806623293;
  h=date:from:to:cc:subject:message-id;
  bh=Sbp+cMLRIyTRLfreo4Qldv2H/5CH+hiIZgFAr8Yixo4=;
  b=aJRrbUn5l0h4We93F1n6Z9UgUv7DmtwBk768I3wVjExPF18llMNYvsZQ
   QPBEuLwVuJcQpvg9u6pXrB9RIKDyigojDmOJ1sM1pq1Gvh9HuLcDXKyPC
   U1JRhI0Pw9nLk2THMRTQvGkj7McEXz/Au543mOc6ILts59IoPy01Ktrue
   IlSyqA8BrGQxmQ5T54oA5uG0PljMdtrLiPwxKKZ4PW536x74HC+QEId3s
   BcKvYC2yszzhOA3QsupwPvO7Q8QEDKuchCE1Kiu0B/ekxULpFtfz2cdJi
   Ds7m6ioC+TOHC882Pvl4H2yzkVy9Qo3vLuiMr8/fadmIyiwgR3zupGjXe
   Q==;
X-CSE-ConnectionGUID: rRFwfTWTRt+4cXC1BMkLjA==
X-CSE-MsgGUID: 1KO88cWTQvWiW6Le+R9awQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="93531363"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="93531363"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 16:48:13 -0700
X-CSE-ConnectionGUID: 8joVDnWNSgCWb+KaG/QvVw==
X-CSE-MsgGUID: Efn+s1fmTpuFmnQOaHYAYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="228429002"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 01 Apr 2026 16:48:11 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w85I9-000000008s1-0N5e;
	Wed, 01 Apr 2026 23:48:09 +0000
Date: Thu, 02 Apr 2026 01:47:53 +0200
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Breno Leitao <leitao@debian.org>
Subject: [ardb:x86-efi-memattr-kexec-v3 4/5]
 drivers/firmware/efi/memattr.c:104:8: error: call to undeclared function
 'PAGE_ALIGNED'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202604020129.gK0ZFl02-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-memattr-kexec-v3
head:   9dee7ecd271959a84a9d7bd622e017f6eb7ff5b9
commit: 3f66665e01597a2b05c8d87edf66f3227a97c994 [4/5] efi: Use efi_mem_reserve() to reserve the memory attribute table
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260402/202604020129.gK0ZFl02-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604020129.gK0ZFl02-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604020129.gK0ZFl02-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/efi/memattr.c:104:8: error: call to undeclared function 'PAGE_ALIGNED'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     104 |             (!PAGE_ALIGNED(in->phys_addr) ||
         |               ^
   1 error generated.


vim +/PAGE_ALIGNED +104 drivers/firmware/efi/memattr.c

10f0d2f5770535 Ard Biesheuvel 2016-04-25   83  
10f0d2f5770535 Ard Biesheuvel 2016-04-25   84  /*
10f0d2f5770535 Ard Biesheuvel 2016-04-25   85   * Returns a copy @out of the UEFI memory descriptor @in if it is covered
10f0d2f5770535 Ard Biesheuvel 2016-04-25   86   * entirely by a UEFI memory map entry with matching attributes. The virtual
10f0d2f5770535 Ard Biesheuvel 2016-04-25   87   * address of @out is set according to the matching entry that was found.
10f0d2f5770535 Ard Biesheuvel 2016-04-25   88   */
10f0d2f5770535 Ard Biesheuvel 2016-04-25   89  static bool entry_is_valid(const efi_memory_desc_t *in, efi_memory_desc_t *out)
10f0d2f5770535 Ard Biesheuvel 2016-04-25   90  {
10f0d2f5770535 Ard Biesheuvel 2016-04-25   91  	u64 in_paddr = in->phys_addr;
10f0d2f5770535 Ard Biesheuvel 2016-04-25   92  	u64 in_size = in->num_pages << EFI_PAGE_SHIFT;
10f0d2f5770535 Ard Biesheuvel 2016-04-25   93  	efi_memory_desc_t *md;
10f0d2f5770535 Ard Biesheuvel 2016-04-25   94  
10f0d2f5770535 Ard Biesheuvel 2016-04-25   95  	*out = *in;
10f0d2f5770535 Ard Biesheuvel 2016-04-25   96  
10f0d2f5770535 Ard Biesheuvel 2016-04-25   97  	if (in->type != EFI_RUNTIME_SERVICES_CODE &&
10f0d2f5770535 Ard Biesheuvel 2016-04-25   98  	    in->type != EFI_RUNTIME_SERVICES_DATA) {
10f0d2f5770535 Ard Biesheuvel 2016-04-25   99  		pr_warn("Entry type should be RuntimeServiceCode/Data\n");
10f0d2f5770535 Ard Biesheuvel 2016-04-25  100  		return false;
10f0d2f5770535 Ard Biesheuvel 2016-04-25  101  	}
10f0d2f5770535 Ard Biesheuvel 2016-04-25  102  
10f0d2f5770535 Ard Biesheuvel 2016-04-25  103  	if (PAGE_SIZE > EFI_PAGE_SIZE &&
10f0d2f5770535 Ard Biesheuvel 2016-04-25 @104  	    (!PAGE_ALIGNED(in->phys_addr) ||
10f0d2f5770535 Ard Biesheuvel 2016-04-25  105  	     !PAGE_ALIGNED(in->num_pages << EFI_PAGE_SHIFT))) {
10f0d2f5770535 Ard Biesheuvel 2016-04-25  106  		/*
10f0d2f5770535 Ard Biesheuvel 2016-04-25  107  		 * Since arm64 may execute with page sizes of up to 64 KB, the
10f0d2f5770535 Ard Biesheuvel 2016-04-25  108  		 * UEFI spec mandates that RuntimeServices memory regions must
10f0d2f5770535 Ard Biesheuvel 2016-04-25  109  		 * be 64 KB aligned. We need to validate this here since we will
10f0d2f5770535 Ard Biesheuvel 2016-04-25  110  		 * not be able to tighten permissions on such regions without
10f0d2f5770535 Ard Biesheuvel 2016-04-25  111  		 * affecting adjacent regions.
10f0d2f5770535 Ard Biesheuvel 2016-04-25  112  		 */
10f0d2f5770535 Ard Biesheuvel 2016-04-25  113  		pr_warn("Entry address region misaligned\n");
10f0d2f5770535 Ard Biesheuvel 2016-04-25  114  		return false;
10f0d2f5770535 Ard Biesheuvel 2016-04-25  115  	}
10f0d2f5770535 Ard Biesheuvel 2016-04-25  116  
10f0d2f5770535 Ard Biesheuvel 2016-04-25  117  	for_each_efi_memory_desc(md) {
10f0d2f5770535 Ard Biesheuvel 2016-04-25  118  		u64 md_paddr = md->phys_addr;
10f0d2f5770535 Ard Biesheuvel 2016-04-25  119  		u64 md_size = md->num_pages << EFI_PAGE_SHIFT;
10f0d2f5770535 Ard Biesheuvel 2016-04-25  120  
10f0d2f5770535 Ard Biesheuvel 2016-04-25  121  		if (!(md->attribute & EFI_MEMORY_RUNTIME))
10f0d2f5770535 Ard Biesheuvel 2016-04-25  122  			continue;
5de0fef0230f3c Ard Biesheuvel 2019-02-02  123  		if (md->virt_addr == 0 && md->phys_addr != 0) {
10f0d2f5770535 Ard Biesheuvel 2016-04-25  124  			/* no virtual mapping has been installed by the stub */
10f0d2f5770535 Ard Biesheuvel 2016-04-25  125  			break;
10f0d2f5770535 Ard Biesheuvel 2016-04-25  126  		}
10f0d2f5770535 Ard Biesheuvel 2016-04-25  127  
10f0d2f5770535 Ard Biesheuvel 2016-04-25  128  		if (md_paddr > in_paddr || (in_paddr - md_paddr) >= md_size)
10f0d2f5770535 Ard Biesheuvel 2016-04-25  129  			continue;
10f0d2f5770535 Ard Biesheuvel 2016-04-25  130  
10f0d2f5770535 Ard Biesheuvel 2016-04-25  131  		/*
10f0d2f5770535 Ard Biesheuvel 2016-04-25  132  		 * This entry covers the start of @in, check whether
10f0d2f5770535 Ard Biesheuvel 2016-04-25  133  		 * it covers the end as well.
10f0d2f5770535 Ard Biesheuvel 2016-04-25  134  		 */
10f0d2f5770535 Ard Biesheuvel 2016-04-25  135  		if (md_paddr + md_size < in_paddr + in_size) {
10f0d2f5770535 Ard Biesheuvel 2016-04-25  136  			pr_warn("Entry covers multiple EFI memory map regions\n");
10f0d2f5770535 Ard Biesheuvel 2016-04-25  137  			return false;
10f0d2f5770535 Ard Biesheuvel 2016-04-25  138  		}
10f0d2f5770535 Ard Biesheuvel 2016-04-25  139  
10f0d2f5770535 Ard Biesheuvel 2016-04-25  140  		if (md->type != in->type) {
10f0d2f5770535 Ard Biesheuvel 2016-04-25  141  			pr_warn("Entry type deviates from EFI memory map region type\n");
10f0d2f5770535 Ard Biesheuvel 2016-04-25  142  			return false;
10f0d2f5770535 Ard Biesheuvel 2016-04-25  143  		}
10f0d2f5770535 Ard Biesheuvel 2016-04-25  144  
10f0d2f5770535 Ard Biesheuvel 2016-04-25  145  		out->virt_addr = in_paddr + (md->virt_addr - md_paddr);
10f0d2f5770535 Ard Biesheuvel 2016-04-25  146  
10f0d2f5770535 Ard Biesheuvel 2016-04-25  147  		return true;
10f0d2f5770535 Ard Biesheuvel 2016-04-25  148  	}
10f0d2f5770535 Ard Biesheuvel 2016-04-25  149  
10f0d2f5770535 Ard Biesheuvel 2016-04-25  150  	pr_warn("No matching entry found in the EFI memory map\n");
10f0d2f5770535 Ard Biesheuvel 2016-04-25  151  	return false;
10f0d2f5770535 Ard Biesheuvel 2016-04-25  152  }
10f0d2f5770535 Ard Biesheuvel 2016-04-25  153  

:::::: The code at line 104 was first introduced by commit
:::::: 10f0d2f57705350bbbe5f28e9292ae3905823c3c efi: Implement generic support for the Memory Attributes table

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
