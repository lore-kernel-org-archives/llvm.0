Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD5413F43E;
	Thu, 29 Feb 2024 20:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709238059; cv=none; b=IAUHRdAVVUvNpDMc8vUHDg+vgEUUAkMvUciLzV5kbyObR0PPccDRVIawPGyCQVvob3bUpiamx/Bm7jo1fxiX9DaHRiJJPjkNMaEtX8Q9UoAED043mnZtHihOoQ299ucDiwEnV+i3ufTddx2pnXM/PJw8CVob1GJL/a2Lz4bCKt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709238059; c=relaxed/simple;
	bh=u6qwG+9AXD0w4KENWeTBsdTk6wjwiBTbTgD0lUNfag0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XdTQ8tgEq86r5IDbV03DfJ+CPQSmMytKBR4MboXL05/dOuDFGAxbzHxGu8410Q5yatMCFhnSIh1PEmt3eQ9LmSZ6Z+maVfVRJ3lyMR+4N89tw1JjOW9XOiKTq4bMYPpx5uH41RU3e7orqgfWq2QgzpHEWvQzm8ZKSUcHb18QdLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hanPaR3q; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hanPaR3q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709238056; x=1740774056;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u6qwG+9AXD0w4KENWeTBsdTk6wjwiBTbTgD0lUNfag0=;
  b=hanPaR3qas1HCZ1S30h+I6zHbcQBmxgdHALxYU00GDlcOOkPvscQd7f6
   js8UyhmiUSTjXR7AJTCDlBCtV49u3fDRilPyB4mlIxvp5vB/FioThCZU6
   Uzod1lcoEguQ+bXytTURoO5ElLudC6/R11Yhj25iMduxMeJLnKGouZEot
   d7cbC+8zDk02D62duQ8VwjbdLC25TSl3sZ2QsJS+7a9S3TDCAgw16rOSb
   9Bc/1lnjVh+NVqieRH+AiTtAg2ZcjAjvM4HudxiHAIyVbfQ1vh1kOhPBG
   QRyLSIlmm3Vl4htPk1SuEErW4pAfGJSDGXSIxizKV22Wkw0xs7NBYLGhk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="14378666"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="14378666"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 12:20:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7831502"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 29 Feb 2024 12:20:53 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfmtf-000DGV-0Y;
	Thu, 29 Feb 2024 20:20:51 +0000
Date: Fri, 1 Mar 2024 04:19:56 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [chao:feature/fs_param 1/1] fs/f2fs/super.c:187:1: warning: 'static'
 ignored on this declaration
Message-ID: <202403010439.1bxiDBpy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/fs_param
head:   d4eac172f8f9f4594056366859b67e589e6124c3
commit: d4eac172f8f9f4594056366859b67e589e6124c3 [1/1] [WIP] f2fs: use new fs_context interface
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240301/202403010439.1bxiDBpy-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 325f51237252e6dab8e4e1ea1fa7acbb4faee1cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240301/202403010439.1bxiDBpy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403010439.1bxiDBpy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/super.c:11:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:33:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/f2fs/super.c:187:1: warning: 'static' ignored on this declaration [-Wmissing-declarations]
     187 | static const struct mount_opts {
         | ^
>> fs/f2fs/super.c:187:8: warning: 'const' ignored on this declaration [-Wmissing-declarations]
     187 | static const struct mount_opts {
         |        ^
>> fs/f2fs/super.c:891:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     891 |         case Opt_usrjquota:
         |         ^
   fs/f2fs/super.c:891:2: note: insert '__attribute__((fallthrough));' to silence this warning
     891 |         case Opt_usrjquota:
         |         ^
         |         __attribute__((fallthrough)); 
   fs/f2fs/super.c:891:2: note: insert 'break;' to avoid fall-through
     891 |         case Opt_usrjquota:
         |         ^
         |         break; 
   fs/f2fs/super.c:3973:26: warning: unused variable 'ctx' [-Wunused-variable]
    3973 |         struct f2fs_fs_context *ctx = fc->fs_private;
         |                                 ^~~
   fs/f2fs/super.c:709:13: warning: unused function 'is_compress_extension_exist' [-Wunused-function]
     709 | static bool is_compress_extension_exist(struct f2fs_sb_info *sbi,
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/super.c:770:12: warning: unused function 'f2fs_set_lz4hc_level' [-Wunused-function]
     770 | static int f2fs_set_lz4hc_level(struct f2fs_sb_info *sbi, const char *str)
         |            ^~~~~~~~~~~~~~~~~~~~
   fs/f2fs/super.c:808:12: warning: unused function 'f2fs_set_zstd_level' [-Wunused-function]
     808 | static int f2fs_set_zstd_level(struct f2fs_sb_info *sbi, const char *str)
         |            ^~~~~~~~~~~~~~~~~~~
   12 warnings generated.


vim +/static +187 fs/f2fs/super.c

   186	
 > 187	static const struct mount_opts {
   188		int	token;
   189		int	opt;
   190		int	flags;
   191	};
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
