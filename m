Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF2D1667C9;
	Mon, 27 May 2024 22:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716848631; cv=none; b=u4E+Me4HIeviFLtRIZ/v5ljAYojRrlspy1f/Dz8OIdt6RmamyGIeehQWsAtQOJXruNj0xPihiyTF0f5AgLtwSgjRNVrCBd+HTn2jsAw+SmY7NDeQY+PGPUAYpyU45nF+DHU7b3FKbNxUkL9V4cjaKOUak71jY1arWFkBrtiGOWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716848631; c=relaxed/simple;
	bh=GZH377y7yGc5E1Hf3ysl8Uxmrt7q59I5cvxr1o0XHaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eF7a2aaBuGo6Ir7NDCxIfTM5DngNiehft/zuunwvu60GiWPdZ7/g7BaWE+GsifNmcMVPJxJLgmmTwTp3CFBSFBUQgMTBzwAGeJAI1NvjzCPos/iIQllmX2Tyh7qLY1HvEE97nM0nOXsINAdUmm8ja1qI539xEgQ5jfamFMNCJT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UUJvW9Ow; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UUJvW9Ow"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716848630; x=1748384630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GZH377y7yGc5E1Hf3ysl8Uxmrt7q59I5cvxr1o0XHaY=;
  b=UUJvW9OwYezbZz5fTRZgPNxNAvrbKHqc+uWx1RmYJVRSETWyMg9gnym/
   aVuld+ZuALn6I/fOcG1wLDHWc65lHeRV/a0pj6o1ht7fWQELSt4gdteP8
   e37oTchyrz47ZCaU6XG56ygpYOnstsBVv/O5zttopiKFCtdBWDog7XwlP
   pSwLi2u3zzPb2TsH9SldRxegxQqcWqOieMdmkdzlEhl8xR7+zb9DXuyhG
   vnAytM0RTzZa93FKyy5uMCba+AxqkydfOUhPlyGjFz1YzgfjKWT3i/7qJ
   uKgGaqcpY249LRLFGnNr2BSeo6pXdZ1Zu2St5DsZCTKjl6HGrH127tO4x
   Q==;
X-CSE-ConnectionGUID: 7jDKWW8bSbaXR4m17Mcrng==
X-CSE-MsgGUID: UMWcqVt7Qtq5TxSAgUMtwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="16962593"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="16962593"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 15:23:49 -0700
X-CSE-ConnectionGUID: ZjW8H8UHRrSJc9kP9w+icA==
X-CSE-MsgGUID: ri2QSozKSxy0e9YRun+vSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="34760143"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 27 May 2024 15:23:47 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBikr-000B99-0s;
	Mon, 27 May 2024 22:23:45 +0000
Date: Tue, 28 May 2024 06:22:58 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vlastimil Babka <vbabka@suse.cz>
Subject: ld.lld: error: undefined symbol: proc_do_static_key
Message-ID: <202405280616.wcOGWJEj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2bfcfd584ff5ccc8bb7acde19b42570414bf880b
commit: 8d469d0bee74d3f2d02f0b232933a3f084d9cbf7 lib: introduce early boot parameter to avoid page_ext memory overhead
date:   5 weeks ago
config: arm64-randconfig-002-20240528 (https://download.01.org/0day-ci/archive/20240528/202405280616.wcOGWJEj-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405280616.wcOGWJEj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405280616.wcOGWJEj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: proc_do_static_key
   >>> referenced by alloc_tag.c
   >>>               lib/alloc_tag.o:(memory_allocation_profiling_sysctls) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
