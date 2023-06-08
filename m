Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB3931F00;
	Thu,  8 Jun 2023 23:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686265610; x=1717801610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w4iphQO2kDqcY7KZI9IUTUwWPw4dllWLRJTEvqf7O3w=;
  b=KUUlGpGRnEgtzAYteKEDYr36Qe8goTJCh+Y3WvEVvhEeI+3hV1nI3B6d
   xwiK1fFY3uKHJHA9DFNH5RG3BmKzx5Xja87YWdJWMprIoA+qSsCJ6c+aG
   i1YiVT70EDCcqfnZNYyA32v8+D5tfSYC+/P7QO4yJ5vf3Ef9i5ytHTOPR
   ntcJHdfQ5d+vSN6GDOoyK9k2FPZuhVQt1h8nC1n9rZFJ82HJYWmIY4fEV
   AlMtlmnmoECetpp2ZNuAsTgmZIhTfFwXSpIwT4YUw9cjdGUOJkvA8ZWcx
   aJCD7TDp8ZiyQIePHUiW1OMzWs4pdCNNPpFWQPsxhrkjDoFWSs2GPXH/v
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="385808382"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="385808382"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2023 16:06:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="687525374"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; 
   d="scan'208";a="687525374"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Jun 2023 16:06:47 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7OiM-0008KU-1M;
	Thu, 08 Jun 2023 23:06:46 +0000
Date: Fri, 9 Jun 2023 07:06:03 +0800
From: kernel test robot <lkp@intel.com>
To: Yangtao Li <frank.li@vivo.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: fs/f2fs/gc.c:744:5: warning: stack frame size (3248) exceeds limit
 (2048) in 'f2fs_get_victim'
Message-ID: <202306090735.vBTMC3us-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   25041a4c02c7cf774d8b6ed60586fd64f1cdaa81
commit: 19e0e21a51183d4e0784602f27e4db7b965077be f2fs: remove struct victim_selection default_v_ops
date:   8 weeks ago
config: riscv-randconfig-r012-20230608 (https://download.01.org/0day-ci/archive/20230609/202306090735.vBTMC3us-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=19e0e21a51183d4e0784602f27e4db7b965077be
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 19e0e21a51183d4e0784602f27e4db7b965077be
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash fs/f2fs/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306090735.vBTMC3us-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/gc.c:744:5: warning: stack frame size (3248) exceeds limit (2048) in 'f2fs_get_victim' [-Wframe-larger-than]
   int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
       ^
   1 warning generated.


vim +/f2fs_get_victim +744 fs/f2fs/gc.c

   735	
   736	/*
   737	 * This function is called from two paths.
   738	 * One is garbage collection and the other is SSR segment selection.
   739	 * When it is called during GC, it just gets a victim segment
   740	 * and it does not remove it from dirty seglist.
   741	 * When it is called from SSR segment selection, it finds a segment
   742	 * which has minimum valid blocks and removes it from dirty seglist.
   743	 */
 > 744	int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
   745				int gc_type, int type, char alloc_mode,
   746				unsigned long long age)
   747	{
   748		struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
   749		struct sit_info *sm = SIT_I(sbi);
   750		struct victim_sel_policy p;
   751		unsigned int secno, last_victim;
   752		unsigned int last_segment;
   753		unsigned int nsearched;
   754		bool is_atgc;
   755		int ret = 0;
   756	
   757		mutex_lock(&dirty_i->seglist_lock);
   758		last_segment = MAIN_SECS(sbi) * sbi->segs_per_sec;
   759	
   760		p.alloc_mode = alloc_mode;
   761		p.age = age;
   762		p.age_threshold = sbi->am.age_threshold;
   763	
   764	retry:
   765		select_policy(sbi, gc_type, type, &p);
   766		p.min_segno = NULL_SEGNO;
   767		p.oldest_age = 0;
   768		p.min_cost = get_max_cost(sbi, &p);
   769	
   770		is_atgc = (p.gc_mode == GC_AT || p.alloc_mode == AT_SSR);
   771		nsearched = 0;
   772	
   773		if (is_atgc)
   774			SIT_I(sbi)->dirty_min_mtime = ULLONG_MAX;
   775	
   776		if (*result != NULL_SEGNO) {
   777			if (!get_valid_blocks(sbi, *result, false)) {
   778				ret = -ENODATA;
   779				goto out;
   780			}
   781	
   782			if (sec_usage_check(sbi, GET_SEC_FROM_SEG(sbi, *result)))
   783				ret = -EBUSY;
   784			else
   785				p.min_segno = *result;
   786			goto out;
   787		}
   788	
   789		ret = -ENODATA;
   790		if (p.max_search == 0)
   791			goto out;
   792	
   793		if (__is_large_section(sbi) && p.alloc_mode == LFS) {
   794			if (sbi->next_victim_seg[BG_GC] != NULL_SEGNO) {
   795				p.min_segno = sbi->next_victim_seg[BG_GC];
   796				*result = p.min_segno;
   797				sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
   798				goto got_result;
   799			}
   800			if (gc_type == FG_GC &&
   801					sbi->next_victim_seg[FG_GC] != NULL_SEGNO) {
   802				p.min_segno = sbi->next_victim_seg[FG_GC];
   803				*result = p.min_segno;
   804				sbi->next_victim_seg[FG_GC] = NULL_SEGNO;
   805				goto got_result;
   806			}
   807		}
   808	
   809		last_victim = sm->last_victim[p.gc_mode];
   810		if (p.alloc_mode == LFS && gc_type == FG_GC) {
   811			p.min_segno = check_bg_victims(sbi);
   812			if (p.min_segno != NULL_SEGNO)
   813				goto got_it;
   814		}
   815	
   816		while (1) {
   817			unsigned long cost, *dirty_bitmap;
   818			unsigned int unit_no, segno;
   819	
   820			dirty_bitmap = p.dirty_bitmap;
   821			unit_no = find_next_bit(dirty_bitmap,
   822					last_segment / p.ofs_unit,
   823					p.offset / p.ofs_unit);
   824			segno = unit_no * p.ofs_unit;
   825			if (segno >= last_segment) {
   826				if (sm->last_victim[p.gc_mode]) {
   827					last_segment =
   828						sm->last_victim[p.gc_mode];
   829					sm->last_victim[p.gc_mode] = 0;
   830					p.offset = 0;
   831					continue;
   832				}
   833				break;
   834			}
   835	
   836			p.offset = segno + p.ofs_unit;
   837			nsearched++;
   838	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
