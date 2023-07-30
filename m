Received: from mgamail.intel.com (unknown [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFBFE565;
	Sun, 30 Jul 2023 17:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690738910; x=1722274910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3/IvuaZiw1J2Iu62MLuZEpUdgtbNY4eoQTSeAszgu3o=;
  b=HV628HjpF/m8jzq09UrGyjsF4gPISrDvuAwC0b7OGtjy2KElfxVR8Bl2
   DA/B4mK4jwFHoFwAvO6mUr5fJGCuX5QX5zbamGBfbckUakliqA7cw/psg
   Udq06XYRWlcHpUgVjFY1XflCx2p07xxQm5uJL/978O1TWIiRWD2mjQy4M
   +UyLwmsKIz1E7UJVqO2SDeMomaMIpsvXKuOFWXovpuFe5ZzXj6PFYPuLc
   QZfbPskWkT3gpIgPyeTKgf88CQXjC7itGgNePR2coT4houN5573egZSob
   fbEexCVCy2HMrOfngXnHlxpvTwajWnFjhLkeBLFpiEnI/t7TxyhFJaolG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="455235214"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="455235214"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 10:41:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="974640969"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="974640969"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 30 Jul 2023 10:41:48 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQAQN-0004if-27;
	Sun, 30 Jul 2023 17:41:47 +0000
Date: Mon, 31 Jul 2023 01:40:51 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Subject: [chao:dev-test 4/8] fs/f2fs/gc.c:1843:4: error: call to undeclared
 function 'stat_inc_cp_call_count'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202307310126.tGW78dZh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git dev-test
head:   e116872fdeb425635580ffa6b237b96c39bc6611
commit: 1a73e225829f7724fcac9191f47e4ac41c6ef2e3 [4/8] f2fs: fix to account cp stats correctly
config: x86_64-randconfig-x014-20230730 (https://download.01.org/0day-ci/archive/20230731/202307310126.tGW78dZh-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307310126.tGW78dZh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307310126.tGW78dZh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/f2fs/gc.c:1843:4: error: call to undeclared function 'stat_inc_cp_call_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           stat_inc_cp_call_count(sbi, FOREGROUND);
                           ^
   fs/f2fs/gc.c:1892:4: error: call to undeclared function 'stat_inc_cp_call_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           stat_inc_cp_call_count(sbi, FOREGROUND);
                           ^
   fs/f2fs/gc.c:1908:3: error: call to undeclared function 'stat_inc_cp_call_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   stat_inc_cp_call_count(sbi, FOREGROUND);
                   ^
   fs/f2fs/gc.c:2036:2: error: call to undeclared function 'stat_inc_cp_call_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           stat_inc_cp_call_count(sbi, FOREGROUND);
           ^
   fs/f2fs/gc.c:2229:2: error: call to undeclared function 'stat_inc_cp_call_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           stat_inc_cp_call_count(sbi, FOREGROUND);
           ^
   5 errors generated.
--
>> fs/f2fs/namei.c:387:3: error: call to undeclared function 'stat_inc_cp_call_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   stat_inc_cp_call_count(sbi, FOREGROUND);
                   ^
   fs/f2fs/namei.c:438:3: error: call to undeclared function 'stat_inc_cp_call_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   stat_inc_cp_call_count(sbi, FOREGROUND);
                   ^
   fs/f2fs/namei.c:659:3: error: call to undeclared function 'stat_inc_cp_call_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   stat_inc_cp_call_count(sbi, FOREGROUND);
                   ^
   fs/f2fs/namei.c:746:4: error: call to undeclared function 'stat_inc_cp_call_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           stat_inc_cp_call_count(sbi, FOREGROUND);
                           ^
   fs/f2fs/namei.c:799:3: error: call to undeclared function 'stat_inc_cp_call_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   stat_inc_cp_call_count(sbi, FOREGROUND);
                   ^
   fs/f2fs/namei.c:855:3: error: call to undeclared function 'stat_inc_cp_call_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   stat_inc_cp_call_count(sbi, FOREGROUND);
                   ^
   fs/f2fs/namei.c:1138:3: error: call to undeclared function 'stat_inc_cp_call_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   stat_inc_cp_call_count(sbi, FOREGROUND);
                   ^
   fs/f2fs/namei.c:1303:3: error: call to undeclared function 'stat_inc_cp_call_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   stat_inc_cp_call_count(sbi, FOREGROUND);
                   ^
   8 errors generated.
--
>> fs/f2fs/segment.c:516:2: error: call to undeclared function 'stat_inc_cp_call_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           stat_inc_cp_call_count(sbi, from_bg ? BACKGROUND : FOREGROUND);
           ^
   fs/f2fs/segment.c:3234:2: error: call to undeclared function 'stat_inc_cp_call_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           stat_inc_cp_call_count(sbi, FOREGROUND);
           ^
   2 errors generated.
--
>> fs/f2fs/recovery.c:927:4: error: call to undeclared function 'stat_inc_cp_call_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           stat_inc_cp_call_count(sbi, FOREGROUND);
                           ^
   1 error generated.
--
>> fs/f2fs/super.c:1604:3: error: call to undeclared function 'stat_inc_cp_call_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   stat_inc_cp_call_count(sbi, FOREGROUND);
                   ^
   fs/f2fs/super.c:1614:3: error: call to undeclared function 'stat_inc_cp_call_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   stat_inc_cp_call_count(sbi, FOREGROUND);
                   ^
   fs/f2fs/super.c:2237:2: error: call to undeclared function 'stat_inc_cp_call_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           stat_inc_cp_call_count(sbi, FOREGROUND);
           ^
   fs/f2fs/super.c:2274:2: error: call to undeclared function 'stat_inc_cp_call_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           stat_inc_cp_call_count(sbi, FOREGROUND);
           ^
   fs/f2fs/super.c:2450:3: error: call to undeclared function 'stat_inc_cp_call_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   stat_inc_cp_call_count(sbi, FOREGROUND);
                   ^
   5 errors generated.
--
>> fs/f2fs/file.c:323:3: error: call to undeclared function 'stat_inc_cp_call_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   stat_inc_cp_call_count(sbi, FOREGROUND);
                   ^
   fs/f2fs/file.c:2251:3: error: call to undeclared function 'stat_inc_cp_call_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   stat_inc_cp_call_count(sbi, FOREGROUND);
                   ^
   fs/f2fs/file.c:2573:2: error: call to undeclared function 'stat_inc_cp_call_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           stat_inc_cp_call_count(sbi, FOREGROUND);
           ^
   3 errors generated.


vim +/stat_inc_cp_call_count +1843 fs/f2fs/gc.c

  1796	
  1797	int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
  1798	{
  1799		int gc_type = gc_control->init_gc_type;
  1800		unsigned int segno = gc_control->victim_segno;
  1801		int sec_freed = 0, seg_freed = 0, total_freed = 0, total_sec_freed = 0;
  1802		int ret = 0;
  1803		struct cp_control cpc;
  1804		struct gc_inode_list gc_list = {
  1805			.ilist = LIST_HEAD_INIT(gc_list.ilist),
  1806			.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
  1807		};
  1808		unsigned int skipped_round = 0, round = 0;
  1809		unsigned int upper_secs;
  1810	
  1811		trace_f2fs_gc_begin(sbi->sb, gc_type, gc_control->no_bg_gc,
  1812					gc_control->nr_free_secs,
  1813					get_pages(sbi, F2FS_DIRTY_NODES),
  1814					get_pages(sbi, F2FS_DIRTY_DENTS),
  1815					get_pages(sbi, F2FS_DIRTY_IMETA),
  1816					free_sections(sbi),
  1817					free_segments(sbi),
  1818					reserved_segments(sbi),
  1819					prefree_segments(sbi));
  1820	
  1821		cpc.reason = __get_cp_reason(sbi);
  1822	gc_more:
  1823		sbi->skipped_gc_rwsem = 0;
  1824		if (unlikely(!(sbi->sb->s_flags & SB_ACTIVE))) {
  1825			ret = -EINVAL;
  1826			goto stop;
  1827		}
  1828		if (unlikely(f2fs_cp_error(sbi))) {
  1829			ret = -EIO;
  1830			goto stop;
  1831		}
  1832	
  1833		/* Let's run FG_GC, if we don't have enough space. */
  1834		if (has_not_enough_free_secs(sbi, 0, 0)) {
  1835			gc_type = FG_GC;
  1836	
  1837			/*
  1838			 * For example, if there are many prefree_segments below given
  1839			 * threshold, we can make them free by checkpoint. Then, we
  1840			 * secure free segments which doesn't need fggc any more.
  1841			 */
  1842			if (prefree_segments(sbi)) {
> 1843				stat_inc_cp_call_count(sbi, FOREGROUND);
  1844				ret = f2fs_write_checkpoint(sbi, &cpc);
  1845				if (ret)
  1846					goto stop;
  1847				/* Reset due to checkpoint */
  1848				sec_freed = 0;
  1849			}
  1850		}
  1851	
  1852		/* f2fs_balance_fs doesn't need to do BG_GC in critical path. */
  1853		if (gc_type == BG_GC && gc_control->no_bg_gc) {
  1854			ret = -EINVAL;
  1855			goto stop;
  1856		}
  1857	retry:
  1858		ret = __get_victim(sbi, &segno, gc_type);
  1859		if (ret) {
  1860			/* allow to search victim from sections has pinned data */
  1861			if (ret == -ENODATA && gc_type == FG_GC &&
  1862					f2fs_pinned_section_exists(DIRTY_I(sbi))) {
  1863				f2fs_unpin_all_sections(sbi, false);
  1864				goto retry;
  1865			}
  1866			goto stop;
  1867		}
  1868	
  1869		seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type,
  1870					gc_control->should_migrate_blocks);
  1871		total_freed += seg_freed;
  1872	
  1873		if (seg_freed == f2fs_usable_segs_in_sec(sbi, segno)) {
  1874			sec_freed++;
  1875			total_sec_freed++;
  1876		}
  1877	
  1878		if (gc_type == FG_GC) {
  1879			sbi->cur_victim_sec = NULL_SEGNO;
  1880	
  1881			if (has_enough_free_secs(sbi, sec_freed, 0)) {
  1882				if (!gc_control->no_bg_gc &&
  1883				    total_sec_freed < gc_control->nr_free_secs)
  1884					goto go_gc_more;
  1885				goto stop;
  1886			}
  1887			if (sbi->skipped_gc_rwsem)
  1888				skipped_round++;
  1889			round++;
  1890			if (skipped_round > MAX_SKIP_GC_COUNT &&
  1891					skipped_round * 2 >= round) {
  1892				stat_inc_cp_call_count(sbi, FOREGROUND);
  1893				ret = f2fs_write_checkpoint(sbi, &cpc);
  1894				goto stop;
  1895			}
  1896		} else if (has_enough_free_secs(sbi, 0, 0)) {
  1897			goto stop;
  1898		}
  1899	
  1900		__get_secs_required(sbi, NULL, &upper_secs, NULL);
  1901	
  1902		/*
  1903		 * Write checkpoint to reclaim prefree segments.
  1904		 * We need more three extra sections for writer's data/node/dentry.
  1905		 */
  1906		if (free_sections(sbi) <= upper_secs + NR_GC_CHECKPOINT_SECS &&
  1907					prefree_segments(sbi)) {
  1908			stat_inc_cp_call_count(sbi, FOREGROUND);
  1909			ret = f2fs_write_checkpoint(sbi, &cpc);
  1910			if (ret)
  1911				goto stop;
  1912			/* Reset due to checkpoint */
  1913			sec_freed = 0;
  1914		}
  1915	go_gc_more:
  1916		segno = NULL_SEGNO;
  1917		goto gc_more;
  1918	
  1919	stop:
  1920		SIT_I(sbi)->last_victim[ALLOC_NEXT] = 0;
  1921		SIT_I(sbi)->last_victim[FLUSH_DEVICE] = gc_control->victim_segno;
  1922	
  1923		if (gc_type == FG_GC)
  1924			f2fs_unpin_all_sections(sbi, true);
  1925	
  1926		trace_f2fs_gc_end(sbi->sb, ret, total_freed, total_sec_freed,
  1927					get_pages(sbi, F2FS_DIRTY_NODES),
  1928					get_pages(sbi, F2FS_DIRTY_DENTS),
  1929					get_pages(sbi, F2FS_DIRTY_IMETA),
  1930					free_sections(sbi),
  1931					free_segments(sbi),
  1932					reserved_segments(sbi),
  1933					prefree_segments(sbi));
  1934	
  1935		f2fs_up_write(&sbi->gc_lock);
  1936	
  1937		put_gc_inode(&gc_list);
  1938	
  1939		if (gc_control->err_gc_skipped && !ret)
  1940			ret = total_sec_freed ? 0 : -EAGAIN;
  1941		return ret;
  1942	}
  1943	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
