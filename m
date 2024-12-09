Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDCA155C83;
	Mon,  9 Dec 2024 04:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733716809; cv=none; b=eVsegkA78r/h2f+uNSFCew+vuk+wynNaYzQTTVNLwr6TW3CZDhODTwD0NQ2HFZUtX6SFk4hXGfWFurJxqVRJsH+z+VruJmN7BqCctOIBZ/ccRnhZOdFThDBnB+tow+UjUc2Yte1L+iWbPca9MpGQz5Bssv1Zyq91iL+Q0DxLAxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733716809; c=relaxed/simple;
	bh=WNEas8Hd0kCg0TuHhDIksZRzyXXnu3pos7fWYEIX5bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mavWuerPX/UXtnpH9jOblHVBc5xVT3Qh6Aytf4nGowr0mjGiWirEoVd2iBr4+m2YMDVK+uTQMBFpyVEql93N0G50z8P/suSS8dsa2wY5lDOG7vtmvzCtsFTqH5+pV5bqI59NjuObzqt58s19PZwvffTo5fJhehVHa2xaplUEOtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AaXPR2j6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AaXPR2j6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733716807; x=1765252807;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WNEas8Hd0kCg0TuHhDIksZRzyXXnu3pos7fWYEIX5bc=;
  b=AaXPR2j65iTnsBcpiJEQwmg6ZwlxguW4t7AfJZI8rQzw0f+wZqlYZk8M
   4g38vio0VWhp+x8/n8n95QVGZ+iW2ahaoyHGe3KFuXRkcpNvRVdM7p2zC
   S+E/wGgYn1qeC2NmWFOEe7+ZswdAPxAsjRVYZ+OB5UfTGpRD3XMx/yHw6
   t30hMBYRA3zdjPuSHpu7DQ0gHwzdVtSXksLsGtmlLxLSnOrHUUbDL0EL/
   UMbdO4erWrm2tyTQoPWcdwE2p4NQ0d6u/IBdPuQMQFiiR6PtBBs6eJ7hJ
   TIHbNehcFID7GrrvE2wAMVKlZ7aLTsAS3GP6dash3LcpA3FAswW1NQ3K1
   A==;
X-CSE-ConnectionGUID: p6WXgro/QW6FltVFC4c7sQ==
X-CSE-MsgGUID: A9it8Oo1SW2L0CXetLmsgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="21589705"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="21589705"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:00:07 -0800
X-CSE-ConnectionGUID: Gon/eu4CSfC5ALYwPCukZg==
X-CSE-MsgGUID: BL9350XAQGaIfv28LiNq/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="125839273"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Dec 2024 20:00:03 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKUwD-0003ln-1K;
	Mon, 09 Dec 2024 04:00:01 +0000
Date: Mon, 9 Dec 2024 11:59:22 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Muchun Song <muchun.song@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Hugh Dickins <hughd@google.com>, linux-kernel@vger.kernel.org,
	Isaac Manjarres <isaacmanjarres@google.com>,
	Kalesh Singh <kaleshsingh@google.com>
Subject: Re: [PATCH] mm: perform all memfd seal checks in a single place
Message-ID: <202412070908.wNlwD8Sk-lkp@intel.com>
References: <20241206212846.210835-1-lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206212846.210835-1-lorenzo.stoakes@oracle.com>

Hi Lorenzo,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-perform-all-memfd-seal-checks-in-a-single-place/20241207-053020
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241206212846.210835-1-lorenzo.stoakes%40oracle.com
patch subject: [PATCH] mm: perform all memfd seal checks in a single place
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20241207/202412070908.wNlwD8Sk-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070908.wNlwD8Sk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070908.wNlwD8Sk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: memfd_check_seals_mmap
   >>> defined at gup.c
   >>>            mm/gup.o:(memfd_check_seals_mmap) in archive vmlinux.a
   >>> defined at mmap.c
   >>>            mm/mmap.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: memfd_check_seals_mmap
   >>> defined at gup.c
   >>>            mm/gup.o:(memfd_check_seals_mmap) in archive vmlinux.a
   >>> defined at secretmem.c
   >>>            mm/secretmem.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: memfd_check_seals_mmap
   >>> defined at gup.c
   >>>            mm/gup.o:(memfd_check_seals_mmap) in archive vmlinux.a
   >>> defined at fcntl.c
   >>>            fs/fcntl.o:(.text+0x0) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
