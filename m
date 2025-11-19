Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7103625C6EE;
	Wed, 19 Nov 2025 21:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763587605; cv=none; b=uLQPDwthFSGdqfJkHIfNtVsctgoQ3lHGIWg0ch9RRJ4W/Ph1puP21ngFfuTMEx/zeaZ36dRdSS8onfY/iN/F1YWvGiFJRGWyejtEh/AjNfUEzkpBJ3KGAGGzFORmoqb8h52bSIpikoI1AOHY+pIcmCUsLshllFqsMn8tlzraxAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763587605; c=relaxed/simple;
	bh=VXpb8c6Eyu0LfzAhaSbbq/3u6RZ8AeVIN2gukefPNcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I9QzxC7+WdcnrZSiU2vqEJ069NP4YlO0pXpRXG5H0TWHu1mKbDmIay7WKoF2j/riklrWIUT8y/HHuEheXHVdsLDboBNNISjHvJ8kwKWa0oXwdT2daaI6e+qhTK4U4KnQOJ8WwmqX2RTqaa6eiX2jv/s1aaMkOjg7kn/bYKSv9PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hoOglBXt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hoOglBXt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763587604; x=1795123604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VXpb8c6Eyu0LfzAhaSbbq/3u6RZ8AeVIN2gukefPNcU=;
  b=hoOglBXtGOkmRXpfMrR0iffGYSDdUxxlUTB1VUjbDnpBGuW6ZpHi9AaV
   V2L5lSwSKNYkJhYUFOFjT3bLYiMluTDfR+NBNvncnwGVepI+qTmRHMjos
   o5BjH9EjCwWGqiTYiblc5aoF9u88zCOYzHYf+J1mLVA5ju1QDWB2uJHzE
   ck5E6JqlHxfs8YvU3AfJ5GUngulkO9OWwQXrPw/xq2eAcomlmGCJ02nyW
   b4gYKBY93Z9oUAeXHKrEsSJgHHfo2QuEPtSz5KCvjyd0klpBuguXQD2oM
   vuua7jmbAIsGitVW3ZHIL+zqMiQ6i2ejrdmF2eGb2/chRsWtURsHf+jDE
   A==;
X-CSE-ConnectionGUID: U74kVOmwSYSHZI9NAR127Q==
X-CSE-MsgGUID: BvEbItiDRRGXhQrun0N9NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="88302639"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="88302639"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 13:26:44 -0800
X-CSE-ConnectionGUID: jeeDDt4ZQMux4XyBKTBL3g==
X-CSE-MsgGUID: VR3E+WemQ9aDrw18UJDh4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="191198315"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Nov 2025 13:26:42 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLphH-0003L5-0P;
	Wed, 19 Nov 2025 21:26:39 +0000
Date: Thu, 20 Nov 2025 05:26:38 +0800
From: kernel test robot <lkp@intel.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 169/175] ld.lld: error: undefined symbol:
 shmem_uncharge
Message-ID: <202511200534.o4hsMNEt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   102494e6776f316b6cf2924976681d790f278cf1
commit: 9a655bd0773b41af6d8515502de102544f3ec4c1 [169/175] mm-huge_memoryc-introduce-folio_split_unmapped-v2
config: i386-buildonly-randconfig-002-20251119 (https://download.01.org/0day-ci/archive/20251120/202511200534.o4hsMNEt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200534.o4hsMNEt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511200534.o4hsMNEt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: shmem_uncharge
   >>> referenced by huge_memory.c:4053 (mm/huge_memory.c:4053)
   >>>               mm/huge_memory.o:(__folio_split) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
