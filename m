Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD20FC1D;
	Sat, 11 Oct 2025 02:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760151485; cv=none; b=GjEn1FOSkRFiOXwR4v88qsArYSJbEdXCmK7fBFIWMxRs38qGx7uXTPJwMItHz5+AWnhr+wiRdSFttmPt4pYmJPKwguc2XEvbp4nDg9IPYHJzNP7i1UcXXyXRG/fwcSCZg6WAooegRba1x0c1rM+xAOIcnbsyp5/iHkz8JB453Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760151485; c=relaxed/simple;
	bh=mj86n2v/OForwGuqblsavUcP5koDEkJxj8E3q2tFfQY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hrL9uhUZimLZ7Lw0OC23UABifiiKSVBF1mPh6d48j+pcEfWF3tNM/R+iYHX4gufGHK4Rz2739NYMjKX+5S87KwogT4QsLtUxBVnQTbWPYrn7zUFv+Vw2aSLIRuzjv3CA8+dnlk4EqihYnzpaP2SFsNxaiP+GwXvT1WEXOViwCbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TFRsX+5c; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TFRsX+5c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760151484; x=1791687484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mj86n2v/OForwGuqblsavUcP5koDEkJxj8E3q2tFfQY=;
  b=TFRsX+5cmx4bTNj92DUANXAe4bXeh5tI684sW1lLH/jaMgMULONWjXiY
   1VWq5CzXMEEs13JsrV1gLRppjZq3c9LcgGUHTqtqsO8phM6+qyL5v/WLc
   HhxgG5VOfOu7nxWdl6vkf4ZCzWmj9cxpCE246iK7HGlDBKzdnWd0ltOmm
   YtgIV//pR3xP4RdiozpLm5fJca/oWTTz92iXfTojyYp+584OkUTyU5zk0
   r5qBZ7urVa2Ygnbh1d4lzNm9SaQTPjuYgWEmnwxRj/NiJJng5MZvn319p
   jPiy+CPJu91ku+6qSxV+niFsTo1zxBWNddXm565Y7WXvXu/HolQFZ8oX3
   w==;
X-CSE-ConnectionGUID: A04gwqUETuaO/zrR7JYbAw==
X-CSE-MsgGUID: JKJXO/R9RRa6ARcX7THu+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="62466499"
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="62466499"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 19:58:03 -0700
X-CSE-ConnectionGUID: ENttCb7rRqy9283u5NBjeQ==
X-CSE-MsgGUID: zUQtuHkSTLu7kGLruYc18g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,220,1754982000"; 
   d="scan'208";a="180232778"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Oct 2025 19:58:02 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7Pny-0003S9-2L;
	Sat, 11 Oct 2025 02:57:58 +0000
Date: Sat, 11 Oct 2025 10:57:23 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:tmp 70/70] drivers/misc/lkdtm/perms.c:93:1: error: too few
 arguments provided to function-like macro invocation
Message-ID: <202510111008.vwipraaS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git tmp
head:   49a325e76670a179209c1e93e63e70e74b73c230
commit: 49a325e76670a179209c1e93e63e70e74b73c230 [70/70] Merge branch 'objtool/core' into x86/core
config: x86_64-buildonly-randconfig-002-20251011 (https://download.01.org/0day-ci/archive/20251011/202510111008.vwipraaS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510111008.vwipraaS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510111008.vwipraaS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/misc/lkdtm/perms.c:93:1: error: too few arguments provided to function-like macro invocation
      93 | ANNOTATE_NOCFI_SYM(execute_location);
         | ^
   include/linux/annotate.h:113:72: note: expanded from macro 'ANNOTATE_NOCFI_SYM'
     113 | #define ANNOTATE_NOCFI_SYM(sym)         asm(__ASM_ANNOTATE(sym, ANNOTYPE_NOCFI))
         |                                                                               ^
   include/linux/annotate.h:11:9: note: macro '__ASM_ANNOTATE' defined here
      11 | #define __ASM_ANNOTATE(section, label, type)                            \
         |         ^
   drivers/misc/lkdtm/perms.c:93:1: error: expected string literal in 'asm'
      93 | ANNOTATE_NOCFI_SYM(execute_location);
         | ^
   include/linux/annotate.h:113:38: note: expanded from macro 'ANNOTATE_NOCFI_SYM'
     113 | #define ANNOTATE_NOCFI_SYM(sym)         asm(__ASM_ANNOTATE(sym, ANNOTYPE_NOCFI))
         |                                             ^
   2 errors generated.


vim +93 drivers/misc/lkdtm/perms.c

72a86433049dcf drivers/misc/lkdtm/perms.c Christophe Leroy 2022-02-15  71  
fb28a8862dc4b5 drivers/misc/lkdtm/perms.c Kees Cook        2024-04-30  72  static noinline __nocfi void execute_location(void *dst, bool write)
0d9eb29b13f0e3 drivers/misc/lkdtm_perms.c Kees Cook        2016-06-26  73  {
72a86433049dcf drivers/misc/lkdtm/perms.c Christophe Leroy 2022-02-15  74  	void (*func)(void);
72a86433049dcf drivers/misc/lkdtm/perms.c Christophe Leroy 2022-02-15  75  	func_desc_t fdesc;
0d9eb29b13f0e3 drivers/misc/lkdtm_perms.c Kees Cook        2016-06-26  76  
05026ea01e95ff drivers/misc/lkdtm/perms.c Josh Poimboeuf   2025-03-24  77  	pr_info("attempting ok execution at %px\n", do_nothing_ptr);
0d9eb29b13f0e3 drivers/misc/lkdtm_perms.c Kees Cook        2016-06-26  78  	do_nothing();
0d9eb29b13f0e3 drivers/misc/lkdtm_perms.c Kees Cook        2016-06-26  79  
0d9eb29b13f0e3 drivers/misc/lkdtm_perms.c Kees Cook        2016-06-26  80  	if (write == CODE_WRITE) {
05026ea01e95ff drivers/misc/lkdtm/perms.c Josh Poimboeuf   2025-03-24  81  		memcpy(dst, do_nothing_ptr, EXEC_SIZE);
0d9eb29b13f0e3 drivers/misc/lkdtm_perms.c Kees Cook        2016-06-26  82  		flush_icache_range((unsigned long)dst,
0d9eb29b13f0e3 drivers/misc/lkdtm_perms.c Kees Cook        2016-06-26  83  				   (unsigned long)dst + EXEC_SIZE);
0d9eb29b13f0e3 drivers/misc/lkdtm_perms.c Kees Cook        2016-06-26  84  	}
72a86433049dcf drivers/misc/lkdtm/perms.c Christophe Leroy 2022-02-15  85  	pr_info("attempting bad execution at %px\n", dst);
72a86433049dcf drivers/misc/lkdtm/perms.c Christophe Leroy 2022-02-15  86  	func = setup_function_descriptor(&fdesc, dst);
0d9eb29b13f0e3 drivers/misc/lkdtm_perms.c Kees Cook        2016-06-26  87  	func();
464e86b4abadfc drivers/misc/lkdtm/perms.c Kees Cook        2020-06-25  88  	pr_err("FAIL: func returned\n");
0d9eb29b13f0e3 drivers/misc/lkdtm_perms.c Kees Cook        2016-06-26  89  }
894af4a1cde61c drivers/misc/lkdtm/perms.c Peter Zijlstra   2025-04-12  90  /*
894af4a1cde61c drivers/misc/lkdtm/perms.c Peter Zijlstra   2025-04-12  91   * Explicitly doing the wrong thing for testing.
894af4a1cde61c drivers/misc/lkdtm/perms.c Peter Zijlstra   2025-04-12  92   */
894af4a1cde61c drivers/misc/lkdtm/perms.c Peter Zijlstra   2025-04-12 @93  ANNOTATE_NOCFI_SYM(execute_location);
0d9eb29b13f0e3 drivers/misc/lkdtm_perms.c Kees Cook        2016-06-26  94  

:::::: The code at line 93 was first introduced by commit
:::::: 894af4a1cde61c3401f237184fb770f72ff12df8 objtool: Validate kCFI calls

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
