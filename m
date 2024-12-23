Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AA6185935;
	Mon, 23 Dec 2024 17:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734976364; cv=none; b=JI32UFp3hI0kWvbnItq3G2F8X78tyBiA4ed04jZxw8Ltl97P2SMjxgGZDApv4b7dB+7ibp2P4EPnZu0iJStHho/jw3xJEZ5pNt0weVwqjPdZbnREBH6xoaa2in9KcH2oL4IEfxdUcqZh6wyFRq8ptf68tYU5S/6O5gzkeuLEQJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734976364; c=relaxed/simple;
	bh=Ot9zzDeICFThVXo/6TB6cofVI0RmMLsLDYWaDDT8zK0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SBEUHmqLhK0ph3CLq0ti+ZQ8WBzknav6nwwsfQMWS3R1yNf86GqxXftPW+KXSFt0jAAz0ZiN6Mo5YwCiUl1Yx0bHz0V9pJYgbSHACT4LFkOc2fL+HKDPDe1sBfggMh8DYQEs7V1utZwUwTbNOMFHKRsvzbOtfX9EVZn/5t6eHtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=idDEBoH7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="idDEBoH7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734976363; x=1766512363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ot9zzDeICFThVXo/6TB6cofVI0RmMLsLDYWaDDT8zK0=;
  b=idDEBoH79HnRgqupOjILpBxXHwdmm9bmvt6pmACxOjGH34uU+h1qKW7h
   RNJtGVjJ+WuUBZ895gR00mep0bFR1PiWiZqSt7QGemR5vdmWoVuUndX2G
   Tlw08MOQh0+eWPdmdTL/9hW0/UfY8HBXJW6tAcMxOHk/zqlkpbMfEmSZi
   v21XS9Jo/j0dD7MsRuxLEp868ydNNSRbEFgtvD3LVsNGoafOLopDV1aze
   Vp5aFs5EovUcmv69JDOsgLGjYgOzriyS59JQtVcnEu+zHQELp9Wtpbk6M
   54oCiGtWzUkgGbUbx5jbPZJuP3myhcLEke+Ny+vE2BmMMQnBCzh6UBsVW
   Q==;
X-CSE-ConnectionGUID: E1PjGMBfSDqHw7lnP+GJMQ==
X-CSE-MsgGUID: a4txvmm4SEuLwAXmYA8WvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="39223969"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="39223969"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 09:52:42 -0800
X-CSE-ConnectionGUID: HPeKHqJHQYasOwhG3qtnhQ==
X-CSE-MsgGUID: DNc2uUTSQPqwPqUnOWg1Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="99030797"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Dec 2024 09:52:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPmbd-0000Vb-32;
	Mon, 23 Dec 2024 17:52:37 +0000
Date: Tue, 24 Dec 2024 01:52:18 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [chao:wip 21/21] fs/f2fs/segment.c:5541:6: error: call to undeclared
 function 'unlike'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202412240134.aHiPxZST-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
head:   7d46ca6d49d369b6ebaf3d52c23fdf69c7d4cb77
commit: 7d46ca6d49d369b6ebaf3d52c23fdf69c7d4cb77 [21/21] f2fs: fix to avoid return invalid mtime from f2fs_get_section_mtime()
config: arm-randconfig-003-20241223 (https://download.01.org/0day-ci/archive/20241224/202412240134.aHiPxZST-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412240134.aHiPxZST-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412240134.aHiPxZST-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/segment.c:9:
   In file included from include/linux/f2fs_fs.h:11:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/f2fs/segment.c:5541:6: error: call to undeclared function 'unlike'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5541 |         if (unlike(mtime == INVALID_MTIME))
         |             ^
   1 warning and 1 error generated.


vim +/unlike +5541 fs/f2fs/segment.c

  5510	
  5511	unsigned long long f2fs_get_section_mtime(struct f2fs_sb_info *sbi,
  5512		unsigned int segno)
  5513	{
  5514		unsigned int usable_segs_per_sec = f2fs_usable_segs_in_sec(sbi);
  5515		unsigned int secno = 0, start = 0;
  5516		unsigned int total_valid_blocks = 0;
  5517		unsigned long long mtime = 0;
  5518		unsigned int i = 0;
  5519	
  5520		secno = GET_SEC_FROM_SEG(sbi, segno);
  5521		start = GET_SEG_FROM_SEC(sbi, secno);
  5522	
  5523		if (!__is_large_section(sbi)) {
  5524			mtime = get_seg_entry(sbi, start + i)->mtime;
  5525			goto out;
  5526		}
  5527	
  5528		for (i = 0; i < usable_segs_per_sec; i++) {
  5529			/* for large section, only check the mtime of valid segments */
  5530			struct seg_entry *se = get_seg_entry(sbi, start+i);
  5531	
  5532			mtime += se->mtime * se->valid_blocks;
  5533			total_valid_blocks += se->valid_blocks;
  5534		}
  5535	
  5536		if (total_valid_blocks == 0)
  5537			return INVALID_MTIME;
  5538	
  5539		mtime = div_u64(mtime, total_valid_blocks);
  5540	out:
> 5541		if (unlike(mtime == INVALID_MTIME))
  5542			mtime -= 1;
  5543		return mtime;
  5544	}
  5545	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
