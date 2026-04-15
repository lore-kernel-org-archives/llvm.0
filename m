Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9E033859C;
	Wed, 15 Apr 2026 14:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776265097; cv=none; b=Tc3McMvRvhW+kppijJQw49kkzGcNFn8Rb4qBzt0R3fIXCQwVu2USTU1fKLRj0KrgArhKLvTR9a44CLFrhWC+eAwflgekfoZCjHYxLQpENnMlJtkKNfVq0Ud6e2ZPZaqV/QGpyE/pOPaOYVmdz/LsJgjmU8V4bi8SNP1DzMYu1mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776265097; c=relaxed/simple;
	bh=zgX3pTdLfVhNViSnc+m9PWN9AfM3zvhWu5UWuxvlEFA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BCG1y/9lXF3ngJNiUR4pdW5BoC1cO6ca1qnskU6tz7Pdv4z3Y9z5bXm7WVr9YTh/bjeQ4EesifrMcSBraFnvuRsEdi4EL/2qSJEQKBiCbCu8tHmpeA1opPB4omupIW24WdE0BGHLtwyDLyPdt4dvSmCQxo0TmnQXr1XIpXJxAYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SexbBBhc; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SexbBBhc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776265096; x=1807801096;
  h=date:from:to:cc:subject:message-id;
  bh=zgX3pTdLfVhNViSnc+m9PWN9AfM3zvhWu5UWuxvlEFA=;
  b=SexbBBhcdShG8mbrSWBgJiILKYutvDu6ZSYwjadClVmATT301wndv44V
   V/PWwqpC9TPVDOlwigBIReB2e9WD+qsAXaSQN+VIlnNxWMYX35/Kz9y8H
   brz4jINV+McQuRkBgeYgAAem5tpgX8hfKrDw2sWup6vvgLUPal15Yb6VY
   jx+lmi22IgdEF/sthw+NmmGfONuKg1+xrqRrLDLMcGz7MDCCH8PoVpWRm
   VTnOD7KDGYAk25evQmOz0b8iTy2fUMIj/y2dn7JZsdYoV0KglVGdZVWMT
   dmH7ATKo/n2wG+x61xaNpxCnaBVIKxfAtePsMla1IZs88eTLUCaiRFCFQ
   A==;
X-CSE-ConnectionGUID: 6U1069YDRMaIvvXdjlwrUA==
X-CSE-MsgGUID: gJ7lV3AcSguxE08fD68laQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77426628"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77426628"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 07:58:16 -0700
X-CSE-ConnectionGUID: vLHWJ+FgRdqaCPa3ZPyViQ==
X-CSE-MsgGUID: 0GkrzZf7T+OX+mbxNuoBrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="234475618"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Apr 2026 07:58:14 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wD1gx-000000000bZ-2mKD;
	Wed, 15 Apr 2026 14:58:11 +0000
Date: Wed, 15 Apr 2026 22:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kas:uffd 3/12] mm/mprotect.c:659:13: error: use of
 undeclared identifier 'PAGE_NONE'; did you mean 'PAGE_COPY'?
Message-ID: <202604152211.toekRGc8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git uffd
head:   bfa1e12c7a014c9ce5d1ae4b8b43dcb8e3d62965
commit: 871fdd0aefe33cdad832ec2005b7b8f5a1059033 [3/12] userfaultfd: implement UFFDIO_DEACTIVATE ioctl
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20260415/202604152211.toekRGc8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604152211.toekRGc8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604152211.toekRGc8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/mprotect.c:659:13: error: use of undeclared identifier 'PAGE_NONE'; did you mean 'PAGE_COPY'?
     659 |                 newprot = PAGE_NONE;
         |                           ^~~~~~~~~
         |                           PAGE_COPY
   arch/sparc/include/asm/pgtable_64.h:202:17: note: 'PAGE_COPY' declared here
     202 | extern pgprot_t PAGE_COPY;
         |                 ^
   1 error generated.


vim +659 mm/mprotect.c

   657	
   658		if (cp_flags & MM_CP_UFFD_DEACTIVATE)
 > 659			newprot = PAGE_NONE;
   660	
   661		if (is_vm_hugetlb_page(vma))
   662			pages = hugetlb_change_protection(vma, start, end, newprot,
   663							  cp_flags);
   664		else
   665			pages = change_protection_range(tlb, vma, start, end, newprot,
   666							cp_flags);
   667	
   668		return pages;
   669	}
   670	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
