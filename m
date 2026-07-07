Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8073EBF36;
	Tue,  7 Jul 2026 16:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443418; cv=none; b=jpkoMNFvIq3tg+w1XibW6BHsCL9UZyFbxIYWL8mCeExIwq515Fz9ffe5wVO3Exori+/Oe6jD6O9l+vm3spKq8ZXnq8/nV7Ii2mkhAyw3dpeUH4gWlj+wbFNLZqb29iBuamv/gZbfGiPBECDUgsUjXCPvz9zILrnhpBOCRthk1Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443418; c=relaxed/simple;
	bh=Tp43atR1+v+XAQVrIzBcRL90shauIV7ycpkoI9vbqp0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u6oBwqAHbk9r0lmyKONWoOtDs0xfh/sLsSZpH6wgfJsd9BSGlbcTal1fzrtIsROfaCYaLdEmUiVrLVJSFV+ib/z2qLW6Z+Pvh9BYndkyp25clC5+GRI7+AtPLB9L6l8eDkvxbusbk3B4yaRIllFp0BDa/y1EO8EYRDz7kn2V1DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MVqsphxJ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MVqsphxJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783443408; x=1814979408;
  h=date:from:to:cc:subject:message-id;
  bh=Tp43atR1+v+XAQVrIzBcRL90shauIV7ycpkoI9vbqp0=;
  b=MVqsphxJ6bZK2skkvwSSuNNM/OyctyTAMhyAihHQFzr4ElB4+ELOPryW
   PVDaiQb27WhYQGob4AF1mvLRUApjyCxTD2Z/9ESrwtfRQ7RcJn9TGXvfd
   7CzpqB2DLuEDlSpgzk/q3A9yEOZqxcdXcbpbZvaIFUA1AW3uNHw3ijH8q
   zZ0LZUasN8LVq8h+SG4ZnqBaBQMQ+F+Z1XAMKMMDlm2nF9VgWIFuTBcw+
   7ZMYOUmPUtPDWvqLs9HQbl5hnFUhiA+7mgTxqIElWOpN7wxZ03WMJIBm1
   /G8iYM6amQ6wYfYzOMaHyS9cmsRliw6DosBZO8WHYwdySbgpqjIe3FODC
   A==;
X-CSE-ConnectionGUID: 2JN0c0z1SI6kleW9qyY5vQ==
X-CSE-MsgGUID: KaaOSxR2QZOyXgBRCImwqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84070063"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84070063"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 09:56:47 -0700
X-CSE-ConnectionGUID: MI9P8if9RzWtd3V9E9DboQ==
X-CSE-MsgGUID: t2RmMr5zTgqFVGmw7MIdyg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 07 Jul 2026 09:56:45 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wh96A-000000002a1-1mGm;
	Tue, 07 Jul 2026 16:56:42 +0000
Date: Tue, 07 Jul 2026 18:56:11 +0200
From: kernel test robot <lkp@intel.com>
To: Baoquan He <baoquan.he@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: mm/swap_state.c:289 function parameter 'zentry' not
 described in '__swap_cache_add_folio'
Message-ID: <202607071858.lCMfGaEb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/mm-swap_table-add-Pointer-type-support-for-zswap-entry-storage/20260707-153818
head:   53c1ba0b41c241d05475b9dc0d9ad4e1274fc024
commit: 53c1ba0b41c241d05475b9dc0d9ad4e1274fc024 mm/zswap, mm/swap_state: replace xarray indexing with swap table lookups
date:   9 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260707/202607071858.lCMfGaEb-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260707/202607071858.lCMfGaEb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607071858.lCMfGaEb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/swap_state.c:289 function parameter 'zentry' not described in '__swap_cache_add_folio'
>> Warning: mm/swap_state.c:579 function parameter 'zentry' not described in 'swap_cache_alloc_folio'
>> Warning: mm/swap_state.c:289 function parameter 'zentry' not described in '__swap_cache_add_folio'
>> Warning: mm/swap_state.c:579 function parameter 'zentry' not described in 'swap_cache_alloc_folio'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
