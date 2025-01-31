Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06949EED8;
	Fri, 31 Jan 2025 10:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738318612; cv=none; b=nB/VZzuv6HbeCSmuHfZc4QPYsOqqfHrE/HbI4Bq/h7LQCODuTCGq1kP5C5CC48rt8fOmcbxqV5uz2RYnDM4IBzDeqrS6JRggb2AyQNquqACj0MatXlG6+jk+h73hpjV8/0ILsOeEwquGC/dmEKQfw+kxEJAhTvFTXVfXwKZmdcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738318612; c=relaxed/simple;
	bh=WMz2AZh68I//GTMfw0Y+4+Ty1Gbqw6N7gVo4L9gu5QA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cjAPq2NDvZ6+wmvGNPBeRerh7X1HZYVLMloDHgdBUJhAgBS+XBCYgWHXQwNElYwBDVSiYedaR6BqEwKisKf+aAAxWdboXdRTCjMB2j1yZkL4i7/DycbwyZKnrcJIBoOcD4U0jwMXI4ZSnzP1O9taCrfFBSqwUGZxjEOwWoSnKw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c0s9Q4eW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c0s9Q4eW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738318610; x=1769854610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WMz2AZh68I//GTMfw0Y+4+Ty1Gbqw6N7gVo4L9gu5QA=;
  b=c0s9Q4eWy6/KttLuGhMjuBVvTFS7jE28kbIY7zFOWpqFiUkFg+mQ7kUP
   X3eBYLQUi4i7u3lMmEV04kS+4gvrngcVHvq2JIaBbxyCRUqJBVtXiKEJX
   wENEG47eAL7rE0EM52qmV/y8o+hKe4lrS+++DAzDf29P7WKQiZj87KMdc
   LmoWdeMka2/JSzT+CA8RodgIaozbKAW1R9Wr0191ue+7pzdkt2h2YMOHa
   ZjDN22rgVny21dYB3mZyZvBe/nVVSJChWw1R6tBDbcusMlznXnhPwcPrO
   evhQ2lKZLYsAosbmj1IKUOpjE1VuBxFmD/UFyekZh+RCdwgR0BJ5Dxi5q
   g==;
X-CSE-ConnectionGUID: Hx9w9kRQQo2VgEhYbHJpUg==
X-CSE-MsgGUID: Hi/N8KvJQQKfOPv9EKcvzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="56314001"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="56314001"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 02:16:50 -0800
X-CSE-ConnectionGUID: 6AW2Dwp3QEm3FodTFzC45w==
X-CSE-MsgGUID: bP7g2mRmTMmOfzjik/cO1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132850644"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 Jan 2025 02:16:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdo4r-000mFv-36;
	Fri, 31 Jan 2025 10:16:45 +0000
Date: Fri, 31 Jan 2025 18:16:13 +0800
From: kernel test robot <lkp@intel.com>
To: Frank van der Linden <fvdl@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 69/88] arch/powerpc/mm/init_64.c:390:6: error:
 redefinition of 'register_page_bootmem_memmap'
Message-ID: <202501311826.hU85Yygn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   f5604ad70091eabe663ea7106ced99449d653320
commit: 2acfe4c72e4e3a50a685652d89c927335b90c947 [69/88] mm/bootmem_info: export register_page_bootmem_memmap
config: powerpc64-randconfig-003-20250131 (https://download.01.org/0day-ci/archive/20250131/202501311826.hU85Yygn-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501311826.hU85Yygn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501311826.hU85Yygn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/mm/init_64.c:390:6: error: redefinition of 'register_page_bootmem_memmap'
   void register_page_bootmem_memmap(unsigned long section_nr,
        ^
   include/linux/bootmem_info.h:63:20: note: previous definition is here
   static inline void register_page_bootmem_memmap(unsigned long section_nr,
                      ^
   1 error generated.


vim +/register_page_bootmem_memmap +390 arch/powerpc/mm/init_64.c

368a0590d954a6 Aneesh Kumar K.V       2023-07-25  388  
71b0bfe4f1608d Li Zhong               2014-06-11  389  #endif
f7e3334a6bcb42 Nathan Fontenot        2013-09-27 @390  void register_page_bootmem_memmap(unsigned long section_nr,
f7e3334a6bcb42 Nathan Fontenot        2013-09-27  391  				  struct page *start_page, unsigned long size)
f7e3334a6bcb42 Nathan Fontenot        2013-09-27  392  {
f7e3334a6bcb42 Nathan Fontenot        2013-09-27  393  }
cd3db0c4ca3d23 Benjamin Herrenschmidt 2010-07-06  394  

:::::: The code at line 390 was first introduced by commit
:::::: f7e3334a6bcb42e7295a9bd9cb36ca4e6e4e66b4 powerpc: Fix memory hotplug with sparse vmemmap

:::::: TO: Nathan Fontenot <nfont@linux.vnet.ibm.com>
:::::: CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
