Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2936215711;
	Fri, 20 Dec 2024 13:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734700236; cv=none; b=iwA73IxkBfFPlZtIDKfMPebq3L48P9NrnwntCNc5iRPOVQi3+nbAYhPJp2uKB+fzQRkHzzoqB74OC2vnERy3uAETNOZ+EOdKsOHfI+rk8uQwIW7A5lnxSJWYAxF8qv5MbIvdmz/R9ZjML/1EOvy1slxFXsu1mvNCFQwNe3ypcTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734700236; c=relaxed/simple;
	bh=9tfqMRRr/14ylRJVnXmikiBT0Y1tNBBBRg53lA/Cil8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CuiLMOgDIV0q0dRdMdnfol5yX765H3MSdvyoRDk7UbuO//btXMKQdkxu3kbNtESD7tR/Y+55D98KSQqgaSvZBhYak4lfM0txgfrG9kqDlUXVrIqL0rLz1HpVLLUZBCVWY+/SnC5nEnPcCzovjka6wTs8kRO5HIag2wmAhNANZEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJkR9Fff; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJkR9Fff"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734700235; x=1766236235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9tfqMRRr/14ylRJVnXmikiBT0Y1tNBBBRg53lA/Cil8=;
  b=ZJkR9FffwiBl4Brd4mthFEZpHkrhKhNNUF3yE3gXvxKe0hz8rkekdMvk
   u6UGOiCkd/gsnQV/KDhlG7crylcfJ/6eYXeSEJz0ZAUAdlpqONwEk519u
   xA0zTG+x8X6fYbCmHNH0AVQOyWztMrRCmA1fxAPnCLiTvjElh+Yp+tpVQ
   4or4vpCn08vN84yjVEhLdHr1xjHUx7189TNiBa9GbDvjEZNNqKksJjgTM
   nHiVqsPGNnsOm7uM5iDtcadczVSoCgWMBHRyzjYASAiRFEYfCnm/5hZgL
   flftUUwPrrQUbqj8gpk8JXfs6eJqsIhc0fMlAhhmupdVfyrEUqypBlxge
   w==;
X-CSE-ConnectionGUID: CABysMa/Qnm8QQYx3yIjJQ==
X-CSE-MsgGUID: xoKhLJuYQ2iK1UK9HBa0EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35369752"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="35369752"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 05:10:25 -0800
X-CSE-ConnectionGUID: y9kGpgOPQxmRNQedtW43YA==
X-CSE-MsgGUID: FHrmnFK/QWGpPAhyOVdzTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="98292457"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2024 05:10:23 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOclo-0001AJ-2o;
	Fri, 20 Dec 2024 13:10:20 +0000
Date: Fri, 20 Dec 2024 21:09:37 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lee <chullee@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [jaegeuk-f2fs:dev-test 15/15] fs/f2fs/dir.c:339:1: warning: unused
 label 'start_find_entry'
Message-ID: <202412202144.aEypgoBo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   3f1a145b84bcf0fae986212590bfeeaf165d22d6
commit: 3f1a145b84bcf0fae986212590bfeeaf165d22d6 [15/15] f2fs: Introduce linear search for dentries
config: riscv-randconfig-002-20241220 (https://download.01.org/0day-ci/archive/20241220/202412202144.aEypgoBo-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412202144.aEypgoBo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412202144.aEypgoBo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/dir.c:10:
   In file included from include/linux/f2fs_fs.h:11:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/f2fs/dir.c:339:1: warning: unused label 'start_find_entry' [-Wunused-label]
     339 | start_find_entry:
         | ^~~~~~~~~~~~~~~~~
   5 warnings generated.


vim +/start_find_entry +339 fs/f2fs/dir.c

   326	
   327	struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
   328						 const struct f2fs_filename *fname,
   329						 struct page **res_page)
   330	{
   331		unsigned long npages = dir_blocks(dir);
   332		struct f2fs_dir_entry *de = NULL;
   333		unsigned int max_depth;
   334		unsigned int level;
   335		bool use_hash = true;
   336	
   337		*res_page = NULL;
   338	
 > 339	start_find_entry:
   340		if (f2fs_has_inline_dentry(dir)) {
   341			de = f2fs_find_in_inline_dir(dir, fname, res_page, use_hash);
   342			goto out;
   343		}
   344	
   345		if (npages == 0)
   346			goto out;
   347	
   348		max_depth = F2FS_I(dir)->i_current_depth;
   349		if (unlikely(max_depth > MAX_DIR_HASH_DEPTH)) {
   350			f2fs_warn(F2FS_I_SB(dir), "Corrupted max_depth of %lu: %u",
   351				  dir->i_ino, max_depth);
   352			max_depth = MAX_DIR_HASH_DEPTH;
   353			f2fs_i_depth_write(dir, max_depth);
   354		}
   355	
   356		for (level = 0; level < max_depth; level++) {
   357			de = find_in_level(dir, level, fname, res_page, use_hash);
   358			if (de || IS_ERR(*res_page))
   359				break;
   360		}
   361	
   362	out:
   363	#if IS_ENABLED(CONFIG_UNICODE)
   364		if (IS_CASEFOLDED(dir) && !de && use_hash) {
   365			use_hash = false;
   366			goto start_find_entry;
   367		}
   368	#endif
   369		/* This is to increase the speed of f2fs_create */
   370		if (!de)
   371			F2FS_I(dir)->task = current;
   372		return de;
   373	}
   374	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
