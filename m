Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5A1500963;
	Sat, 10 Jan 2026 16:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768062730; cv=none; b=sxf/AlSnWXfLye5PMqluu17HNmqpNYNU4HPMVutbAsiD/f/iP1C6iEapQAYn80fGixGcnLXJWeGAJaXQhn/WRYiKLjxwqniyJLDAO+xZ/mzBXUAgqM5mkJEFD/URUMAXeWqkfrn+LK2NjAxUwGwX36vU5rdaDzBWPS6XXkGSbBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768062730; c=relaxed/simple;
	bh=/DEeUwzte8cJg7Saq52kWbsMHsLc0XiicOAZR5lQblI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GxmGY2DjKtlhsbxK8gwPlvUlATjALfu0x7I/2HShDwpEwJXtE7DGry7Sksghcewj6mDl59qWO1osAzNqC/45DvhkRrhvLxWWYGm1bPQ7sYeqQdQAuqUOohVBrVBMRwfSgKYPAt5EcFlMKH9RO+ivaGBCAAqpBWd+Cek7EU/u3qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D5hn4//b; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D5hn4//b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768062729; x=1799598729;
  h=date:from:to:cc:subject:message-id;
  bh=/DEeUwzte8cJg7Saq52kWbsMHsLc0XiicOAZR5lQblI=;
  b=D5hn4//bU6+pnfVq8tkn7NK/8wK5ei5j8z4rV3D1ivlQkoOiGbxVsXSy
   BaZKLktOmjiHsBKanFWah0W97iG6Y/yqvfKrqN7D3n+7QVUUiZczGwdbE
   h/wcNf8dWw5NJAIE6mTVWbiRWy+QIGlvR1kpIU89258qGz/JdOe+79K63
   zmqAvjeDeiYFpcIzaJeLKKgA6tnJzSISu9opK5p40H7ZqAHg93vH6f9Hv
   Wb1hIy6ahYK062Fs2kYz8KQMIiFA+Bb9tByipUUVQLEpjewRtYuFp8lfp
   6s855jUPSGooCud4IPASiijTnK3pSqk4JVgLQr4ZINqM2is0IZbpeXiK+
   w==;
X-CSE-ConnectionGUID: +5NNTNkoRC2C5VUaKEKcLQ==
X-CSE-MsgGUID: BZux2CRuSNCA4d3k+cWtBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="79705059"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="79705059"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 08:32:09 -0800
X-CSE-ConnectionGUID: LMb933MeTNC9p5YnIqnk0w==
X-CSE-MsgGUID: 4Jx0ElecQ2KBck1NOPAemg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jan 2026 08:32:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vebsi-000000008rG-27M7;
	Sat, 10 Jan 2026 16:32:04 +0000
Date: Sun, 11 Jan 2026 00:31:55 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [chao:bugfix/common 7/7] fs/f2fs/data.c:2647:22: error: use
 of undeclared identifier 'next_pgofs'
Message-ID: <202601110035.XzgqZYN5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   261bd0007c481171f11979ad38d62af7725d56df
commit: 261bd0007c481171f11979ad38d62af7725d56df [7/7] f2fs: avoid f2fs_map_blocks() for hole in readpages
config: i386-randconfig-011-20260110 (https://download.01.org/0day-ci/archive/20260111/202601110035.XzgqZYN5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260111/202601110035.XzgqZYN5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601110035.XzgqZYN5-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/f2fs/data.c:1274:24: warning: unused variable 'mapping' [-Wunused-variable]
    1274 |         struct address_space *mapping = inode->i_mapping;
         |                               ^~~~~~~
>> fs/f2fs/data.c:2647:22: error: use of undeclared identifier 'next_pgofs'
    2647 |         map.m_next_pgofs = &next_pgofs;
         |                             ^
   1 warning and 1 error generated.


vim +/next_pgofs +2647 fs/f2fs/data.c

  2642	
  2643		map.m_pblk = 0;
  2644		map.m_lblk = 0;
  2645		map.m_len = 0;
  2646		map.m_flags = 0;
> 2647		map.m_next_pgofs = &next_pgofs;
  2648		map.m_next_extent = NULL;
  2649		map.m_seg_type = NO_CHECK_TYPE;
  2650		map.m_may_create = false;
  2651	
  2652		for (; nr_pages; nr_pages--) {
  2653			if (rac) {
  2654				folio = readahead_folio(rac);
  2655				prefetchw(&folio->flags);
  2656			}
  2657	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
