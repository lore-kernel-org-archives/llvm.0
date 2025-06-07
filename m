Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8022066F7;
	Sat,  7 Jun 2025 11:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749296626; cv=none; b=Y3pH7vmg6dpMRXmBw6WZ1mFNvgOFHHOCHBiWwqIL/ZqeMlDlyWzymPJpXApmJ9e5sU24Xx+GrQClSfrpCELZJUpyOtFZ+NYG43fl37DbMHue6sMUXMllw+H51MZAKmbBqMQYVb0gk59olIQ3b7lvNtSJwrboI4Y06y1eGvm2nJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749296626; c=relaxed/simple;
	bh=MpHxAOm2WC5jWD0JtXMTtZBYf9ezqU0mCXhlf3fca8E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dQuskvHCMJUsNfeUne6Pn0WeV9eEosjtRp6PJjUdnFzrJqtutwrt0zlaC9wS5EIJaqAJswOxYoyYo35zWNmMLyy4BzuJl4/pAyU0zZXHkZ1yrVBqnEu7PWXynxIqAtsY6b8suWH+IKu4Ip23xentt06HGWRks9Q859NQ0kq1krg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WjS9nHbg; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjS9nHbg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749296625; x=1780832625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MpHxAOm2WC5jWD0JtXMTtZBYf9ezqU0mCXhlf3fca8E=;
  b=WjS9nHbgz27km75fRo8GV0Ai405usLO0W92aacpXqFk3xye6sa8Um7lp
   oDV+CMzQDv6imI8hj2lD92QLnP5OHpGf4TVWFpn41RdeOCtRZzBOduxv2
   BzPdt7ep27tTS3cnG268aH9C2xokVDm5Idc8cF8nn/IcDM/BA0JGISMai
   1hT/htEvaR4iOjQyB04lz0IJD908eeUPL/jubxJ4ncNjpuGjg8V4otgbg
   kv/4AciU/iNZFEyNtkqLW2USJkfh0D1TEnJ9agfgLdSZrwWgNMMTXg+pv
   +G2vk7tbC0XVSz1ywLWZ//rUvC6aPNADVoXjGkbBdWvmEpYBlmyxWr3c5
   g==;
X-CSE-ConnectionGUID: fewbuc97T229oClPHy5w5w==
X-CSE-MsgGUID: jW6DXa/WQu+K3LnvPzVkww==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="62056024"
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="62056024"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 04:43:44 -0700
X-CSE-ConnectionGUID: 949zoHYoTjKsQ7Wcuj+5mg==
X-CSE-MsgGUID: BCTDUDKESzyhP5VH0Ml/Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="145982363"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Jun 2025 04:43:44 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNrxd-0005lL-1c;
	Sat, 07 Jun 2025 11:43:41 +0000
Date: Sat, 7 Jun 2025 19:43:37 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:vm_normal_page_pud 14/15]
 fs/proc/task_mmu.c:2945:39: error: too many arguments to function call,
 expected 2, have 3
Message-ID: <202506071913.HCEFicv7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux vm_normal_page_pud
head:   5e55c4b55694005e4fb9300605ca3723623a61f9
commit: d4c2804ff0a82674ac79ddb5d6d7e3f77f814255 [14/15] mm: drop addr parameter from vm_normal_*_pmd() and vm_normal_*_pud()
config: x86_64-buildonly-randconfig-003-20250607 (https://download.01.org/0day-ci/archive/20250607/202506071913.HCEFicv7-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506071913.HCEFicv7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506071913.HCEFicv7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/proc/task_mmu.c:2945:39: error: too many arguments to function call, expected 2, have 3
    2945 |         page = vm_normal_page_pmd(vma, addr, pmd);
         |                ~~~~~~~~~~~~~~~~~~            ^~~
   include/linux/mm.h:2363:14: note: 'vm_normal_page_pmd' declared here
    2363 | struct page *vm_normal_page_pmd(struct vm_area_struct *vma, pmd_t pmd);
         |              ^                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +2945 fs/proc/task_mmu.c

3200a8aaab0c9c Dave Hansen     2011-09-20  2933  
28093f9f34cede Gerald Schaefer 2016-04-28  2934  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
28093f9f34cede Gerald Schaefer 2016-04-28  2935  static struct page *can_gather_numa_stats_pmd(pmd_t pmd,
28093f9f34cede Gerald Schaefer 2016-04-28  2936  					      struct vm_area_struct *vma,
28093f9f34cede Gerald Schaefer 2016-04-28  2937  					      unsigned long addr)
28093f9f34cede Gerald Schaefer 2016-04-28  2938  {
28093f9f34cede Gerald Schaefer 2016-04-28  2939  	struct page *page;
28093f9f34cede Gerald Schaefer 2016-04-28  2940  	int nid;
28093f9f34cede Gerald Schaefer 2016-04-28  2941  
28093f9f34cede Gerald Schaefer 2016-04-28  2942  	if (!pmd_present(pmd))
28093f9f34cede Gerald Schaefer 2016-04-28  2943  		return NULL;
28093f9f34cede Gerald Schaefer 2016-04-28  2944  
28093f9f34cede Gerald Schaefer 2016-04-28 @2945  	page = vm_normal_page_pmd(vma, addr, pmd);
28093f9f34cede Gerald Schaefer 2016-04-28  2946  	if (!page)
28093f9f34cede Gerald Schaefer 2016-04-28  2947  		return NULL;
28093f9f34cede Gerald Schaefer 2016-04-28  2948  
28093f9f34cede Gerald Schaefer 2016-04-28  2949  	if (PageReserved(page))
28093f9f34cede Gerald Schaefer 2016-04-28  2950  		return NULL;
28093f9f34cede Gerald Schaefer 2016-04-28  2951  
28093f9f34cede Gerald Schaefer 2016-04-28  2952  	nid = page_to_nid(page);
28093f9f34cede Gerald Schaefer 2016-04-28  2953  	if (!node_isset(nid, node_states[N_MEMORY]))
28093f9f34cede Gerald Schaefer 2016-04-28  2954  		return NULL;
28093f9f34cede Gerald Schaefer 2016-04-28  2955  
28093f9f34cede Gerald Schaefer 2016-04-28  2956  	return page;
28093f9f34cede Gerald Schaefer 2016-04-28  2957  }
28093f9f34cede Gerald Schaefer 2016-04-28  2958  #endif
28093f9f34cede Gerald Schaefer 2016-04-28  2959  

:::::: The code at line 2945 was first introduced by commit
:::::: 28093f9f34cedeaea0f481c58446d9dac6dd620f numa: fix /proc/<pid>/numa_maps for THP

:::::: TO: Gerald Schaefer <gerald.schaefer@de.ibm.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
