Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45BB15D5B6;
	Tue, 24 Jun 2025 08:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750755598; cv=none; b=EQo4jQQr8VyUFFzU8k4wUw5ide9YW9uSku0m3YDbI4TMFZKWcJjdGZGM+DsD8bVfSF3IoQSOnAoOBOFG/8rYbiA4JF6d0Ka4M/lgmA/NCZsYrDbkvyR9SeI9czQ4R2uoehq6eWx1RyLdA8RJYXWc/EZQy3YOpHDwPoZQJTJjedI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750755598; c=relaxed/simple;
	bh=mv6deIQgYYrmiDFrmOia50IP9aUj4mlUs1dY09kf7T0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qxflEi0wYZbMicgUIG8itN88X2X48PQiDmOraDN2BrugWvM011Hqo33uoacnIAzYaui7ldOPa3gVZaAr+M0c/wFFT/FWny2c9znx3SLSNTPQKitLuBm25sSX2KAqj2YHQc8HV6E52SrZJTe681dXy/jt119iN8cJu5rrLzYkJIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dqn6gt3q; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dqn6gt3q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750755597; x=1782291597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mv6deIQgYYrmiDFrmOia50IP9aUj4mlUs1dY09kf7T0=;
  b=Dqn6gt3qQX1T9znzaNKk8FwLVzJA6INvb8UhANdMRbgJbsokGGczbSxI
   tN2uO4aqyi3J8y7OF3eqJfWzUAKaBxwN05AxqaG/XmaXwXKUaogKmcRG9
   E5LRFQ06dufLOeNc7iqlP55k4p8Y5lBLdQeLs9KWYSIt/6RwuHenQdWxF
   p8lDHva83yyjAh0HKjodnXjwOCHHaCP7kYRAWv6bv6CStXOQbjCBssKfd
   TfmF1xJ1MzVBfSia7Btc8PfltqydGt8Go/kUZjb0pX1wtrLR2GVfk+YuR
   G+1dfy/F86p5fVPix7X52/C2DsioiqWXFy/8MpONWs7Q+lv6aXOU58a2f
   A==;
X-CSE-ConnectionGUID: PdSPxJ8mSHaNGDVPT4T0wg==
X-CSE-MsgGUID: +edIGX1VSy+JDoc8gaWTEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="63251492"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="63251492"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 01:59:57 -0700
X-CSE-ConnectionGUID: WjLDSdPMQkq23KURx0RcQQ==
X-CSE-MsgGUID: WUJGwaFTTJSUF0x8xnabRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="151608391"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 24 Jun 2025 01:59:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTzVQ-000Rxe-20;
	Tue, 24 Jun 2025 08:59:52 +0000
Date: Tue, 24 Jun 2025 16:59:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: [kas:x86/lass 4/16] arch/x86/include/asm/string.h:29:8: error:
 directional label undefined
Message-ID: <202506241630.q8qBOcZA-lkp@intel.com>
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
commit: 3944177b3278b4805ec2b598baeaba68771d89d2 [4/16] x86/alternatives: Disable LASS when patching kernel alternatives
config: i386-buildonly-randconfig-001-20250624 (https://download.01.org/0day-ci/archive/20250624/202506241630.q8qBOcZA-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506241630.q8qBOcZA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506241630.q8qBOcZA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/alternative.c:4:
   In file included from include/linux/mmu_context.h:5:
   In file included from arch/x86/include/asm/mmu_context.h:6:
   In file included from include/linux/mm_types.h:5:
   In file included from include/linux/mm_types_task.h:14:
   In file included from arch/x86/include/asm/page.h:14:
   In file included from arch/x86/include/asm/page_32.h:18:
   In file included from include/linux/string.h:65:
   arch/x86/include/asm/string.h:25:20: error: unknown token in expression
      25 |         asm volatile("1:\n\t"
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
>> arch/x86/include/asm/string.h:29:8: error: directional label undefined
      29 |                      _ASM_EXTABLE_UA(1b, 2b)
         |                      ^
   arch/x86/include/asm/asm.h:236:2: note: expanded from macro '_ASM_EXTABLE_UA'
     236 |         _ASM_EXTABLE_TYPE(from, to, EX_TYPE_UACCESS)
         |         ^
   arch/x86/include/asm/asm.h:195:3: note: expanded from macro '_ASM_EXTABLE_TYPE'
     195 |         " .long (" #to ") - .\n"                                \
         |          ^
   <inline asm>:6:9: note: instantiated into assembly here
       6 |  .long (2b) - .
         |         ^
   In file included from arch/x86/kernel/alternative.c:4:
   In file included from include/linux/mmu_context.h:5:
   In file included from arch/x86/include/asm/mmu_context.h:6:
   In file included from include/linux/mm_types.h:5:
   In file included from include/linux/mm_types_task.h:14:
   In file included from arch/x86/include/asm/page.h:14:
   In file included from arch/x86/include/asm/page_32.h:18:
   In file included from include/linux/string.h:65:
   arch/x86/include/asm/string.h:40:20: error: unknown token in expression
      40 |         asm volatile("1:\n\t"
         |                           ^
   <inline asm>:2:12: note: instantiated into assembly here
       2 |         rep stosb2:
         |                   ^
   In file included from arch/x86/kernel/alternative.c:4:
   In file included from include/linux/mmu_context.h:5:
   In file included from arch/x86/include/asm/mmu_context.h:6:
   In file included from include/linux/mm_types.h:5:
   In file included from include/linux/mm_types_task.h:14:
   In file included from arch/x86/include/asm/page.h:14:
   In file included from arch/x86/include/asm/page_32.h:18:
   In file included from include/linux/string.h:65:
   arch/x86/include/asm/string.h:44:8: error: directional label undefined
      44 |                      _ASM_EXTABLE_UA(1b, 2b)
         |                      ^
   arch/x86/include/asm/asm.h:236:2: note: expanded from macro '_ASM_EXTABLE_UA'
     236 |         _ASM_EXTABLE_TYPE(from, to, EX_TYPE_UACCESS)
         |         ^
   arch/x86/include/asm/asm.h:195:3: note: expanded from macro '_ASM_EXTABLE_TYPE'
     195 |         " .long (" #to ") - .\n"                                \
         |          ^
   <inline asm>:6:9: note: instantiated into assembly here
       6 |  .long (2b) - .
         |         ^
   4 errors generated.


vim +29 arch/x86/include/asm/string.h

3e404481ebdedf0 Kirill A. Shutemov 2025-06-19  20  
3e404481ebdedf0 Kirill A. Shutemov 2025-06-19  21  static __always_inline void *__inline_memcpy(void *to, const void *from, size_t len)
3e404481ebdedf0 Kirill A. Shutemov 2025-06-19  22  {
3e404481ebdedf0 Kirill A. Shutemov 2025-06-19  23  	void *ret = to;
3e404481ebdedf0 Kirill A. Shutemov 2025-06-19  24  
3e404481ebdedf0 Kirill A. Shutemov 2025-06-19  25  	asm volatile("1:\n\t"
3e404481ebdedf0 Kirill A. Shutemov 2025-06-19  26  		     ALT_64("rep movsb",
3e404481ebdedf0 Kirill A. Shutemov 2025-06-19  27  			    "call rep_movs_alternative", ALT_NOT(X86_FEATURE_FSRM))
3e404481ebdedf0 Kirill A. Shutemov 2025-06-19  28  		     "2:\n\t"
3e404481ebdedf0 Kirill A. Shutemov 2025-06-19 @29  		     _ASM_EXTABLE_UA(1b, 2b)
3e404481ebdedf0 Kirill A. Shutemov 2025-06-19  30  		     :"+c" (len), "+D" (to), "+S" (from), ASM_CALL_CONSTRAINT
3e404481ebdedf0 Kirill A. Shutemov 2025-06-19  31  		     : : "memory", _ASM_AX);
3e404481ebdedf0 Kirill A. Shutemov 2025-06-19  32  
3e404481ebdedf0 Kirill A. Shutemov 2025-06-19  33  	return ret + len;
3e404481ebdedf0 Kirill A. Shutemov 2025-06-19  34  }
3e404481ebdedf0 Kirill A. Shutemov 2025-06-19  35  

:::::: The code at line 29 was first introduced by commit
:::::: 3e404481ebdedf05eee46606d230adc84c88987f x86/asm: Introduce inline memcpy and memset

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
