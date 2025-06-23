Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2121DB124;
	Mon, 23 Jun 2025 22:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750719526; cv=none; b=P3SCsuoOhhL1P0QVlC4buFJ9rxwpnfn+bGBEBU+rE6RxSFlIyiDmdUdilEyplSmw6bCIUp605/g0B8xjuzYPpgv1voQVt65g73KA4eCmZuZ7s/xldtccxa+HF24gz9md21DZGBLjMNV+bddLlgDhuB9TdQzeKchTi3uqnxG56qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750719526; c=relaxed/simple;
	bh=y4bBEgGDQr4yUfZcFX2eelDt9fUgo0j8aDLMezmE09M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y1MgngUd7mX5hRof7tr7IRrHR3PvaXtHADou8oOslRPMeOLWjjFQCPfbo5DV7lnzARhRfn6Q0K+NUFR2Xus3QJONOY6Maipq62ZzY7xehbzcGfqpNSeGd2jDjFHIbO9VbmOEQ3HiqM5NFOy6gqWW3ekcBSJuYjT8vIW2z+0oZI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ed2N2iFv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ed2N2iFv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750719525; x=1782255525;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y4bBEgGDQr4yUfZcFX2eelDt9fUgo0j8aDLMezmE09M=;
  b=ed2N2iFvalnPVm9ASBzduiFKX/QRlzZiui28JKMeP5ZEwnNW1oVuC5WB
   WNXaayiQNbmBHwjPQnuXpV4kQTEz0Y7346LJJ4Nufi3tjb3adCzFgPEVl
   RqvbPASw6Q/12fps51ZL2rbAAymflAcYYbh3kjXDfm956/l2aNNITfJNn
   7TrbLR4ruF80a7QaiHWS2m4+R/vYZwAAAAAqcBoTzlXyHxf/dIThYT8YN
   UelU1kKQPUNSkKKmWsHs029gIYn8Gva5+3Fn4jtmREcr4yYWM3JWNIOS/
   Ke9wNIPAPL4pqoTQTweNfVZQHLPJH4ut3Gu1kjb6GJGnx7N+Ty27OvraX
   w==;
X-CSE-ConnectionGUID: 06uhk+kdQeaGfjjhy0j33g==
X-CSE-MsgGUID: aFclZLKLQZaIkBOYdIcROA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63638419"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="63638419"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 15:58:44 -0700
X-CSE-ConnectionGUID: 7Rrv/idITdmHqRf7q900cA==
X-CSE-MsgGUID: Y2zhI94MRLOLOx83Lz829g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="152245122"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Jun 2025 15:58:42 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTq7b-000RUT-27;
	Mon, 23 Jun 2025 22:58:39 +0000
Date: Tue, 24 Jun 2025 06:58:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: [kas:x86/lass 3/16] arch/x86/include/asm/string.h:24:20: error:
 unknown token in expression
Message-ID: <202506240636.zGm9fPLQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git x86/lass
head:   4d9b0fc1c9bca1c3a2c2d01d33738f2557158126
commit: fcaaca8b6d6beb6a8dfaa24bda3d54545ce62164 [3/16] x86/alternatives: Disable LASS when patching kernel alternatives
config: i386-randconfig-001-20250621 (https://download.01.org/0day-ci/archive/20250624/202506240636.zGm9fPLQ-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506240636.zGm9fPLQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506240636.zGm9fPLQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/alternative.c:4:
   In file included from include/linux/mmu_context.h:5:
   In file included from arch/x86/include/asm/mmu_context.h:6:
   In file included from include/linux/mm_types.h:5:
   In file included from include/linux/mm_types_task.h:14:
   In file included from arch/x86/include/asm/page.h:14:
   In file included from arch/x86/include/asm/page_32.h:18:
   In file included from include/linux/string.h:65:
>> arch/x86/include/asm/string.h:24:20: error: unknown token in expression
      24 |         asm volatile("1:\n\t"
         |                           ^
   <inline asm>:2:12: note: instantiated into assembly here
       2 |         rep movsb2:
         |                   ^
   In file included from arch/x86/kernel/alternative.c:4:
   In file included from include/linux/mmu_context.h:5:
   In file included from arch/x86/include/asm/mmu_context.h:6:
   In file included from include/linux/mm_types.h:5:
   In file included from include/linux/mm_types_task.h:14:
   In file included from arch/x86/include/asm/page.h:14:
   In file included from arch/x86/include/asm/page_32.h:18:
   In file included from include/linux/string.h:65:
   arch/x86/include/asm/string.h:39:20: error: unknown token in expression
      39 |         asm volatile("1:\n\t"
         |                           ^
   <inline asm>:2:12: note: instantiated into assembly here
       2 |         rep stosb2:
         |                   ^
   2 errors generated.


vim +24 arch/x86/include/asm/string.h

e408c89255c561 Kirill A. Shutemov 2025-06-19  19  
e408c89255c561 Kirill A. Shutemov 2025-06-19  20  static __always_inline void *__inline_memcpy(void *to, const void *from, size_t len)
e408c89255c561 Kirill A. Shutemov 2025-06-19  21  {
e408c89255c561 Kirill A. Shutemov 2025-06-19  22  	void *ret = to;
e408c89255c561 Kirill A. Shutemov 2025-06-19  23  
e408c89255c561 Kirill A. Shutemov 2025-06-19 @24  	asm volatile("1:\n\t"
e408c89255c561 Kirill A. Shutemov 2025-06-19  25  		     ALT_64("rep movsb",
e408c89255c561 Kirill A. Shutemov 2025-06-19  26  			    "call rep_movs_alternative", ALT_NOT(X86_FEATURE_FSRM))
e408c89255c561 Kirill A. Shutemov 2025-06-19  27  		     "2:\n\t"
e408c89255c561 Kirill A. Shutemov 2025-06-19  28  		     _ASM_EXTABLE_UA(1b, 2b)
e408c89255c561 Kirill A. Shutemov 2025-06-19  29  		     :"+c" (len), "+D" (to), "+S" (from), ASM_CALL_CONSTRAINT
e408c89255c561 Kirill A. Shutemov 2025-06-19  30  		     : : "memory", _ASM_AX);
e408c89255c561 Kirill A. Shutemov 2025-06-19  31  
e408c89255c561 Kirill A. Shutemov 2025-06-19  32  	return ret + len;
e408c89255c561 Kirill A. Shutemov 2025-06-19  33  }
e408c89255c561 Kirill A. Shutemov 2025-06-19  34  

:::::: The code at line 24 was first introduced by commit
:::::: e408c89255c56175bcbed7e6b5ea5efd4074251d x86/asm: Introduce inline memcpy and memset

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
