Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB37A3C2782;
	Mon, 20 Apr 2026 19:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776712599; cv=none; b=ldbn8IyO/n/IV9lmnVE3fvvZZjOgJYYTAWYW4CPW6paGwErYC9Bgt4S8RH4g/LdjybyBNSrfg3rrtjHehGFs/vjh4D9VksyrvmICDY5azSwBxeJadqFj7lguGuTi9BhKNWBVN7LexEuOmtE1RkdJxLDWvp488aPWn70UNGPUz1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776712599; c=relaxed/simple;
	bh=pJteZlGBn4mVAgJ6S6hsjvJMWdOkxn0L4nbZkyFNytw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VZTXzc/66xai0uMrhXIm+279duYadL0KD6eMp5vOSgax+RpExYo438eA9sKDcrlhhuXlsR5Gn2/UJSJzRz+0JpgGSvBb6nDHqqeJJVAO8RS6sHgSsD7S/C6IUCQmkAZ+80SCtCOd0jBAEuQhjdjCN0QWyRub7u0YU+wLsZ5qEsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z9ehWOuF; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z9ehWOuF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776712598; x=1808248598;
  h=date:from:to:cc:subject:message-id;
  bh=pJteZlGBn4mVAgJ6S6hsjvJMWdOkxn0L4nbZkyFNytw=;
  b=Z9ehWOuFf/WQxttGHx0b0WyBw14FXa1hwSEenZ5ABdYc1nG/9dWWxNpI
   hPA4bZIYIP7cxWGuRIJgw04c5sqo1jEGV8hyJxBlnwyEUPEV7xlMluE9K
   nL3slot01zNrQjz2xAiUC//hZOxLrq98DuixUjDhYDvSvUbHdJ1dzocdH
   3OLu1zM+dlv+gzpwo8Q3CCR/sEkdYB+W7bHnDBiBN7mE5tX/96swRM14x
   xvKiJPz4E9SbKpkhoSkopo2t5fFpSrLsbFkBazYs98H6sx75dBLbZzVw3
   Rwxkvro2hqePFe6FKtDVNSR08G0Oyf01dUmgYHDOToDgAdpMsjT6QZCvf
   g==;
X-CSE-ConnectionGUID: psnvVVI5QB29y4laijbomg==
X-CSE-MsgGUID: ll9R+YeKSuKgM1V7oxUfjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88338503"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="88338503"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 12:16:37 -0700
X-CSE-ConnectionGUID: P/uFj4e7QsC0vETOa6jXbw==
X-CSE-MsgGUID: wiZjcAkvTxuK9bX7JsBbOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; 
   d="scan'208";a="235815572"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Apr 2026 12:16:35 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEu6i-000000002ma-3nHS;
	Mon, 20 Apr 2026 19:16:32 +0000
Date: Tue, 21 Apr 2026 03:16:29 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sj:damon/next 156/181] mm/damon/paddr.c:195:7: warning:
 variable 'matched' is used uninitialized whenever 'if' condition is false
Message-ID: <202604210331.wdB3yt0y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   ecd4906478687820c088904becbcf3c80ded7d81
commit: 8c863600a03e3066ce88bf8db48953176befa4c4 [156/181] mm/damon/paddr: do data_attr filtering
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260421/202604210331.wdB3yt0y-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260421/202604210331.wdB3yt0y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604210331.wdB3yt0y-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/damon/paddr.c:195:7: warning: variable 'matched' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     195 |                 if (f->type == DAMON_FILTER_TYPE_ANON) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/paddr.c:203:7: note: uninitialized use occurs here
     203 |                 if (matched)
         |                     ^~~~~~~
   mm/damon/paddr.c:195:3: note: remove the 'if' if its condition is always true
     195 |                 if (f->type == DAMON_FILTER_TYPE_ANON) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/paddr.c:193:15: note: initialize the variable 'matched' to silence this warning
     193 |                 bool matched;
         |                             ^
         |                              = 0
   1 warning generated.


vim +195 mm/damon/paddr.c

   186	
   187	static bool damon_pa_is_attr(phys_addr_t pa, struct damon_data_attr *a)
   188	{
   189		struct damon_filter *f;
   190		bool default_allow = true;
   191	
   192		damon_for_each_filter(f, a) {
   193			bool matched;
   194	
 > 195			if (f->type == DAMON_FILTER_TYPE_ANON) {
   196				struct folio *folio = damon_get_folio(PHYS_PFN(pa));
   197	
   198				if (!folio)
   199					matched = false;
   200				else
   201					matched = folio_test_anon(folio);
   202			}
   203			if (matched)
   204				return f->allow;
   205			default_allow = !f->allow;
   206		}
   207		return default_allow;
   208	}
   209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
