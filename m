Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646F82C6A4;
	Sat, 17 Feb 2024 13:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708175888; cv=none; b=iO67EBWO6KJCfS9C1QgEwOYECOWTzX1RtKv2O1a1JqDxOQHLUttFtWdcdvQYoa2jTD2ArdJNFids1cXbGWBavuZPgrIqicl19/AN5324Tnv7uwcbqwxc7J48jCAZQKbL9YcpGM8XYoAqGatRarKg65eJmj1IlxrOpoFIOxwhINo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708175888; c=relaxed/simple;
	bh=4oM+VVwcRaPugThV+ZldUxgA9FOz49VXrMX/eIDPPq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qJ786c3geYYWnulICiU8nb2U3Q6hgfA8lZc6vD9DCBakblR9Zpig81Z3csSQflExn0wA255wRk69XvCQsewPnbf5f3V3V2+66tmX0YLL/0RPJhN2KJrq8y+rtm6uXgble2ZoCnw7zBudOJPKLwJvyxmYTiG+pZYCJSVifKC8LIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ERmvG3lB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERmvG3lB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708175886; x=1739711886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4oM+VVwcRaPugThV+ZldUxgA9FOz49VXrMX/eIDPPq0=;
  b=ERmvG3lBBxBgWoEELeH7+w+jEiD40Ig8Wm2nLXDwOKZuVHRbkr1OOb63
   xYtZxtPs55yEUb5nvyYeQDduqJ9z41/aWqJrc/biJVUOZNYgvfZQV08Qs
   9FZYCFGP/xAUlgBVlIJPgQdxmxh2j1QnL2ig9ti7WXlRe3VjjmeHxI0ez
   E6jvllMFcMF8m9ZLkGwBelclNDj7u6+xqG5a8CeM+CQtpiq1f+MTuIEjC
   8pZehKrnWzJP448jY+6Q0n3akinrZTXfqxsZimOKVZnYloqjvMUajmuTt
   3bP0+bGm5U8wkZJD9bsRxljyAQP0qNtOlZsMRi1+WG2r2LnkWvPqRbGIb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="6126858"
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="6126858"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2024 05:18:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,166,1705392000"; 
   d="scan'208";a="4055398"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 17 Feb 2024 05:18:03 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbKZm-00027w-1P;
	Sat, 17 Feb 2024 13:17:57 +0000
Date: Sat, 17 Feb 2024 21:16:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Suren Baghdasaryan <surenb@google.com>
Subject: [surenbaghdasaryan:memalloc_prof_v4 30/37] mm/nommu.c:260: warning:
 expecting prototype for vmalloc_node(). Prototype was for
 vmalloc_node_noprof() instead
Message-ID: <202402172155.QMan8AdY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/surenbaghdasaryan/linux.git memalloc_prof_v4
head:   23633d13a520a9f34caf0f1a13820660b95406b5
commit: 6720e180dd2c9151eec11e2d63bb2408cf2184b4 [30/37] mm: vmalloc: Enable memory allocation profiling
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240217/202402172155.QMan8AdY-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240217/202402172155.QMan8AdY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402172155.QMan8AdY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/nommu.c:260: warning: expecting prototype for vmalloc_node(). Prototype was for vmalloc_node_noprof() instead
>> mm/nommu.c:278: warning: expecting prototype for vzalloc_node(). Prototype was for vzalloc_node_noprof() instead


vim +260 mm/nommu.c

e1ca7788dec677 Dave Young      2010-10-26  247  
e1ca7788dec677 Dave Young      2010-10-26  248  /**
e1ca7788dec677 Dave Young      2010-10-26  249   * vmalloc_node - allocate memory on a specific node
e1ca7788dec677 Dave Young      2010-10-26  250   * @size:	allocation size
e1ca7788dec677 Dave Young      2010-10-26  251   * @node:	numa node
e1ca7788dec677 Dave Young      2010-10-26  252   *
e1ca7788dec677 Dave Young      2010-10-26  253   * Allocate enough pages to cover @size from the page level
e1ca7788dec677 Dave Young      2010-10-26  254   * allocator and map them into contiguous kernel virtual space.
e1ca7788dec677 Dave Young      2010-10-26  255   *
e1ca7788dec677 Dave Young      2010-10-26  256   * For tight control over page level allocator and protection flags
e1ca7788dec677 Dave Young      2010-10-26  257   * use __vmalloc() instead.
e1ca7788dec677 Dave Young      2010-10-26  258   */
6720e180dd2c91 Kent Overstreet 2023-07-09  259  void *vmalloc_node_noprof(unsigned long size, int node)
f61388822a6040 Andrew Morton   2006-02-28 @260  {
6720e180dd2c91 Kent Overstreet 2023-07-09  261  	return vmalloc_noprof(size);
f61388822a6040 Andrew Morton   2006-02-28  262  }
6720e180dd2c91 Kent Overstreet 2023-07-09  263  EXPORT_SYMBOL(vmalloc_node_noprof);
e1ca7788dec677 Dave Young      2010-10-26  264  
e1ca7788dec677 Dave Young      2010-10-26  265  /**
e1ca7788dec677 Dave Young      2010-10-26  266   * vzalloc_node - allocate memory on a specific node with zero fill
e1ca7788dec677 Dave Young      2010-10-26  267   * @size:	allocation size
e1ca7788dec677 Dave Young      2010-10-26  268   * @node:	numa node
e1ca7788dec677 Dave Young      2010-10-26  269   *
e1ca7788dec677 Dave Young      2010-10-26  270   * Allocate enough pages to cover @size from the page level
e1ca7788dec677 Dave Young      2010-10-26  271   * allocator and map them into contiguous kernel virtual space.
e1ca7788dec677 Dave Young      2010-10-26  272   * The memory allocated is set to zero.
e1ca7788dec677 Dave Young      2010-10-26  273   *
e1ca7788dec677 Dave Young      2010-10-26  274   * For tight control over page level allocator and protection flags
e1ca7788dec677 Dave Young      2010-10-26  275   * use __vmalloc() instead.
e1ca7788dec677 Dave Young      2010-10-26  276   */
6720e180dd2c91 Kent Overstreet 2023-07-09  277  void *vzalloc_node_noprof(unsigned long size, int node)
e1ca7788dec677 Dave Young      2010-10-26 @278  {
6720e180dd2c91 Kent Overstreet 2023-07-09  279  	return vzalloc_noprof(size);
e1ca7788dec677 Dave Young      2010-10-26  280  }
6720e180dd2c91 Kent Overstreet 2023-07-09  281  EXPORT_SYMBOL(vzalloc_node_noprof);
^1da177e4c3f41 Linus Torvalds  2005-04-16  282  

:::::: The code at line 260 was first introduced by commit
:::::: f61388822a6040ff462c5f7260daa0f1017f2db0 [PATCH] nommu: implement vmalloc_node()

:::::: TO: Andrew Morton <akpm@osdl.org>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
