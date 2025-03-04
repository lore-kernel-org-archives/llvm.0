Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E1C208995;
	Tue,  4 Mar 2025 14:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741099377; cv=none; b=pkESnm4dRfaATUHvaq9et9asfkzASnkvwAlhc2c+Ik+VjmYzO57QCucTq4Q3V+lYFrQNIAKp2I/dU+e2o8844yaqvfwJNipNBJcm71mnT3VCZ/fQb+lZ3VAAtGBlJ+ynURKxCzvWVfouTh8ZbWp+EsIvfMGx1c4qixlUMQnoRTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741099377; c=relaxed/simple;
	bh=gRluBQCw8unga1kCTYz+MfAptNcCI8wkRy1Nn0OhMqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YJqFYn2GquiXsh/ZPhnDQ+95WSdu3cgT0OBX1I+SMmHAxkNZvmT1plrQTqeKX7AbrSzX0dYHur9R+bWUcXDvlWv+xkPheGE6u6TIZgMmOSZHiK0uSontgq5wREQI6i7LoWFrtVXOD1iObFETNk9CFIqkgbIOvlS2HAYQWyrCNQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RLL+0NFs; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RLL+0NFs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741099375; x=1772635375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gRluBQCw8unga1kCTYz+MfAptNcCI8wkRy1Nn0OhMqQ=;
  b=RLL+0NFsdW4lOO2i1ZsnVwT4HbY71eym0mb//hPvtzvl0YQ23BeiH+xK
   vcIUIibDKTykw7DskS5GJ55dLx9/KbxkBJTDWtZg9CL4BzdlPEFVup1Qg
   53nwxd4pSqYdFZ88Ybet2bBmDArhIlna+7wv0lhhdWDUveJhUrNnNvaS8
   LOyhvcsRQc0QinDRc3P1Kw36p6DwWUCSVT49nBI+iVir+PF12JVWtauTh
   6KWU4Q7yY6lZK5M5IDGQez91OT8oa2fGg1HUwZUzZTFe0a7F04uM+igiH
   cmTwCuzatLJaSfnCVV6L3seSjZ/olC/WqLxL9WqTDojZG8Dr810kjhU8B
   Q==;
X-CSE-ConnectionGUID: ShFS6+G4Q+m9frY0cqMtLA==
X-CSE-MsgGUID: k/nCATJsQ/WVkHw8TiREKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52663635"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="52663635"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 06:42:54 -0800
X-CSE-ConnectionGUID: wzEa3h46QiOZh9RS/N52oA==
X-CSE-MsgGUID: +tTTcLuQSFul0AUvWZl1qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="118396046"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 04 Mar 2025 06:42:53 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpTTv-000Ju0-02;
	Tue, 04 Mar 2025 14:42:51 +0000
Date: Tue, 4 Mar 2025 22:42:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:mm_init/mem_init/v0.1 10/13] arch/s390/mm/init.c:76:15:
 warning: unused variable 'page'
Message-ID: <202503042241.6Jpkxc2E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git mm_init/mem_init/v0.1
head:   55eb95380e481029d5e7b8b442b0fdfbe79a9d3e
commit: 8708f0a685326c02e1927a7a18aa78bd58bef8b1 [10/13] dev: s390: make setup_zero_pages() use memblock
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20250304/202503042241.6Jpkxc2E-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503042241.6Jpkxc2E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503042241.6Jpkxc2E-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/s390/mm/init.c:76:15: warning: unused variable 'page' [-Wunused-variable]
           struct page *page;
                        ^
>> arch/s390/mm/init.c:77:6: warning: unused variable 'i' [-Wunused-variable]
           int i;
               ^
   2 warnings generated.


vim +/page +76 arch/s390/mm/init.c

^1da177e4c3f41 Linus Torvalds            2005-04-16  71  
0999f1193a51de Jiang Liu                 2013-04-29  72  static void __init setup_zero_pages(void)
238ec4efeee446 Martin Schwidefsky        2010-10-25  73  {
cb088e38aab4c7 Wei Yang                  2024-08-08  74  	unsigned long total_pages = memblock_estimated_nr_free_pages();
238ec4efeee446 Martin Schwidefsky        2010-10-25  75  	unsigned int order;
238ec4efeee446 Martin Schwidefsky        2010-10-25 @76  	struct page *page;
238ec4efeee446 Martin Schwidefsky        2010-10-25 @77  	int i;
238ec4efeee446 Martin Schwidefsky        2010-10-25  78  
c7e8b2c21c6a6f Martin Schwidefsky        2015-11-10  79  	/* Latest machines require a mapping granularity of 512KB */
1f6b83e5e4d3ae Martin Schwidefsky        2015-01-14  80  	order = 7;
c7e8b2c21c6a6f Martin Schwidefsky        2015-11-10  81  
7919e91b34316e Martin Schwidefsky        2013-02-28  82  	/* Limit number of empty zero pages for small memory sizes */
37db17c1008c84 Wei Yang                  2024-06-16  83  	while (order > 2 && (total_pages >> 10) < (1UL << order))
1f6b83e5e4d3ae Martin Schwidefsky        2015-01-14  84  		order--;
238ec4efeee446 Martin Schwidefsky        2010-10-25  85  
8708f0a685326c Mike Rapoport (Microsoft  2025-03-03  86) 	empty_zero_page = (unsigned long)memblock_alloc(PAGE_SIZE << order, order);
238ec4efeee446 Martin Schwidefsky        2010-10-25  87  	if (!empty_zero_page)
238ec4efeee446 Martin Schwidefsky        2010-10-25  88  		panic("Out of memory in setup_zero_pages");
238ec4efeee446 Martin Schwidefsky        2010-10-25  89  
0999f1193a51de Jiang Liu                 2013-04-29  90  	zero_page_mask = ((PAGE_SIZE << order) - 1) & PAGE_MASK;
238ec4efeee446 Martin Schwidefsky        2010-10-25  91  }
238ec4efeee446 Martin Schwidefsky        2010-10-25  92  

:::::: The code at line 76 was first introduced by commit
:::::: 238ec4efeee4461d5cff2ed3e5a15a3ab850959b [S390] zero page cache synonyms

:::::: TO: Martin Schwidefsky <schwidefsky@de.ibm.com>
:::::: CC: Martin Schwidefsky <sky@mschwide.boeblingen.de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
