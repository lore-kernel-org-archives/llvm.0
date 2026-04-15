Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B04942A80;
	Wed, 15 Apr 2026 00:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776212909; cv=none; b=qZfXdKytXWFBQhKRLB0VjAo+Yv22//Y2yxy6bnSwRhsksYv+IhzeLD2Mgv/xuM2y/q4Ln2EUfdcwzoMfM9jrgi51e5ssj5CxVa8X+CjoXF4wnkeKZeNEH8iKPbN8Gb9ptMg9YNGZSYArTX+A7ztocXnHWy+qHc8Q9e105J3jFAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776212909; c=relaxed/simple;
	bh=6qHIjl1O8jAt7kVac/CbZAb3DjdrN8WLJAUZQIMMWFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DxxTMBf04tIHT9pNJoi6juvphmB5GybgYaeJP9dn430iwRldpP6qnyCPk4ievCrNYNoWyWp1CT/2ERe7ySJfY1GeMP0vJLLw5iaFccA3gkeR1/H9XuLk3DGgrFd5OUYsIo5CLPU3BM4ZZkccXe/m2NvpmuNFa4N7Ih45kA7rTqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mKKVoeSt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mKKVoeSt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776212908; x=1807748908;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6qHIjl1O8jAt7kVac/CbZAb3DjdrN8WLJAUZQIMMWFY=;
  b=mKKVoeStRtyU3ebx0KA8W36/oFAcLO59eIeZjvvvvwhXXC3VNV1JQlpA
   bPMb04ZwDOzWudTvuYClgq1KMmLJn4x66PWYAm8kmtfOB3CdFIvOehc1/
   2xSyeg4nGZsDgIWRciTbx+dPSGF+muk8+m2dpqWk2HOetaYQ6mjzDMMUD
   ya2G5hfy2SEIiXcLET16ZL7C38F0mYyuttmy+9eS/DH1d1YCBbvZfo+99
   LNc72sMa7f2LjK0EKI3cg/bNeuPRP4dYb2YVM39yJVXycMDB5a23DuTGQ
   TqAajw1KuW0tcb4HjMuIeXL9+5To0U1ozTauTGgtdEn439Ih2Us/wjQh1
   A==;
X-CSE-ConnectionGUID: qenSk81lQkKjw3GXaWS/4A==
X-CSE-MsgGUID: lGvntZg9TdWqnXeBxfTkAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="80779745"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="80779745"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 17:28:27 -0700
X-CSE-ConnectionGUID: pv1YhFHyTPi2jlKw00PuVA==
X-CSE-MsgGUID: vp30E1BLR7KBAu3RJOAVWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="230103404"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Apr 2026 17:28:25 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCo7A-00000000217-0hXH;
	Wed, 15 Apr 2026 00:28:20 +0000
Date: Wed, 15 Apr 2026 08:28:15 +0800
From: kernel test robot <lkp@intel.com>
To: Youling Tang <youling.tang@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, youling.tang@linux.dev,
	Youling Tang <tangyouling@kylinos.cn>
Subject: Re: [PATCH] crash: Support high memory reservation for range syntax
Message-ID: <202604150808.7HxFp5b4-lkp@intel.com>
References: <20260404074103.506793-1-youling.tang@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404074103.506793-1-youling.tang@linux.dev>

Hi Youling,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v7.0 next-20260414]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Youling-Tang/crash-Support-high-memory-reservation-for-range-syntax/20260414-205035
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260404074103.506793-1-youling.tang%40linux.dev
patch subject: [PATCH] crash: Support high memory reservation for range syntax
config: loongarch-randconfig-001-20260415 (https://download.01.org/0day-ci/archive/20260415/202604150808.7HxFp5b4-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260415/202604150808.7HxFp5b4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604150808.7HxFp5b4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/crash_reserve.c:264:19: warning: expression which evaluates to zero treated as a null pointer constant of type 'char *' [-Wnon-literal-null-conversion]
     264 |         char *first_gt = false;
         |                          ^~~~~
   1 warning generated.


vim +264 kernel/crash_reserve.c

   254	
   255	/*
   256	 * This function parses command lines in the format
   257	 *
   258	 *   crashkernel=ramsize-range:size[,...][@offset],>boundary
   259	 */
   260	static void __init parse_crashkernel_boundary(char *ck_cmdline,
   261						unsigned long long *boundary)
   262	{
   263		char *cur = ck_cmdline, *next;
 > 264		char *first_gt = false;
   265	
   266		first_gt = strchr(cur, '>');
   267		if (!first_gt)
   268			return;
   269	
   270		cur = first_gt + 1;
   271		if (*cur == '\0' || *cur == ' ' || *cur == ',') {
   272			pr_warn("crashkernel: '>' specified without boundary size, ignoring\n");
   273			return;
   274		}
   275	
   276		*boundary = memparse(cur, &next);
   277		if (cur == next) {
   278			pr_warn("crashkernel: invalid boundary size after '>'\n");
   279			return;
   280		}
   281	}
   282	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
