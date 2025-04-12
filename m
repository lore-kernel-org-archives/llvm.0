Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3021448E0;
	Sat, 12 Apr 2025 21:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744495031; cv=none; b=mdHoY9W8WxShs5a1s2r5wCmJb21a0tW0sMAdirzjiefQPhRW155E+/FWvpNg6iFTvbVRM5CU07l96IfWEhWdOhIWGNcD2N5iK+AqwGbDBMkcDU+fFO5VRAJY/ZQXj8J7oXxXxJ2HZidqPeEUbPF8HCa7mibxUfcLoUhAaHai4d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744495031; c=relaxed/simple;
	bh=ajLLm6V1nB+iIGXAIwi8kfvmKW1YEqpUd4ICX1M24dM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jBE71ujMOWtPAJz2u4wGHKp/H5QpiUAVHGyWorSBT3qZxIUztHvnXD9uonTZAAWH3vr/mgpqq60Ir7oYXnYuXjUBSQ0kXTnZcpfNFpHUWTHmxMMk4Kzxiv1H4kq8De3Kt4riaGm9Eo40CAoa7muXdDmS0LLjU3K1+rrQ3P54oqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h4gBZ7+S; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h4gBZ7+S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744495029; x=1776031029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ajLLm6V1nB+iIGXAIwi8kfvmKW1YEqpUd4ICX1M24dM=;
  b=h4gBZ7+SAyBmTE8OnCV149qJHFOrZzFhuKiJ6IvvmPyMwRNCAcUmMPQM
   IR1Dspu7cBvZPJdfG8x3Aecepzdvp5rYrBRd7SD7qyCSxGmNGlu9L2UIi
   4vr5fWaQKi9WdnRAPH7uSpEkBHFtx/+3nJ/VdEB3CH0OdgQLnfb1m7R0M
   +0WYEdlgpMCphCwW5l6rHoil4I1vwPrv0S3xza/8NrY4KBe+pkt9Ys2V6
   bHn2A42G2h7oqtRfhza6NJtwMrMfcZjzRbzUiyzqDrrd7OSjsTekJGtYE
   lugyEj1imcW55mdZvqHYVlbSVryy0s4TBNf6W3am2xiL/YGoLh53Vdwkl
   w==;
X-CSE-ConnectionGUID: I/U1gzTNTYSa8iT8oThPVQ==
X-CSE-MsgGUID: OhZ1v6IxToWTF4YmvG6nMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45718463"
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="45718463"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 14:57:08 -0700
X-CSE-ConnectionGUID: xsCuUn9zSW6e3wr7FS89OA==
X-CSE-MsgGUID: C0vBHpXZQ92kr93Wy/cJbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="152676426"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Apr 2025 14:57:07 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3iqX-000C9u-1E;
	Sat, 12 Apr 2025 21:57:05 +0000
Date: Sun, 13 Apr 2025 05:56:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:netns-debugfs 2/3] lib/ref_tracker.c:287:4: warning: format
 specifies type 'int' but the argument has type 'long'
Message-ID: <202504130506.zKFcdjki-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git netns-debugfs
head:   193510c9521581018efe6f51e0aeddbafc8c103e
commit: ada5a12aae58a77a6d3522609df19a7cba6e053b [2/3] ref_tracker: add a top level debugfs directory for ref_tracker
config: arm64-randconfig-004-20250413 (https://download.01.org/0day-ci/archive/20250413/202504130506.zKFcdjki-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504130506.zKFcdjki-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504130506.zKFcdjki-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/ref_tracker.c:287:4: warning: format specifies type 'int' but the argument has type 'long' [-Wformat]
     286 |                 pr_warn("ref_tracker: unable to create ref_tracker debugfs directory: %d\n",
         |                                                                                       ~~
         |                                                                                       %ld
     287 |                         PTR_ERR(ref_tracker_debug_dir));
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:554:37: note: expanded from macro 'pr_warn'
     554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +287 lib/ref_tracker.c

   281	
   282	static int __init ref_tracker_debug_init(void)
   283	{
   284		ref_tracker_debug_dir = debugfs_create_dir("ref_tracker", NULL);
   285		if (IS_ERR(ref_tracker_debug_dir)) {
   286			pr_warn("ref_tracker: unable to create ref_tracker debugfs directory: %d\n",
 > 287				PTR_ERR(ref_tracker_debug_dir));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
