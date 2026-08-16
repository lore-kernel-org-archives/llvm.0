Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B5C3939A6;
	Sun, 16 Aug 2026 12:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786882042; cv=none; b=bGSjJVQV6SMpUz1jgro04QhgjUS29HTcNDEiIs4e06y4mMOOgk8WY9kthh3Q7hKtrOyJTWLC3y5GenQMHc/KRjs02wm4Xe5+zQx1Y+VjqwxdBjWlREBs28PZR/s2A6rr+Ee/wmDZxVp+N/dLSKOqZR24sPxOrSTpGgKvdoJWA3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786882042; c=relaxed/simple;
	bh=d19J/x1eOMURw1RAJXD4kSq13IN7xDHsMkAFvOjf0kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W2543hdaiabTcAMkc4Z/H/bIvia4/tJO5ej5BI/EeS2qbIE5m1UVsoPKe215VurzfLCnFHcvCimuscqfZHjkub/ZaeIchW2eHGHFv7P556sxwIYWl/4hOndEKU8eMwnG22HC50/HUKUBwmExELPD3dIp9sYUnHvw1KO4AQUn7D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RzptX/Uk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RzptX/Uk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786882040; x=1818418040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d19J/x1eOMURw1RAJXD4kSq13IN7xDHsMkAFvOjf0kk=;
  b=RzptX/Uk/EoR6NJPSNWXJUHFSKdhBMQz1tGRRcgcZHUAQQG7WHEbjZLp
   xnYxHt08k8MlcI7mwe892Xh2EI83MSYugN3QWYqD9DK17KS/xT/vIb0ky
   HyDTcSjJQwOt3jB4foHzoiVCe84lUBRuliwayNjDeQp6y4lzzjvAsM/rf
   2WkJfcKqUFUd9hYSDPGP9zvrairYbXmHuGGTkkRhqLymbFSeEBTcUXY/n
   DsXlDDPIWuzjps4Hx6yqcidrZcyvGIcwllQul+Ht8hLVVCHAIjM6K7T1Q
   p4C7G7bAkv9vuFgaQgV7mqkEC4VK2tleLuiTp7sqdNtyhATZxyXujMYkm
   w==;
X-CSE-ConnectionGUID: 3nzhzPb9S1eUOOOiQhMeQQ==
X-CSE-MsgGUID: 3T58NayCR9qOysyoYgac9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="98898412"
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="98898412"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 05:07:19 -0700
X-CSE-ConnectionGUID: bxWzaY0XS4m10qc15yh5ZA==
X-CSE-MsgGUID: Q3T9vJhsTpiJKT8dHeXdyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,226,1779174000"; 
   d="scan'208";a="262895917"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 16 Aug 2026 05:07:19 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvZdz-000000006aP-39ZW;
	Sun, 16 Aug 2026 12:07:15 +0000
Date: Sun, 16 Aug 2026 14:06:22 +0200
From: kernel test robot <lkp@intel.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jaegeuk Kim <jaegeuk@kernel.org>
Subject: Re: [PATCH] f2fs: call __add_ino_entry out of the eviction path
Message-ID: <202608161433.5IIhxngb-lkp@intel.com>
References: <20260804002027.2196300-1-jaegeuk@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804002027.2196300-1-jaegeuk@kernel.org>

Hi Jaegeuk,

kernel test robot noticed the following build errors:

[auto build test ERROR on v7.2-rc7]
[also build test ERROR on linus/master]
[cannot apply to jaegeuk-f2fs/dev-test jaegeuk-f2fs/dev next-20260814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jaegeuk-Kim/f2fs-call-__add_ino_entry-out-of-the-eviction-path/20260815-151820
base:   v7.2-rc7
patch link:    https://lore.kernel.org/r/20260804002027.2196300-1-jaegeuk%40kernel.org
patch subject: [PATCH] f2fs: call __add_ino_entry out of the eviction path
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260816/202608161433.5IIhxngb-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608161433.5IIhxngb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608161433.5IIhxngb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/f2fs/inode.c:1051:6: error: call to undeclared function 'current_is_kswapd'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1051 |         if (current_is_kswapd()) {
         |             ^
   1 error generated.


vim +/current_is_kswapd +1051 fs/f2fs/inode.c

   887	
   888	/*
   889	 * Called at the last iput() if i_nlink is zero
   890	 */
   891	void f2fs_evict_inode(struct inode *inode)
   892	{
   893		struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
   894		struct f2fs_inode_info *fi = F2FS_I(inode);
   895		nid_t xnid = fi->i_xattr_nid;
   896		int err = 0;
   897		bool freeze_protected = false;
   898		unsigned int record_bits = 0;
   899	
   900		f2fs_abort_atomic_write(inode, true);
   901	
   902		if (fi->cow_inode && f2fs_is_cow_file(fi->cow_inode)) {
   903			struct inode *cow_inode = fi->cow_inode;
   904	
   905			f2fs_down_write(&F2FS_I(cow_inode)->i_sem);
   906			clear_inode_flag(cow_inode, FI_COW_FILE);
   907			F2FS_I(cow_inode)->atomic_inode = NULL;
   908			fi->cow_inode = NULL;
   909			f2fs_up_write(&F2FS_I(cow_inode)->i_sem);
   910	
   911			iput(cow_inode);
   912		}
   913	
   914		trace_f2fs_evict_inode(inode);
   915		truncate_inode_pages_final(&inode->i_data);
   916	
   917		if ((inode->i_nlink || is_bad_inode(inode)) &&
   918			test_opt(sbi, COMPRESS_CACHE) && f2fs_compressed_file(inode))
   919			f2fs_invalidate_compress_pages(sbi, inode->i_ino);
   920	
   921		if (inode->i_ino == F2FS_NODE_INO(sbi) ||
   922				inode->i_ino == F2FS_META_INO(sbi) ||
   923				inode->i_ino == F2FS_COMPRESS_INO(sbi))
   924			goto out_clear;
   925	
   926		f2fs_bug_on(sbi, get_dirty_pages(inode));
   927		f2fs_remove_dirty_inode(inode);
   928		f2fs_remove_donate_inode(inode);
   929	
   930		if (!IS_DEVICE_ALIASING(inode))
   931			f2fs_destroy_extent_tree(inode);
   932	
   933		if (inode->i_nlink || is_bad_inode(inode))
   934			goto no_delete;
   935	
   936		err = f2fs_dquot_initialize(inode);
   937		if (err) {
   938			err = 0;
   939			set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
   940		}
   941	
   942		f2fs_remove_ino_entry(sbi, inode->i_ino, APPEND_INO);
   943		f2fs_remove_ino_entry(sbi, inode->i_ino, UPDATE_INO);
   944		f2fs_remove_ino_entry(sbi, inode->i_ino, FLUSH_INO);
   945	
   946		if (!is_sbi_flag_set(sbi, SBI_IS_FREEZING)) {
   947			sb_start_intwrite(inode->i_sb);
   948			freeze_protected = true;
   949		}
   950		set_inode_flag(inode, FI_NO_ALLOC);
   951		i_size_write(inode, 0);
   952	retry:
   953		if (F2FS_HAS_BLOCKS(inode))
   954			err = f2fs_truncate(inode);
   955	
   956		if (time_to_inject(sbi, FAULT_EVICT_INODE))
   957			err = -EIO;
   958	
   959		if (!err) {
   960			struct f2fs_lock_context lc;
   961	
   962			f2fs_lock_op(sbi, &lc);
   963			err = f2fs_remove_inode_page(inode);
   964			f2fs_unlock_op(sbi, &lc);
   965			if (err == -ENOENT) {
   966				err = 0;
   967	
   968				/*
   969				 * in fuzzed image, another node may has the same
   970				 * block address as inode's, if it was truncated
   971				 * previously, truncation of inode node will fail.
   972				 */
   973				if (is_inode_flag_set(inode, FI_DIRTY_INODE)) {
   974					f2fs_warn(F2FS_I_SB(inode),
   975						"f2fs_evict_inode: inconsistent node id, ino:%llu",
   976						inode->i_ino);
   977					f2fs_inode_synced(inode);
   978					set_sbi_flag(sbi, SBI_NEED_FSCK);
   979				}
   980			}
   981		}
   982	
   983		/* give more chances, if ENOMEM case */
   984		if (err == -ENOMEM) {
   985			err = 0;
   986			goto retry;
   987		}
   988	
   989		if (IS_DEVICE_ALIASING(inode))
   990			f2fs_destroy_extent_tree(inode);
   991	
   992		if (err) {
   993			f2fs_update_inode_page(inode);
   994			if (dquot_initialize_needed(inode))
   995				set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
   996	
   997			/*
   998			 * If both f2fs_truncate() and f2fs_update_inode_page() failed
   999			 * due to fuzzed corrupted inode, call f2fs_inode_synced() to
  1000			 * avoid triggering later f2fs_bug_on().
  1001			 */
  1002			if (is_inode_flag_set(inode, FI_DIRTY_INODE)) {
  1003				f2fs_warn(sbi,
  1004					"f2fs_evict_inode: inode is dirty, ino:%llu",
  1005					inode->i_ino);
  1006				f2fs_inode_synced(inode);
  1007				set_sbi_flag(sbi, SBI_NEED_FSCK);
  1008			}
  1009		}
  1010		if (freeze_protected)
  1011			sb_end_intwrite(inode->i_sb);
  1012	no_delete:
  1013		dquot_drop(inode);
  1014	
  1015		stat_dec_inline_xattr(inode);
  1016		stat_dec_inline_dir(inode);
  1017		stat_dec_inline_inode(inode);
  1018		stat_dec_compr_inode(inode);
  1019		stat_sub_compr_blocks(inode,
  1020				atomic_read(&fi->i_compr_blocks));
  1021	
  1022		if (likely(!f2fs_cp_error(sbi) &&
  1023					!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
  1024			f2fs_bug_on(sbi, is_inode_flag_set(inode, FI_DIRTY_INODE));
  1025	
  1026		/*
  1027		 * anyway, it needs to remove the inode from sbi->inode_list[DIRTY_META]
  1028		 * list to avoid UAF in f2fs_sync_inode_meta() during checkpoint.
  1029		 */
  1030		f2fs_inode_synced(inode);
  1031	
  1032		/* for the case f2fs_new_inode() was failed, .i_ino is zero, skip it */
  1033		if (inode->i_ino)
  1034			invalidate_mapping_pages(NODE_MAPPING(sbi), inode->i_ino,
  1035								inode->i_ino);
  1036		if (xnid)
  1037			invalidate_mapping_pages(NODE_MAPPING(sbi), xnid, xnid);
  1038	
  1039		if (!inode->i_nlink)
  1040			goto skip_record;
  1041	
  1042		if (is_inode_flag_set(inode, FI_APPEND_WRITE))
  1043			record_bits = BIT(APPEND_INO);
  1044		if (is_inode_flag_set(inode, FI_UPDATE_WRITE))
  1045			record_bits = BIT(UPDATE_INO);
  1046	
  1047		if (!record_bits)
  1048			goto skip_record;
  1049	
  1050		/* Let's do this in workqueue out of the direct reclaim path. */
> 1051		if (current_is_kswapd()) {
  1052			f2fs_record_inode_state(sbi, inode->i_ino, record_bits);
  1053		} else {
  1054			struct evict_inode_work *ew =
  1055				mempool_alloc(evict_inode_work_pool, GFP_NOFS);
  1056	
  1057			ew->sbi = sbi;
  1058			ew->ino = inode->i_ino;
  1059			ew->add_ino_entry_bits = record_bits;
  1060			INIT_WORK(&ew->work, f2fs_evict_inode_work);
  1061			queue_work(sbi->evict_wq, &ew->work);
  1062		}
  1063	skip_record:
  1064		if (is_inode_flag_set(inode, FI_FREE_NID)) {
  1065			f2fs_alloc_nid_failed(sbi, inode->i_ino);
  1066			clear_inode_flag(inode, FI_FREE_NID);
  1067		} else {
  1068			/*
  1069			 * If xattr nid is corrupted, we can reach out error condition,
  1070			 * err & !f2fs_exist_written_data(sbi, inode->i_ino, ORPHAN_INO)).
  1071			 * In that case, f2fs_check_nid_range() is enough to give a clue.
  1072			 */
  1073		}
  1074	out_clear:
  1075		fscrypt_put_encryption_info(inode);
  1076		clear_inode(inode);
  1077	}
  1078	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
