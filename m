Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8178B2EA499;
	Wed, 13 Aug 2025 13:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755092352; cv=none; b=J18O9I8N2iGvkj/cUokg2Ah5LtYFi4hR4R5Aj4/jFTI1tZB1WEgcfV8fDEI9pO7PHWbZXCTWG+ofrUp2GreZpg19svkL6dIy8D0wNpUHzbyX1S4uT4giWBHls/W5zkMGFfVmQxacSKGqi8VLXa4VCzCNQb+T60MfCferwxtI34M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755092352; c=relaxed/simple;
	bh=ey8eSMdRLAlmFC09vuKwkFOnHkFG0NstFyZA4ySXPNo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pqplpefDW02Odnb8JCz/VsNiFoE68axEUd2BUe2PNgbZd1Cfh44901f440rPWxx+bgt5lK5PS/gc0bHTeyJijQhNd2xyKilseMaNtGW7MK/kBQxuWp0VguMxhSi8TmIz1lDHCBXmkd5eTRxz6euasS6Y4oqiH43YFkz2oPp+xAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UYxs+i2k; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UYxs+i2k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755092350; x=1786628350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ey8eSMdRLAlmFC09vuKwkFOnHkFG0NstFyZA4ySXPNo=;
  b=UYxs+i2kBqxwP8qZpHre+ecAP5Sk3vD8JwP3JfOjVk10ypKvx00FTfS1
   YLzqIWfsWS/9DFpMhMDQAyoeK+5jA8KMNRMPHbkrSPFBirV1d0J7+wI7u
   MujYKV93BnU8dvBV4RRCY1kquENp/EvBc+ReN/BR0fYtXLEvAU0105VcS
   yKArPAdgPxeRcixQiSpOSdJIqeHDMjyQHHybb2CJD1TAH5wnpaGWFBo3y
   /d8Kh+PLRLQDl5dQQ9sz2FGVnEFnPWB4FvlwQdmUaUV73X17ZeMDtitRf
   2rprDY/AXPtF73lelCpsOxslpwQTzsts3S5RfAvB16OdLBG2WGCJBB9OH
   w==;
X-CSE-ConnectionGUID: LL2OnvSNQ2imF43jUdDj2Q==
X-CSE-MsgGUID: 4EPWexdiS9CFwaRjrSfZMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="67659877"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="67659877"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 06:39:10 -0700
X-CSE-ConnectionGUID: 6KWxgs+yQ02+qcBirhtOmg==
X-CSE-MsgGUID: w3KQMHZORJOS1da0gFH+uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="165660598"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 13 Aug 2025 06:39:09 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umBgK-0009wo-1d;
	Wed, 13 Aug 2025 13:38:31 +0000
Date: Wed, 13 Aug 2025 21:34:15 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [akpm-mm:mm-new 123/137] arch/s390/mm/mmap.c:188:3: error: call to
 undeclared function 'mm_flag_set'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202508132154.feFNDPyq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lorenzo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   694c8e78f486b09137ee3efadae044d01aba971b
commit: 70fd92efa9e96967353bb39665bac8f5276aaaae [123/137] mm: convert arch-specific code to mm_flags_*() accessors
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20250813/202508132154.feFNDPyq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508132154.feFNDPyq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508132154.feFNDPyq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/s390/mm/mmap.c:188:3: error: call to undeclared function 'mm_flag_set'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     188 |                 mm_flag_set(MMF_TOPDOWN, mm);
         |                 ^
   arch/s390/mm/mmap.c:188:3: note: did you mean 'mm_flags_set'?
   include/linux/mm.h:740:20: note: 'mm_flags_set' declared here
     740 | static inline void mm_flags_set(int flag, struct mm_struct *mm)
         |                    ^
   1 error generated.


vim +/mm_flag_set +188 arch/s390/mm/mmap.c

   167	
   168	/*
   169	 * This function, called very early during the creation of a new
   170	 * process VM image, sets up which VM layout function to use:
   171	 */
   172	void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_stack)
   173	{
   174		unsigned long random_factor = 0UL;
   175	
   176		if (current->flags & PF_RANDOMIZE)
   177			random_factor = arch_mmap_rnd();
   178	
   179		/*
   180		 * Fall back to the standard layout if the personality
   181		 * bit is set, or if the expected stack growth is unlimited:
   182		 */
   183		if (mmap_is_legacy(rlim_stack)) {
   184			mm->mmap_base = mmap_base_legacy(random_factor);
   185			mm_flags_clear(MMF_TOPDOWN, mm);
   186		} else {
   187			mm->mmap_base = mmap_base(random_factor, rlim_stack);
 > 188			mm_flag_set(MMF_TOPDOWN, mm);
   189		}
   190	}
   191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
