Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EF136C5A2;
	Tue, 24 Feb 2026 09:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771925183; cv=none; b=mfCcXZu/y8M1Cw4If6xZsVBjUHe6FBtRXADeF2mLjYAnMj+E81fGQD8fKkvYLHsJBZKPp2uhqeWkfPLC4g9TROMlgtGMPdQwCWSyYcpdGV+plQ28HTgGFVLyUMahkv5L0VMOUMZpCdaFpAlOYNm/s7fQ45nAUCnwYhWUVfPQNQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771925183; c=relaxed/simple;
	bh=Rt6Mk8CrHP4L1O8YfekmJEGljXa/OUhgBgzb41x8kNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WSSnypqahJ0u38LljRa4Gt8SsmxZxFThImeqg2qmNwxaplyQ7b60c5VJvS68gAYaPntDbc3x2ryWStyXPnQnIwxCFBHVpz9GWTtCu41+FXEVvJHmG3ZxyPfIsx8fHoQVGLI0CL8f0t6UmU+N1o+h4WSS8GWx5WnS/EPBEsNuUWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UAN3Wcwb; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UAN3Wcwb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771925180; x=1803461180;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rt6Mk8CrHP4L1O8YfekmJEGljXa/OUhgBgzb41x8kNo=;
  b=UAN3Wcwb6DZ6kYlN922SIPVKuigiG0rw2hyGJrF0xxgsPYgZv6x77NxM
   OtcpcRo81ksyE99nqJfhnHnDtKsa3CDUfEhPadhB/iaufZYtMmLZ9v1oE
   2s1v4isUnkBcxOCS4hrqqHWHrPabWTY5AduwK653XcOJD3E78zf8rtpDz
   WNUZKifAcMeqKnNOyPKAO+7xPFwT39F21UWH88WgwxAcuNWBS75u2FF8o
   hrsZmGu/2yy2k4KbK4ukpvTnlm2ZjlccktqKpwbM0iPPqD8Q2iN5Plc3s
   xvMH8am0QO5MarBo5fCYLaTaQYuEBVjuymGcmx8537iLMLZK7kHZ7wjku
   w==;
X-CSE-ConnectionGUID: ONllHIkATreqsvCQtSYCUg==
X-CSE-MsgGUID: Q8R3PJv8S4+Vg5dw0bCA2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73114414"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="73114414"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 01:26:19 -0800
X-CSE-ConnectionGUID: AlSq+6/PSWOfy3LULv5sXw==
X-CSE-MsgGUID: jMnFvff1QcCxqDnlsfzW6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="214686926"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 24 Feb 2026 01:26:18 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuofa-000000001kv-2mCp;
	Tue, 24 Feb 2026 09:25:38 +0000
Date: Tue, 24 Feb 2026 17:25:16 +0800
From: kernel test robot <lkp@intel.com>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/6] mm/page_counter: Introduce tiered memory
 awareness to page_counter
Message-ID: <202602241757.iMuSSiTC-lkp@intel.com>
References: <20260223223830.586018-3-joshua.hahnjy@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223223830.586018-3-joshua.hahnjy@gmail.com>

Hi Joshua,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Joshua-Hahn/mm-memory-tiers-Introduce-tier-aware-memcg-limit-sysfs/20260224-122156
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260223223830.586018-3-joshua.hahnjy%40gmail.com
patch subject: [RFC PATCH 2/6] mm/page_counter: Introduce tiered memory awareness to page_counter
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260224/202602241757.iMuSSiTC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602241757.iMuSSiTC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602241757.iMuSSiTC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/hugetlb_cgroup.c:739:18: warning: implicit conversion from 'unsigned long' to 'unsigned int' changes value from 4579131496 to 284164200 [-Wconstant-conversion]
     736 |         {
         |         ~
     737 |                 .name = "events.local",
     738 |                 .seq_show = hugetlb_events_local_show,
     739 |                 .file_offset = MEMFILE_OFFSET(struct hugetlb_cgroup, events_local_file[0]),
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb_cgroup.c:24:57: note: expanded from macro 'MEMFILE_OFFSET'
      24 | #define MEMFILE_OFFSET(t, m0)   (((offsetof(t, m0) << 16) | sizeof_field(t, m0)))
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb_cgroup.c:733:18: warning: implicit conversion from 'unsigned long' to 'unsigned int' changes value from 4565500008 to 270532712 [-Wconstant-conversion]
     730 |         {
         |         ~
     731 |                 .name = "events",
     732 |                 .seq_show = hugetlb_events_show,
     733 |                 .file_offset = MEMFILE_OFFSET(struct hugetlb_cgroup, events_file[0]),
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/hugetlb_cgroup.c:24:57: note: expanded from macro 'MEMFILE_OFFSET'
      24 | #define MEMFILE_OFFSET(t, m0)   (((offsetof(t, m0) << 16) | sizeof_field(t, m0)))
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +739 mm/hugetlb_cgroup.c

faced7e0806cf4 Giuseppe Scrivano 2019-12-16  702  
47179fe03588ca Xiu Jianfeng      2024-06-12  703  static struct cftype hugetlb_dfl_tmpl[] = {
47179fe03588ca Xiu Jianfeng      2024-06-12  704  	{
47179fe03588ca Xiu Jianfeng      2024-06-12  705  		.name = "max",
47179fe03588ca Xiu Jianfeng      2024-06-12  706  		.private = RES_LIMIT,
47179fe03588ca Xiu Jianfeng      2024-06-12  707  		.seq_show = hugetlb_cgroup_read_u64_max,
47179fe03588ca Xiu Jianfeng      2024-06-12  708  		.write = hugetlb_cgroup_write_dfl,
47179fe03588ca Xiu Jianfeng      2024-06-12  709  		.flags = CFTYPE_NOT_ON_ROOT,
47179fe03588ca Xiu Jianfeng      2024-06-12  710  	},
47179fe03588ca Xiu Jianfeng      2024-06-12  711  	{
47179fe03588ca Xiu Jianfeng      2024-06-12  712  		.name = "rsvd.max",
47179fe03588ca Xiu Jianfeng      2024-06-12  713  		.private = RES_RSVD_LIMIT,
47179fe03588ca Xiu Jianfeng      2024-06-12  714  		.seq_show = hugetlb_cgroup_read_u64_max,
47179fe03588ca Xiu Jianfeng      2024-06-12  715  		.write = hugetlb_cgroup_write_dfl,
47179fe03588ca Xiu Jianfeng      2024-06-12  716  		.flags = CFTYPE_NOT_ON_ROOT,
47179fe03588ca Xiu Jianfeng      2024-06-12  717  	},
47179fe03588ca Xiu Jianfeng      2024-06-12  718  	{
47179fe03588ca Xiu Jianfeng      2024-06-12  719  		.name = "current",
47179fe03588ca Xiu Jianfeng      2024-06-12  720  		.private = RES_USAGE,
47179fe03588ca Xiu Jianfeng      2024-06-12  721  		.seq_show = hugetlb_cgroup_read_u64_max,
47179fe03588ca Xiu Jianfeng      2024-06-12  722  		.flags = CFTYPE_NOT_ON_ROOT,
47179fe03588ca Xiu Jianfeng      2024-06-12  723  	},
47179fe03588ca Xiu Jianfeng      2024-06-12  724  	{
47179fe03588ca Xiu Jianfeng      2024-06-12  725  		.name = "rsvd.current",
47179fe03588ca Xiu Jianfeng      2024-06-12  726  		.private = RES_RSVD_USAGE,
47179fe03588ca Xiu Jianfeng      2024-06-12  727  		.seq_show = hugetlb_cgroup_read_u64_max,
47179fe03588ca Xiu Jianfeng      2024-06-12  728  		.flags = CFTYPE_NOT_ON_ROOT,
47179fe03588ca Xiu Jianfeng      2024-06-12  729  	},
47179fe03588ca Xiu Jianfeng      2024-06-12  730  	{
47179fe03588ca Xiu Jianfeng      2024-06-12  731  		.name = "events",
47179fe03588ca Xiu Jianfeng      2024-06-12  732  		.seq_show = hugetlb_events_show,
47179fe03588ca Xiu Jianfeng      2024-06-12  733  		.file_offset = MEMFILE_OFFSET(struct hugetlb_cgroup, events_file[0]),
47179fe03588ca Xiu Jianfeng      2024-06-12  734  		.flags = CFTYPE_NOT_ON_ROOT,
47179fe03588ca Xiu Jianfeng      2024-06-12  735  	},
47179fe03588ca Xiu Jianfeng      2024-06-12  736  	{
47179fe03588ca Xiu Jianfeng      2024-06-12  737  		.name = "events.local",
47179fe03588ca Xiu Jianfeng      2024-06-12  738  		.seq_show = hugetlb_events_local_show,
47179fe03588ca Xiu Jianfeng      2024-06-12 @739  		.file_offset = MEMFILE_OFFSET(struct hugetlb_cgroup, events_local_file[0]),
47179fe03588ca Xiu Jianfeng      2024-06-12  740  		.flags = CFTYPE_NOT_ON_ROOT,
47179fe03588ca Xiu Jianfeng      2024-06-12  741  	},
47179fe03588ca Xiu Jianfeng      2024-06-12  742  	{
47179fe03588ca Xiu Jianfeng      2024-06-12  743  		.name = "numa_stat",
47179fe03588ca Xiu Jianfeng      2024-06-12  744  		.seq_show = hugetlb_cgroup_read_numa_stat,
47179fe03588ca Xiu Jianfeng      2024-06-12  745  		.flags = CFTYPE_NOT_ON_ROOT,
47179fe03588ca Xiu Jianfeng      2024-06-12  746  	},
47179fe03588ca Xiu Jianfeng      2024-06-12  747  	/* don't need terminator here */
47179fe03588ca Xiu Jianfeng      2024-06-12  748  };
47179fe03588ca Xiu Jianfeng      2024-06-12  749  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
