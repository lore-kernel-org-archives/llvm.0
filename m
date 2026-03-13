Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DC631F987;
	Fri, 13 Mar 2026 07:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773385815; cv=none; b=hlA6g7ocPHsa3A6UprzECikmeqHAUSoHLvzEr2/8HbHcLggNcyEm2x4H/JtQlirxC/5BNiJr5RjzrqVZhSu3wYzPkHYkoJVyRKrGMwYEnbVs4HZhvqEUfY7/wLOERP38MRXLjAWDC6dt7fRdv8jpyTjE1tXEWcAr49NxwqmQw8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773385815; c=relaxed/simple;
	bh=K9C9onH1SJmeehCzVDU2sQYAVPGAVwjR2f/epfxjjeU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jyCNK/AwW4ZgVaXMifmlYlIFUtQUZH4KMEZEfwKZHXwlPtLTYoguz4Y9IjCfbmOUF5bUZ4ZgmMJYD9zy1jgzwa1JDpTdwHdlMwaVWegVdeDMZfd3e8f2CvZXUQx+4SYrWxg5hYBvkn8wGY3LRl0ujTtYwf7u5hvV9BAg0jkwDqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddwYYwso; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddwYYwso"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773385814; x=1804921814;
  h=date:from:to:cc:subject:message-id;
  bh=K9C9onH1SJmeehCzVDU2sQYAVPGAVwjR2f/epfxjjeU=;
  b=ddwYYwsoSFvnknDsVQsp5MXQDxcjUaxNFVeaurN9x0FuxzNh5GyzHY6u
   LUJpCTzYC5NXjzE6rJXdK46zDM8XfF/G25buZlyYT4+oyFRy64PVnvB41
   7m6IHw1RL9oOQJ5Y7N/TZSu0nC3eVO/a1fXilz5hVU5vgmnJdxxXTiKsE
   v21GJ4/r4la0quZ73QRCG4+ykkoeL+0R8pyA9oMwENVtUTQh7Ou7Eqor8
   uuLMYyL29jjNBPhr2zDDttxMFESEVpGnYUptnpSb0ba/nbgtlBAQopdyY
   paQmQpIRKdBr0Rb+jTX2UT859BuJAZSwe8HdmZUyUJ18eb8VXkI1pMKqH
   Q==;
X-CSE-ConnectionGUID: o8h10YfRRVu8xGF1ujNkuw==
X-CSE-MsgGUID: WGDB6zAMTcakZvAedNQDyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85970907"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="85970907"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 00:10:13 -0700
X-CSE-ConnectionGUID: 5gR5qfHxSHyvGJbruiBmVg==
X-CSE-MsgGUID: wmgxwZMvSkaWeCgiB1+NeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="220161113"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 13 Mar 2026 00:10:11 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0wev-000000003dd-0Qml;
	Fri, 13 Mar 2026 07:10:09 +0000
Date: Fri, 13 Mar 2026 08:09:35 +0100
From: kernel test robot <lkp@intel.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linus Walleij <linusw@kernel.org>
Subject: [arm-integrator:b4/aarch64-dynamic-kernel-stacks-v7.0-rc1
 7/13] kernel/fork.c:260:28: error: use of undeclared identifier
 'THREAD_PREALLOC_PAGES'
Message-ID: <202603130843.MyLfc9hR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/aarch64-dynamic-kernel-stacks-v7.0-rc1
head:   3ea8b0381a0759fa0c71abae5274db2414b58e78
commit: d2ee0928bdd182aed09a1eabb9c008eef73bb442 [7/13] fork: Dynamic Kernel Stacks
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260313/202603130843.MyLfc9hR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260313/202603130843.MyLfc9hR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603130843.MyLfc9hR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/fork.c:260:28: error: use of undeclared identifier 'THREAD_PREALLOC_PAGES'
     260 |                         if (vm_area->nr_pages > THREAD_PREALLOC_PAGES)
         |                                                 ^
   1 error generated.


vim +/THREAD_PREALLOC_PAGES +260 kernel/fork.c

   238	
   239	static bool try_release_thread_stack_to_cache(struct vm_struct *vm_area)
   240	{
   241		unsigned int i;
   242		int nid;
   243	
   244		/*
   245		 * Don't cache stacks if any of the pages don't match the local domain, unless
   246		 * there is no local memory to begin with.
   247		 *
   248		 * Note that lack of local memory does not automatically mean it makes no difference
   249		 * performance-wise which other domain backs the stack. In this case we are merely
   250		 * trying to avoid constantly going to vmalloc.
   251		 */
   252		scoped_guard(preempt) {
   253			if (IS_ENABLED(CONFIG_DYNAMIC_STACK)) {
   254				/*
   255				 * If we have faulted in more than the default number of
   256				 * stack pages to a stack, don't re-use it. This makes sure
   257				 * a process never use more than THREAD_PREALLOC_PAGES
   258				 * at the outset.
   259				 */
 > 260				if (vm_area->nr_pages > THREAD_PREALLOC_PAGES)
   261					return false;
   262			}
   263			nid = numa_node_id();
   264			if (node_state(nid, N_MEMORY)) {
   265				for (i = 0; i < vm_area->nr_pages; i++) {
   266					struct page *page = vm_area->pages[i];
   267					if (page_to_nid(page) != nid)
   268						return false;
   269				}
   270			}
   271	
   272			for (i = 0; i < NR_CACHED_STACKS; i++) {
   273				struct vm_struct *tmp = NULL;
   274	
   275				if (this_cpu_try_cmpxchg(cached_stacks[i], &tmp, vm_area))
   276					return true;
   277			}
   278		}
   279		return false;
   280	}
   281	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
