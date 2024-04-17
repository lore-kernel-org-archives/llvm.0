Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC3E3F9F9;
	Wed, 17 Apr 2024 10:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713348133; cv=none; b=AfwVBOpmxmquLAsmdTMs97h6+Mnnl9of/9xeDOldCAr47SHX07sYpJGqmByiZyUtMkgA5MjBCFHQRZcqTQoezk4AhYz2gBAHO+EdDTeZFTEnZN1PzVWCoyDnVWNpPbgccsk0STm38d+xwSReF4puRTln4aaDwGgpR/pXVdK6E0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713348133; c=relaxed/simple;
	bh=xCQgWQdTgjZl1sUVHcCHGVcoPeEASo2tQXOurY7InsU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XqFqNsSPMOlP9gfigASk0wWiCQ28WqXZicJsWO5IaN2+ghnK9kTF87fqEoZYZziMwPefhJhG3EJMgyA1bA+Y2+e/QUW1h11cZVSprAyTOw4R5uwxtlC6N6uIFun4PXJ+h6GemSR+YB6WRt6X7iBuKzig7Nu23fwSvn8p/FQftDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ur3NmyUJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ur3NmyUJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713348126; x=1744884126;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xCQgWQdTgjZl1sUVHcCHGVcoPeEASo2tQXOurY7InsU=;
  b=Ur3NmyUJ9cbDniKip54kd2Fs2W/Ag+RA3yTsBnRTS1N3OpdAE+0MsPin
   Mds4m2n1C71A/XF5+JGUO7v8fVFxqYRpbwVXT0oODkn3S9cKCAN8ptzgx
   OLNEcNY/DiI6oQG8arGkSQTECPoHUwx6mcRq9L3Hu5LlRVS5raDgttG1S
   X4x8EZ06QstRsF0SkhOLBUh56zJiSYEvIbjFzWupr8CWFVFg7Y2obylBI
   GTubMPeHroTD9aAuxU/xW8+YOOM9tYf9t84shAWzpTeFLnNWfsUQj8e1M
   i1YG+qexNTfywEvMD+e2K8GtGWahza4DrQu1VRbEr0KepipGRxdUDURSm
   Q==;
X-CSE-ConnectionGUID: BFPhppwNT+qXy3BZO4jVsQ==
X-CSE-MsgGUID: ISpap3J0T0mc+nlvw0UtlQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19977836"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="19977836"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 03:02:03 -0700
X-CSE-ConnectionGUID: Qc72Kbk0Sa6CjxnBCiUDeA==
X-CSE-MsgGUID: 8BqYGuMJS2CmkW62H/e6UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="27013467"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 17 Apr 2024 03:02:01 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rx275-0006SZ-19;
	Wed, 17 Apr 2024 10:01:59 +0000
Date: Wed, 17 Apr 2024 18:01:50 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Xu <peterx@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 6398/6705] mm/page_table_check.c:192:17: error:
 use of undeclared identifier 'SWP_DEVICE_EXCLUSIVE_WRITE'
Message-ID: <202404171743.hfpScOdv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4eab358930711bbeb85bf5ee267d0d42d3394c2c
commit: 62754e4df9e04c4576e989f5ea2b909e824d8164 [6398/6705] mm/page_table_check: support userfault wr-protect entries
config: arm64-randconfig-002-20240417 (https://download.01.org/0day-ci/archive/20240417/202404171743.hfpScOdv-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404171743.hfpScOdv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404171743.hfpScOdv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/page_table_check.c:8:
   In file included from include/linux/mm.h:2254:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> mm/page_table_check.c:192:17: error: use of undeclared identifier 'SWP_DEVICE_EXCLUSIVE_WRITE'
     192 |         return type == SWP_DEVICE_EXCLUSIVE_WRITE ||
         |                        ^
   1 warning and 1 error generated.


vim +/SWP_DEVICE_EXCLUSIVE_WRITE +192 mm/page_table_check.c

   186	
   187	/* Whether the swap entry cached writable information */
   188	static inline bool swap_cached_writable(swp_entry_t entry)
   189	{
   190		unsigned type = swp_type(entry);
   191	
 > 192		return type == SWP_DEVICE_EXCLUSIVE_WRITE ||
   193		    type == SWP_MIGRATION_WRITE;
   194	}
   195	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
